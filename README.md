# ExampleIG

Robohand/復健 App 的實作樣板：  
- **FHIR Implementation Guide (IG)**：使用 SUSHI 產生的靜態網站（`output/`）。  
- **Flask API（BFF）**：對接 FHIR 伺服器，提供前端可用的精簡端點（`/api`）。  
- **前端 App（純 HTML/CSS/JS）**：搜尋病人、顯示 Patient Summary 與最新 ARAT（`/app`）。  
- **GitHub Pages**：發佈靜態網站與前端 App。

> 線上頁面（GitHub Pages）：  
> `https://jasonwang2308.github.io/ExampleIG/`  
> 前端 App：  
> `https://jasonwang2308.github.io/ExampleIG/index.html`（或 `/app/index.html`，依你的 gh-pages 內容而定）

---

## 目錄結構

```
ExampleIG/
├─ api/                     # Flask 後端（BFF）
│  ├─ app.py
│  ├─ requirements.txt
│  ├─ .env.example
│  └─ .env                 # 本機環境變數（不提交）
├─ app/                     # 前端（純靜態）
│  ├─ index.html            # 主頁：搜尋病人、顯示 Summary/ARAT
│  ├─ launch.html           # SMART 授權啟動頁（可選）
│  ├─ callback.html         # OAuth 回調頁（可選）
│  ├─ logo_rehabotics.png
│  └─ logo_fubon.png
├─ input/                   # FSH 原始檔（你的 IG 來源）
├─ output/                  # IG Publisher 產出的靜態網站
├─ sushi-config.yaml
└─ README.md
```

---

## 快速開始

### 需求
- Python 3.11+（建議）
- Git / VS Code（可選）
- Windows PowerShell（本文指令以 Windows 為例）

### 1) 啟動 Flask API（本機）
```powershell
cd C:\Users\USER\Desktop\IGtest\ExampleIG\api
python -m venv .venv
.\.venv\Scripts\Activate.ps1
pip install -r requirements.txt

# 建立 .env（可複製自 .env.example）
copy .env.example .env
# 預設會用公開 HAPI（不用 OAuth）
# FHIR_BASE=https://hapi.fhir.org/baseR4

python app.py
# -> Running on http://127.0.0.1:5000
```

### 2) 啟動前端（本機）
```powershell
cd C:\Users\USER\Desktop\IGtest\ExampleIG\app
python -m http.server 8000
# -> http://127.0.0.1:8000/index.html
```

---

## API（BFF）端點

| Method | Path | 說明 |
|---|---|---|
| GET | `/api/health` | 健康檢查 |
| GET | `/api/patient/search?name=smith&_count=10` | 搜尋病人（回傳 id/name/gender/birthDate） |
| GET | `/api/patient/{id}/summary` | 病人摘要（name/gender/birthDate） |
| GET | `/api/patient/{id}/arat` | 取得最近一次 ARAT 的整理（若無則 `latest:null`） |
| GET | `/api/patient/{id}/raw` | 代理回原始 `Patient/{id}` JSON |
| GET | `/api/oauth/callback?code=...` | SMART 授權回調（可選） |

> 預設 `FHIR_BASE` 指向公開 HAPI，因此不需登入即可 DEMO。  
> 若接醫院或 SMART Sandbox，請設定 OAuth 並在伺服器端驗證 token。

---

## 前端 App

- `index.html`：搜尋病人、顯示 Summary 與最新 ARAT（呼叫上表端點）
- `launch.html`／`callback.html`：SMART on FHIR 授權流程（**可選**；接到真正 EHR 時使用）
- 主題：白底＋抹茶綠，含公司 LOGO（請放於 `app/`）

> 若你將 Flask API 部署到雲端，請把 `index.html` 內的  
> `const API = "http://127.0.0.1:5000/api"` 改為你的雲端 API URL。

---

## 發佈到 GitHub Pages

> 本專案使用 `gh-pages` 分支承載靜態網站。

### 發佈 `app/` 到 gh-pages（一次或更新）
```powershell
cd C:\Users\USER\Desktop\IGtest\ExampleIG
git fetch origin
git subtree split --prefix app -b gh-pages-tmp
git push origin gh-pages-tmp:gh-pages --force
git branch -D gh-pages-tmp
```

### 設定 Pages（只需一次）
- Repo → **Settings → Pages**
  - **Source**：Deploy from a branch
  - **Branch**：`gh-pages` / `(root)`
- 等 1–2 分鐘即可於：  
  `https://jasonwang2308.github.io/ExampleIG/index.html`

> 若你也要發佈 IG（`output/`），可改推 `output` 到 `gh-pages`，或放在同分支根目錄（避免檔名衝突）。

---

##（可選）自動部署（GitHub Actions）

```yaml
name: Deploy app to gh-pages
on:
  push:
    branches: [ main ]
jobs:
  deploy:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
        with:
          fetch-depth: 0
      - name: Build subtree
        run: |
          git subtree split --prefix app -b gh-pages-tmp
          git push origin gh-pages-tmp:gh-pages --force
```

---

## 授權條款

```
MIT License © 2025 Jason Wang
```
