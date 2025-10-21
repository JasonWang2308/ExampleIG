// ============================================
// Profile 定義：評估問卷
// ============================================
Profile: SPACQuestionnaireResponse
Parent: QuestionnaireResponse
Id: SPACQuestionnaireResponse
Title: "評估問卷回覆"
Description: "問卷回覆的結構化定義，實際問回覆內容可參考Examples，可依據前者內容做為範本進行擴充"

* questionnaire 0..1 MS
* status 1..1 MS
* subject 1..1 MS
* subject.reference 1..1 MS
* authored 1..1 MS
* author 0..1 MS
* author.reference 1..1 MS
* source 0..1 MS
* source.reference 1..1 MS
* item 1..* MS
* item.linkId 1..1 MS
* item.text 0..1 MS
* item.answer 0..* MS
* item.answer.value[x] 0..1 MS
* item.item 0..* MS