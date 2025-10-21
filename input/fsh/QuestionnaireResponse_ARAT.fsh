Alias: $snomed = http://snomed.info/sct

// ============================================
// 測試時間擴展
// ============================================
Extension: TestTimeExtension
Id: test-time-extension
Title: "測試時間擴展"
Description: "記錄單一測試項目的完成時間"
Context: QuestionnaireResponse.item
* value[x] only time

// ============================================
// ARAT QuestionnaireResponse Profile
// ============================================
Profile: ARATQuestionnaireResponse
Parent: SPACQuestionnaireResponse
Id: ARATQuestionnaireResponse
Title: "ARAT上肢功能評估問卷回覆"
Description: "針對ARAT上肢功能評估問卷的QuestionnaireResponse Profile，強制回傳格式符合問卷結構"

// 固定問卷參考
* questionnaire = "http://example.org/fhir/Questionnaire/arat-questionnaire" (exactly)
//* meta.profile contains "http://example.org/fhir/StructureDefinition/arat-questionnaire-response"

// 基本約束
* status = #completed
* subject 1..1
* subject only Reference(Patient)
* authored 1..1

// ============================================
// 第一層 item slicing
// ============================================
* item ^slicing.discriminator.type = #value
* item ^slicing.discriminator.path = "linkId"
* item ^slicing.rules = #closed
* item ^slicing.ordered = false
* item ^slicing.description = "根據linkId區分ARAT問卷的主要區塊"

* item contains
    assessmentSide 1..1 MS and
    graspSubscale 1..1 MS and
    gripSubscale 1..1 MS and
    pinchSubscale 1..1 MS and
    grossMovementSubscale 1..1 MS and
    totalScoreSection 1..1 MS

// ============================================
// 評估側別選擇
// ============================================
* item[assessmentSide].linkId = "assessment-side" (exactly)
* item[assessmentSide].text = "請選擇評估側"
* item[assessmentSide].answer 1..1
* item[assessmentSide].answer.value[x] only Coding
* item[assessmentSide].answer.valueCoding from AssessmentSideValueSet (required)

// ============================================
// Section A: 掌握分量表
// ============================================
* item[graspSubscale].linkId = "section-a-grasp-subscale" (exactly)
* item[graspSubscale].text = "掌握分量表"
* item[graspSubscale].item ^slicing.discriminator.type = #value
* item[graspSubscale].item ^slicing.discriminator.path = "linkId"
* item[graspSubscale].item ^slicing.rules = #closed
* item[graspSubscale].item contains
    aBlock10cm3 1..1 and
    aBlock2_5cm3 1..1 and
    aBlock5cm3 1..1 and
    aBlock7_5cm3 1..1 and
    aCricketBall 1..1 and
    aSharpeningStone 1..1 and
    sectionASubscore 1..1

// A1. 方塊積木, 10 立方公分
* item[graspSubscale].item[aBlock10cm3].linkId = "a-block-10cm3" (exactly)
* item[graspSubscale].item[aBlock10cm3].text = "方塊積木, 10 立方公分"
* item[graspSubscale].item[aBlock10cm3].answer 1..1
* item[graspSubscale].item[aBlock10cm3].answer.value[x] only integer
* item[graspSubscale].item[aBlock10cm3].answer.valueInteger ^short = "分數 0-3"


// A1 完成時間
* item[graspSubscale].item[aBlock10cm3].item ^slicing.discriminator.type = #value
* item[graspSubscale].item[aBlock10cm3].item ^slicing.discriminator.path = "linkId"
* item[graspSubscale].item[aBlock10cm3].item ^slicing.rules = #open
* item[graspSubscale].item[aBlock10cm3].item contains testTimeA1 0..1
* item[graspSubscale].item[aBlock10cm3].item[testTimeA1].linkId = "a-block-10cm3-seconds" (exactly)
* item[graspSubscale].item[aBlock10cm3].item[testTimeA1].text = "完成時間（秒）"
* item[graspSubscale].item[aBlock10cm3].item[testTimeA1].answer 0..1
* item[graspSubscale].item[aBlock10cm3].item[testTimeA1].answer.value[x] only decimal

// A2. 方塊積木, 2.5 立方公分
* item[graspSubscale].item[aBlock2_5cm3].linkId = "a-block-2.5cm3" (exactly)
* item[graspSubscale].item[aBlock2_5cm3].text = "方塊積木, 2.5 立方公分"
* item[graspSubscale].item[aBlock2_5cm3].answer 1..1
* item[graspSubscale].item[aBlock2_5cm3].answer.value[x] only integer


// A2 完成時間
* item[graspSubscale].item[aBlock2_5cm3].item ^slicing.discriminator.type = #value
* item[graspSubscale].item[aBlock2_5cm3].item ^slicing.discriminator.path = "linkId"
* item[graspSubscale].item[aBlock2_5cm3].item ^slicing.rules = #open
* item[graspSubscale].item[aBlock2_5cm3].item contains testTimeA2 0..1
* item[graspSubscale].item[aBlock2_5cm3].item[testTimeA2].linkId = "a-block-2.5cm3-seconds" (exactly)
* item[graspSubscale].item[aBlock2_5cm3].item[testTimeA2].answer 0..1
* item[graspSubscale].item[aBlock2_5cm3].item[testTimeA2].answer.value[x] only decimal

// A3. 方塊積木, 5 立方公分
* item[graspSubscale].item[aBlock5cm3].linkId = "a-block-5cm3" (exactly)
* item[graspSubscale].item[aBlock5cm3].text = "方塊積木, 5 立方公分"
* item[graspSubscale].item[aBlock5cm3].answer 1..1
* item[graspSubscale].item[aBlock5cm3].answer.value[x] only integer


// A3 完成時間
* item[graspSubscale].item[aBlock5cm3].item ^slicing.discriminator.type = #value
* item[graspSubscale].item[aBlock5cm3].item ^slicing.discriminator.path = "linkId"
* item[graspSubscale].item[aBlock5cm3].item ^slicing.rules = #open
* item[graspSubscale].item[aBlock5cm3].item contains testTimeA3 0..1
* item[graspSubscale].item[aBlock5cm3].item[testTimeA3].linkId = "a-block-5cm3-seconds" (exactly)
* item[graspSubscale].item[aBlock5cm3].item[testTimeA3].answer 0..1
* item[graspSubscale].item[aBlock5cm3].item[testTimeA3].answer.value[x] only decimal

// A4. 方塊積木, 7.5 立方公分
* item[graspSubscale].item[aBlock7_5cm3].linkId = "a-block-7.5cm3" (exactly)
* item[graspSubscale].item[aBlock7_5cm3].text = "方塊積木, 7.5 立方公分"
* item[graspSubscale].item[aBlock7_5cm3].answer 1..1
* item[graspSubscale].item[aBlock7_5cm3].answer.value[x] only integer


// A4 完成時間
* item[graspSubscale].item[aBlock7_5cm3].item ^slicing.discriminator.type = #value
* item[graspSubscale].item[aBlock7_5cm3].item ^slicing.discriminator.path = "linkId"
* item[graspSubscale].item[aBlock7_5cm3].item ^slicing.rules = #open
* item[graspSubscale].item[aBlock7_5cm3].item contains testTimeA4 0..1
* item[graspSubscale].item[aBlock7_5cm3].item[testTimeA4].linkId = "a-block-7.5cm3-seconds" (exactly)
* item[graspSubscale].item[aBlock7_5cm3].item[testTimeA4].answer 0..1
* item[graspSubscale].item[aBlock7_5cm3].item[testTimeA4].answer.value[x] only decimal

// A5. 板球
* item[graspSubscale].item[aCricketBall].linkId = "a-cricket-ball" (exactly)
* item[graspSubscale].item[aCricketBall].text = "板球"
* item[graspSubscale].item[aCricketBall].answer 1..1
* item[graspSubscale].item[aCricketBall].answer.value[x] only integer


// A5 完成時間
* item[graspSubscale].item[aCricketBall].item ^slicing.discriminator.type = #value
* item[graspSubscale].item[aCricketBall].item ^slicing.discriminator.path = "linkId"
* item[graspSubscale].item[aCricketBall].item ^slicing.rules = #open
* item[graspSubscale].item[aCricketBall].item contains testTimeA5 0..1
* item[graspSubscale].item[aCricketBall].item[testTimeA5].linkId = "a-cricket-ball-seconds" (exactly)
* item[graspSubscale].item[aCricketBall].item[testTimeA5].answer 0..1
* item[graspSubscale].item[aCricketBall].item[testTimeA5].answer.value[x] only decimal

// A6. 磨刀石
* item[graspSubscale].item[aSharpeningStone].linkId = "a-sharpening-stone" (exactly)
* item[graspSubscale].item[aSharpeningStone].text = "磨刀石"
* item[graspSubscale].item[aSharpeningStone].answer 1..1
* item[graspSubscale].item[aSharpeningStone].answer.value[x] only integer


// A6 完成時間
* item[graspSubscale].item[aSharpeningStone].item ^slicing.discriminator.type = #value
* item[graspSubscale].item[aSharpeningStone].item ^slicing.discriminator.path = "linkId"
* item[graspSubscale].item[aSharpeningStone].item ^slicing.rules = #open
* item[graspSubscale].item[aSharpeningStone].item contains testTimeA6 0..1
* item[graspSubscale].item[aSharpeningStone].item[testTimeA6].linkId = "a-sharpening-stone-seconds" (exactly)
* item[graspSubscale].item[aSharpeningStone].item[testTimeA6].answer 0..1
* item[graspSubscale].item[aSharpeningStone].item[testTimeA6].answer.value[x] only decimal

// A分量表小計（自動計算）
* item[graspSubscale].item[sectionASubscore].linkId = "section-a-subscore" (exactly)
* item[graspSubscale].item[sectionASubscore].text = "A分量表分數（抓握）"
* item[graspSubscale].item[sectionASubscore].answer 1..1
* item[graspSubscale].item[sectionASubscore].answer.value[x] only integer


// ============================================
// Section B: 握力分量表（簡化定義）
// ============================================
* item[gripSubscale].linkId = "section-b-grip-subscale" (exactly)
* item[gripSubscale].text = "握力分量表"
* item[gripSubscale].item ^slicing.discriminator.type = #value
* item[gripSubscale].item ^slicing.discriminator.path = "linkId"
* item[gripSubscale].item ^slicing.rules = #closed
* item[gripSubscale].item contains
    bPourWater 1..1 and
    bDisplace225cm 1..1 and
    bDisplace1cm 1..1 and
    bPutWasher 1..1 and
    sectionBSubscore 1..1

// B1-B4項目約束（簡化表示）
* item[gripSubscale].item[bPourWater].linkId = "b-pour-water-from-one-glass-to-another" (exactly)
* item[gripSubscale].item[bPourWater].answer 1..1
* item[gripSubscale].item[bPourWater].answer.value[x] only integer


* item[gripSubscale].item[bDisplace225cm].linkId = "b-displace-2.25-cm-alloy-tube-from-one-side-oftable-to-the-other" (exactly)
* item[gripSubscale].item[bDisplace225cm].answer 1..1
* item[gripSubscale].item[bDisplace225cm].answer.value[x] only integer


* item[gripSubscale].item[bDisplace1cm].linkId = "b-displace-1-cm-alloy-tube-from-one-side-of-table-to-the-other" (exactly)
* item[gripSubscale].item[bDisplace1cm].answer 1..1
* item[gripSubscale].item[bDisplace1cm].answer.value[x] only integer


* item[gripSubscale].item[bPutWasher].linkId = "b-put-washer-over-bolt" (exactly)
* item[gripSubscale].item[bPutWasher].answer 1..1
* item[gripSubscale].item[bPutWasher].answer.value[x] only integer


// B分量表小計
* item[gripSubscale].item[sectionBSubscore].linkId = "section-b-subscore" (exactly)
* item[gripSubscale].item[sectionBSubscore].text = "B分量表分數（握力）"
* item[gripSubscale].item[sectionBSubscore].answer 1..1
* item[gripSubscale].item[sectionBSubscore].answer.value[x] only integer


// ============================================
// Section C: 捏量表（簡化定義）
// ============================================
* item[pinchSubscale].linkId = "section-c-pinch-subscale" (exactly)
* item[pinchSubscale].text = "握力分量表"  // 注意：原問卷中此處文字有誤
* item[pinchSubscale].item ^slicing.discriminator.type = #value
* item[pinchSubscale].item ^slicing.discriminator.path = "linkId"
* item[pinchSubscale].item ^slicing.rules = #closed
* item[pinchSubscale].item contains
    cBallBearingRing 1..1 and
    cMarbleIndex 1..1 and
    cBallBearingMiddle 1..1 and
    cBallBearingIndex 1..1 and
    cMarbleRing 1..1 and
    cMarbleMiddle 1..1 and
    sectionCSubscore 1..1

// C1-C6項目約束（簡化表示）
* item[pinchSubscale].item[cBallBearingRing].linkId = "c-ball-bearing-held-between-ring-finger-and-thumb" (exactly)
* item[pinchSubscale].item[cBallBearingRing].answer 1..1
* item[pinchSubscale].item[cBallBearingRing].answer.value[x] only integer


* item[pinchSubscale].item[cMarbleIndex].linkId = "c-marble-held-between-index-finger-and-thumb" (exactly)
* item[pinchSubscale].item[cMarbleIndex].answer 1..1
* item[pinchSubscale].item[cMarbleIndex].answer.value[x] only integer


* item[pinchSubscale].item[cBallBearingMiddle].linkId = "c-ball-bearing-held-between-middle-finger-and-thumb" (exactly)
* item[pinchSubscale].item[cBallBearingMiddle].answer 1..1
* item[pinchSubscale].item[cBallBearingMiddle].answer.value[x] only integer


* item[pinchSubscale].item[cBallBearingIndex].linkId = "c-ball-bearing-held-between-index-finger-and-thumb" (exactly)
* item[pinchSubscale].item[cBallBearingIndex].answer 1..1
* item[pinchSubscale].item[cBallBearingIndex].answer.value[x] only integer


* item[pinchSubscale].item[cMarbleRing].linkId = "c-marble-held-between-ring-finger-and-thumb" (exactly)
* item[pinchSubscale].item[cMarbleRing].answer 1..1
* item[pinchSubscale].item[cMarbleRing].answer.value[x] only integer


* item[pinchSubscale].item[cMarbleMiddle].linkId = "c-marble-held-between-middle-finger-and-thumb" (exactly)
* item[pinchSubscale].item[cMarbleMiddle].answer 1..1
* item[pinchSubscale].item[cMarbleMiddle].answer.value[x] only integer


// C分量表小計
* item[pinchSubscale].item[sectionCSubscore].linkId = "section-c-subscore" (exactly)
* item[pinchSubscale].item[sectionCSubscore].text = "C分量表分數（捏取）"
* item[pinchSubscale].item[sectionCSubscore].answer 1..1
* item[pinchSubscale].item[sectionCSubscore].answer.value[x] only integer


// ============================================
// Section D: 大運動分量表
// ============================================
* item[grossMovementSubscale].linkId = "section-d-gross-movement-subscale" (exactly)
* item[grossMovementSubscale].text = "握力分量表"  // 注意：原問卷中此處文字有誤
* item[grossMovementSubscale].item ^slicing.discriminator.type = #value
* item[grossMovementSubscale].item ^slicing.discriminator.path = "linkId"
* item[grossMovementSubscale].item ^slicing.rules = #closed
* item[grossMovementSubscale].item contains
    dHandBehindHead 1..1 and
    dHandTopHead 1..1 and
    dHandMouth 1..1 and
    sectionDSubscore 1..1

// D1-D3項目約束
* item[grossMovementSubscale].item[dHandBehindHead].linkId = "d-hand-to-behind-the-head" (exactly)
* item[grossMovementSubscale].item[dHandBehindHead].answer 1..1
* item[grossMovementSubscale].item[dHandBehindHead].answer.value[x] only integer


* item[grossMovementSubscale].item[dHandTopHead].linkId = "d-hand-to-top-of-head" (exactly)
* item[grossMovementSubscale].item[dHandTopHead].answer 1..1
* item[grossMovementSubscale].item[dHandTopHead].answer.value[x] only integer


* item[grossMovementSubscale].item[dHandMouth].linkId = "d-hand-to-mouth" (exactly)
* item[grossMovementSubscale].item[dHandMouth].answer 1..1
* item[grossMovementSubscale].item[dHandMouth].answer.value[x] only integer


// D分量表小計
* item[grossMovementSubscale].item[sectionDSubscore].linkId = "section-d-subscore" (exactly)
* item[grossMovementSubscale].item[sectionDSubscore].text = "D分量表分數（粗動作）"
* item[grossMovementSubscale].item[sectionDSubscore].answer 1..1
* item[grossMovementSubscale].item[sectionDSubscore].answer.value[x] only integer


// ============================================
// Section E: 總分計算
// ============================================
* item[totalScoreSection].linkId = "section-e-total-score" (exactly)
* item[totalScoreSection].text = "ARAT 總分計算"
* item[totalScoreSection].item ^slicing.discriminator.type = #value
* item[totalScoreSection].item ^slicing.discriminator.path = "linkId"
* item[totalScoreSection].item ^slicing.rules = #closed
* item[totalScoreSection].item contains
    sectionsSummary 1..1 and
    graspScoreDisplay 1..1 and
    gripScoreDisplay 1..1 and
    pinchScoreDisplay 1..1 and
    movementScoreDisplay 1..1 and
    aratTotalScore 1..1

// 各分量表分數顯示項目
* item[totalScoreSection].item[sectionsSummary].linkId = "section-scores-summary" (exactly)
* item[totalScoreSection].item[sectionsSummary].text = "各分量表分數"

* item[totalScoreSection].item[graspScoreDisplay].linkId = "grasp-score-display" (exactly)
* item[totalScoreSection].item[graspScoreDisplay].answer 1..1
* item[totalScoreSection].item[graspScoreDisplay].answer.value[x] only integer


* item[totalScoreSection].item[gripScoreDisplay].linkId = "grip-score-display" (exactly)
* item[totalScoreSection].item[gripScoreDisplay].answer 1..1
* item[totalScoreSection].item[gripScoreDisplay].answer.value[x] only integer


* item[totalScoreSection].item[pinchScoreDisplay].linkId = "pinch-score-display" (exactly)
* item[totalScoreSection].item[pinchScoreDisplay].answer 1..1
* item[totalScoreSection].item[pinchScoreDisplay].answer.value[x] only integer


* item[totalScoreSection].item[movementScoreDisplay].linkId = "movement-score-display" (exactly)
* item[totalScoreSection].item[movementScoreDisplay].answer 1..1
* item[totalScoreSection].item[movementScoreDisplay].answer.value[x] only integer


// ARAT總分（最終）
* item[totalScoreSection].item[aratTotalScore].linkId = "arat-total-score" (exactly)
* item[totalScoreSection].item[aratTotalScore].text = "ARAT 總分"
* item[totalScoreSection].item[aratTotalScore].answer 1..1
* item[totalScoreSection].item[aratTotalScore].answer.value[x] only integer


// ============================================
// ValueSet 定義
// ============================================
ValueSet: AssessmentSideValueSet
Id: assessment-side-valueset
Title: "評估側別選項"
Description: "ARAT評估時選擇左側或右側的選項"
* $snomed#24028007 "患者左側"
* $snomed#7771000 "患者右側"

// ============================================
// Invariant 約束（範例）
// ============================================
Invariant: arat-score-consistency
Description: "各分量表分數與總分必須一致"
Expression: "item.where(linkId='arat-total-score').answer.value = item.where(linkId in ('grasp-score-display' | 'grip-score-display' | 'pinch-score-display' | 'movement-score-display')).answer.value.sum()"
Severity: #error

Invariant: subscale-score-valid
Description: "每個分量表分數必須在有效範圍內"
Expression: "item.descendants().where(linkId.endsWith('-subscore')).answer.value.all($this >= 0)"
Severity: #error