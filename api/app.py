from flask import Flask, jsonify, request, redirect
from flask_cors import CORS
import os, requests
from dotenv import load_dotenv

load_dotenv()

FHIR_BASE = os.getenv("FHIR_BASE", "https://hapi.fhir.org/baseR4")
AUTH_TOKEN_URL = os.getenv("AUTH_TOKEN_URL")      # SMART sandbox 會給
CLIENT_ID = os.getenv("CLIENT_ID")
CLIENT_SECRET = os.getenv("CLIENT_SECRET")
REDIRECT_URI = os.getenv("REDIRECT_URI", "http://127.0.0.1:5000/api/oauth/callback")

app = Flask(__name__)
CORS(app)

TOKENS = {}  # demo：把 access_token 暫存記憶體；正式可改 session/DB

# ---------- 小工具 ----------
def http_get_json(url, params=None, headers=None):
    r = requests.get(url, params=params or {}, headers=headers or {})
    ct = r.headers.get("Content-Type","")
    if r.status_code != 200:
        # 盡量把 FHIR 的 OperationOutcome 回傳出去
        try:
            return r.status_code, r.json()
        except Exception:
            return r.status_code, {"issue":[{"severity":"error","diagnostics":r.text}]}
    try:
        return 200, r.json()
    except Exception:
        return 500, {"issue":[{"severity":"error","diagnostics":"invalid json from upstream"}]}

def pretty_name(p):
    name = ""
    if p.get("name"):
        n0 = p["name"][0]
        name = n0.get("text") or (" ".join(n0.get("given", [])) + " " + n0.get("family","")).strip()
    return name or "Unknown"

def auth_headers():
    token = TOKENS.get("access_token")
    return {"Authorization": f"Bearer {token}"} if token else {}

# ---------- 健康檢查 ----------
@app.get("/api/health")
def health():
    return {"ok": True}

# ---------- 原樣代理：Patient/{id} ----------
@app.get("/api/patient/<pid>/raw")
def patient_raw(pid):
    r = requests.get(f"{FHIR_BASE}/Patient/{pid}", headers=auth_headers())
    return (r.text, r.status_code, {"Content-Type":"application/fhir+json"})

# ---------- 摘要：Patient 基本資訊 ----------
@app.get("/api/patient/<pid>/summary")
def patient_summary(pid):
    status, p = http_get_json(f"{FHIR_BASE}/Patient/{pid}", headers=auth_headers())
    if status != 200:
        return jsonify({"error":"patient_not_found","details":p}), status
    return jsonify({
        "patient": {
            "id": pid,
            "name": pretty_name(p),
            "gender": p.get("gender",""),
            "birthDate": p.get("birthDate","")
        },
        "encounters": None,
        "latestForm": None
    })

# ---------- 新增：搜尋病人 ----------
# 例：/api/patient/search?name=smith&_count=10
@app.get("/api/patient/search")
def patient_search():
    name = request.args.get("name","")
    count = int(request.args.get("_count", "10"))
    params = {"_count": count}
    if name:
        params["name"] = name
    status, bundle = http_get_json(f"{FHIR_BASE}/Patient", params=params, headers=auth_headers())
    if status != 200:
        return jsonify({"error":"search_failed","details":bundle}), status

    results = []
    for e in bundle.get("entry", []):
        res = e.get("resource", {})
        results.append({
            "id": res.get("id"),
            "name": pretty_name(res),
            "gender": res.get("gender",""),
            "birthDate": res.get("birthDate","")
        })
    return jsonify({"count": len(results), "patients": results})

# ---------- 新增：ARAT 問卷摘要（抓最近一次 QR） ----------
# 嘗試依序搜尋 Questionnaire：code=ARAT、name:contains=ARAT、title:contains=ARAT
@app.get("/api/patient/<pid>/arat")
def patient_arat(pid):
    qid = None
    # 1) 找 Questionnaire
    queries = [
        {"code": "ARAT", "_count": 1},
        {"name:contains": "ARAT", "_count": 1},
        {"title:contains": "ARAT", "_count": 1},
    ]
    for params in queries:
        status, qb = http_get_json(f"{FHIR_BASE}/Questionnaire", params=params, headers=auth_headers())
        if status == 200 and qb.get("entry"):
            qid = qb["entry"][0]["resource"].get("id")
            break

    # 2) 找此病人最新的 QuestionnaireResponse
    qr_params = {"patient": pid, "_sort": "-authored", "_count": 1}
    if qid:
        qr_params["questionnaire"] = f"Questionnaire/{qid}"
    status, qrb = http_get_json(f"{FHIR_BASE}/QuestionnaireResponse", params=qr_params, headers=auth_headers())
    if status != 200:
        return jsonify({"error":"qr_search_failed","details":qrb, "questionnaireId": qid}), status

    if not qrb.get("entry"):
        return jsonify({
            "patientId": pid,
            "questionnaireId": qid,
            "latest": None,
            "note": "No QuestionnaireResponse found for this patient (or ARAT not available)."
        })

    qr = qrb["entry"][0]["resource"]
    # 3) 抽取可讀摘要（不強求總分，保守回傳 item 與答案）
    def extract_items(items):
        out = []
        for it in items or []:
            ans = it.get("answer", [])
            val = None
            if ans:
                a = ans[0]
                for k in ("valueInteger","valueDecimal","valueString","valueCoding","valueBoolean"):
                    if k in a:
                        val = a[k]
                        break
            out.append({
                "linkId": it.get("linkId"),
                "text": it.get("text"),
                "value": val
            })
            # 若有子項目
            if it.get("item"):
                out.extend(extract_items(it.get("item")))
        return out

    items = extract_items(qr.get("item", []))

    return jsonify({
        "patientId": pid,
        "questionnaireId": qid,
        "latest": {
            "responseId": qr.get("id"),
            "authored": qr.get("authored"),
            "status": qr.get("status"),
            "items": items
        }
    })

# ---------- 新增：SMART 授權回調（之後接 Sandbox 用） ----------
@app.get("/api/oauth/callback")
def oauth_callback():
    code = request.args.get("code")
    if not code:
        return "missing code", 400
    if not AUTH_TOKEN_URL or not CLIENT_ID:
        return "server not configured for SMART (set AUTH_TOKEN_URL/CLIENT_ID in .env)", 500

    data = {
        "grant_type": "authorization_code",
        "code": code,
        "redirect_uri": REDIRECT_URI,
        "client_id": CLIENT_ID
    }
    if CLIENT_SECRET:
        data["client_secret"] = CLIENT_SECRET

    resp = requests.post(AUTH_TOKEN_URL, data=data)
    if resp.status_code != 200:
        return f"token error: {resp.text}", 400

    TOKENS["access_token"] = resp.json().get("access_token")
    # 這裡先簡單回文字；之後可改成 redirect 到你的前端頁面
    return "OK. Access token stored on server."

# ---------- 啟動 ----------
if __name__ == "__main__":
    app.run(host="127.0.0.1", port=5000, debug=True)
