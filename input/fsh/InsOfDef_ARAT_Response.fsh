// ============================================
// ARAT QuestionnaireResponse 範例實例
// ============================================
Instance: ARATQuestionnaireResponseExample
InstanceOf: ARATQuestionnaireResponse
Usage: #example
Title: "ARAT問卷回覆範例"
Description: "一位右側中風患者進行左側上肢ARAT評估的問卷回覆範例，包含各測試項目分數、完成時間及自動計算分數"

* id = "arat-response-example-001"
* meta.profile = "http://example.org/fhir/StructureDefinition/arat-questionnaire-response"
* questionnaire = "http://example.org/fhir/Questionnaire/arat-questionnaire"
* status = #completed
* subject = Reference(Patient/stroke-patient-001) "張先生"
* authored = "2025-10-09T14:30:00+08:00"
* author = Reference(Practitioner/ot-therapist-001) "復健治療師 - 李小姐"

// ============================================
// 評估側別選擇
// ============================================
* item[assessmentSide].linkId = "assessment-side"
* item[assessmentSide].text = "請選擇評估側"
* item[assessmentSide].answer.valueCoding = http://snomed.info/sct#24028007 "患者左側"

// ============================================
// Section A: 掌握分量表
// ============================================
* item[graspSubscale].linkId = "section-a-grasp-subscale"
* item[graspSubscale].text = "掌握分量表"

// A1. 方塊積木, 10 立方公分
* item[graspSubscale].item[aBlock10cm3].linkId = "a-block-10cm3"
* item[graspSubscale].item[aBlock10cm3].text = "方塊積木, 10 立方公分"
* item[graspSubscale].item[aBlock10cm3].answer.valueInteger = 3
* item[graspSubscale].item[aBlock10cm3].item[testTimeA1].linkId = "a-block-10cm3-seconds"
* item[graspSubscale].item[aBlock10cm3].item[testTimeA1].text = "完成時間（秒）"
* item[graspSubscale].item[aBlock10cm3].item[testTimeA1].answer.valueDecimal = 2.5

// A2. 方塊積木, 2.5 立方公分
* item[graspSubscale].item[aBlock2_5cm3].linkId = "a-block-2.5cm3"
* item[graspSubscale].item[aBlock2_5cm3].text = "方塊積木, 2.5 立方公分"
* item[graspSubscale].item[aBlock2_5cm3].answer.valueInteger = 2
* item[graspSubscale].item[aBlock2_5cm3].item[testTimeA2].linkId = "a-block-2.5cm3-seconds"
* item[graspSubscale].item[aBlock2_5cm3].item[testTimeA2].text = "完成時間（秒）"
* item[graspSubscale].item[aBlock2_5cm3].item[testTimeA2].answer.valueDecimal = 4.8

// A3. 方塊積木, 5 立方公分
* item[graspSubscale].item[aBlock5cm3].linkId = "a-block-5cm3"
* item[graspSubscale].item[aBlock5cm3].text = "方塊積木, 5 立方公分"
* item[graspSubscale].item[aBlock5cm3].answer.valueInteger = 3
* item[graspSubscale].item[aBlock5cm3].item[testTimeA3].linkId = "a-block-5cm3-seconds"
* item[graspSubscale].item[aBlock5cm3].item[testTimeA3].text = "完成時間（秒）"
* item[graspSubscale].item[aBlock5cm3].item[testTimeA3].answer.valueDecimal = 3.2

// A4. 方塊積木, 7.5 立方公分
* item[graspSubscale].item[aBlock7_5cm3].linkId = "a-block-7.5cm3"
* item[graspSubscale].item[aBlock7_5cm3].text = "方塊積木, 7.5 立方公分"
* item[graspSubscale].item[aBlock7_5cm3].answer.valueInteger = 2
* item[graspSubscale].item[aBlock7_5cm3].item[testTimeA4].linkId = "a-block-7.5cm3-seconds"
* item[graspSubscale].item[aBlock7_5cm3].item[testTimeA4].text = "完成時間（秒）"
* item[graspSubscale].item[aBlock7_5cm3].item[testTimeA4].answer.valueDecimal = 5.1

// A5. 板球
* item[graspSubscale].item[aCricketBall].linkId = "a-cricket-ball"
* item[graspSubscale].item[aCricketBall].text = "板球"
* item[graspSubscale].item[aCricketBall].answer.valueInteger = 1
* item[graspSubscale].item[aCricketBall].item[testTimeA5].linkId = "a-cricket-ball-seconds"
* item[graspSubscale].item[aCricketBall].item[testTimeA5].text = "完成時間（秒）"
* item[graspSubscale].item[aCricketBall].item[testTimeA5].answer.valueDecimal = 8.7

// A6. 磨刀石
* item[graspSubscale].item[aSharpeningStone].linkId = "a-sharpening-stone"
* item[graspSubscale].item[aSharpeningStone].text = "磨刀石"
* item[graspSubscale].item[aSharpeningStone].answer.valueInteger = 1
* item[graspSubscale].item[aSharpeningStone].item[testTimeA6].linkId = "a-sharpening-stone-seconds"
* item[graspSubscale].item[aSharpeningStone].item[testTimeA6].text = "完成時間（秒）"
* item[graspSubscale].item[aSharpeningStone].item[testTimeA6].answer.valueDecimal = 9.3

// A分量表小計（自動計算：3+2+3+2+1+1 = 12）
* item[graspSubscale].item[sectionASubscore].linkId = "section-a-subscore"
* item[graspSubscale].item[sectionASubscore].text = "A分量表分數（抓握）"
* item[graspSubscale].item[sectionASubscore].answer.valueInteger = 12

// ============================================
// Section B: 握力分量表
// ============================================
* item[gripSubscale].linkId = "section-b-grip-subscale"
* item[gripSubscale].text = "握力分量表"

// B1. 從一個杯子倒水到另一個杯子
* item[gripSubscale].item[bPourWater].linkId = "b-pour-water-from-one-glass-to-another"
* item[gripSubscale].item[bPourWater].text = "從一個杯子倒水到另一個杯子"
* item[gripSubscale].item[bPourWater].answer.valueInteger = 2

// B2. 將2.25公分合金管從桌子一側移動到另一側
* item[gripSubscale].item[bDisplace225cm].linkId = "b-displace-2.25-cm-alloy-tube-from-one-side-oftable-to-the-other"
* item[gripSubscale].item[bDisplace225cm].text = "將2.25公分合金管從桌子一側移動到另一側"
* item[gripSubscale].item[bDisplace225cm].answer.valueInteger = 3

// B3. 將1公分合金管從桌子一側移動到另一側
* item[gripSubscale].item[bDisplace1cm].linkId = "b-displace-1-cm-alloy-tube-from-one-side-of-table-to-the-other"
* item[gripSubscale].item[bDisplace1cm].text = "將1公分合金管從桌子一側移動到另一側"
* item[gripSubscale].item[bDisplace1cm].answer.valueInteger = 2

// B4. 將墊圈套在螺栓上
* item[gripSubscale].item[bPutWasher].linkId = "b-put-washer-over-bolt"
* item[gripSubscale].item[bPutWasher].text = "將墊圈套在螺栓上"
* item[gripSubscale].item[bPutWasher].answer.valueInteger = 1

// B分量表小計（自動計算：2+3+2+1 = 8）
* item[gripSubscale].item[sectionBSubscore].linkId = "section-b-subscore"
* item[gripSubscale].item[sectionBSubscore].text = "B分量表分數（握力）"
* item[gripSubscale].item[sectionBSubscore].answer.valueInteger = 8

// ============================================
// Section C: 捏量表
// ============================================
* item[pinchSubscale].linkId = "section-c-pinch-subscale"
* item[pinchSubscale].text = "握力分量表"  // 注意：原問卷中此處文字有誤，實際應為捏取分量表

// C1. 無名指和拇指夾住軸承
* item[pinchSubscale].item[cBallBearingRing].linkId = "c-ball-bearing-held-between-ring-finger-and-thumb"
* item[pinchSubscale].item[cBallBearingRing].text = "無名指和拇指夾住軸承"
* item[pinchSubscale].item[cBallBearingRing].answer.valueInteger = 1

// C2. 食指和拇指夾住彈珠
* item[pinchSubscale].item[cMarbleIndex].linkId = "c-marble-held-between-index-finger-and-thumb"
* item[pinchSubscale].item[cMarbleIndex].text = "食指和拇指夾住彈珠"
* item[pinchSubscale].item[cMarbleIndex].answer.valueInteger = 2

// C3. 中指和拇指夾住軸承
* item[pinchSubscale].item[cBallBearingMiddle].linkId = "c-ball-bearing-held-between-middle-finger-and-thumb"
* item[pinchSubscale].item[cBallBearingMiddle].text = "中指和拇指夾住軸承"
* item[pinchSubscale].item[cBallBearingMiddle].answer.valueInteger = 2

// C4. 食指和拇指夾住軸承
* item[pinchSubscale].item[cBallBearingIndex].linkId = "c-ball-bearing-held-between-index-finger-and-thumb"
* item[pinchSubscale].item[cBallBearingIndex].text = "食指和拇指夾住軸承"
* item[pinchSubscale].item[cBallBearingIndex].answer.valueInteger = 3

// C5. 無名指和拇指夾住彈珠
* item[pinchSubscale].item[cMarbleRing].linkId = "c-marble-held-between-ring-finger-and-thumb"
* item[pinchSubscale].item[cMarbleRing].text = "無名指和拇指夾住彈珠"
* item[pinchSubscale].item[cMarbleRing].answer.valueInteger = 1

// C6. 中指和拇指夾住彈珠
* item[pinchSubscale].item[cMarbleMiddle].linkId = "c-marble-held-between-middle-finger-and-thumb"
* item[pinchSubscale].item[cMarbleMiddle].text = "中指和拇指夾住彈珠"
* item[pinchSubscale].item[cMarbleMiddle].answer.valueInteger = 2

// C分量表小計（自動計算：1+2+2+3+1+2 = 11）
* item[pinchSubscale].item[sectionCSubscore].linkId = "section-c-subscore"
* item[pinchSubscale].item[sectionCSubscore].text = "C分量表分數（捏取）"
* item[pinchSubscale].item[sectionCSubscore].answer.valueInteger = 11

// ============================================
// Section D: 大運動分量表
// ============================================
* item[grossMovementSubscale].linkId = "section-d-gross-movement-subscale"
* item[grossMovementSubscale].text = "握力分量表"  // 注意：原問卷中此處文字有誤，實際應為大運動分量表

// D1. 手碰到頭後
* item[grossMovementSubscale].item[dHandBehindHead].linkId = "d-hand-to-behind-the-head"
* item[grossMovementSubscale].item[dHandBehindHead].text = "手碰到頭後"
* item[grossMovementSubscale].item[dHandBehindHead].answer.valueInteger = 2

// D2. 手碰到頭頂
* item[grossMovementSubscale].item[dHandTopHead].linkId = "d-hand-to-top-of-head"
* item[grossMovementSubscale].item[dHandTopHead].text = "手碰到頭頂"
* item[grossMovementSubscale].item[dHandTopHead].answer.valueInteger = 3

// D3. 手碰到嘴巴
* item[grossMovementSubscale].item[dHandMouth].linkId = "d-hand-to-mouth"
* item[grossMovementSubscale].item[dHandMouth].text = "手碰到嘴巴"
* item[grossMovementSubscale].item[dHandMouth].answer.valueInteger = 3

// D分量表小計（自動計算：2+3+3 = 8）
* item[grossMovementSubscale].item[sectionDSubscore].linkId = "section-d-subscore"
* item[grossMovementSubscale].item[sectionDSubscore].text = "D分量表分數（粗動作）"
* item[grossMovementSubscale].item[sectionDSubscore].answer.valueInteger = 8

// ============================================
// Section E: 總分計算
// ============================================
* item[totalScoreSection].linkId = "section-e-total-score"
* item[totalScoreSection].text = "ARAT 總分計算"

// 各分量表分數摘要
* item[totalScoreSection].item[sectionsSummary].linkId = "section-scores-summary"
* item[totalScoreSection].item[sectionsSummary].text = "各分量表分數"

// 掌握分數顯示
* item[totalScoreSection].item[graspScoreDisplay].linkId = "grasp-score-display"
* item[totalScoreSection].item[graspScoreDisplay].text = "掌握分數"
* item[totalScoreSection].item[graspScoreDisplay].answer.valueInteger = 12

// 握力分數顯示
* item[totalScoreSection].item[gripScoreDisplay].linkId = "grip-score-display"
* item[totalScoreSection].item[gripScoreDisplay].text = "握力分數"
* item[totalScoreSection].item[gripScoreDisplay].answer.valueInteger = 8

// 捏取分數顯示
* item[totalScoreSection].item[pinchScoreDisplay].linkId = "pinch-score-display"
* item[totalScoreSection].item[pinchScoreDisplay].text = "捏取分數"
* item[totalScoreSection].item[pinchScoreDisplay].answer.valueInteger = 11

// 大運動分數顯示
* item[totalScoreSection].item[movementScoreDisplay].linkId = "movement-score-display"
* item[totalScoreSection].item[movementScoreDisplay].text = "大運動分數"
* item[totalScoreSection].item[movementScoreDisplay].answer.valueInteger = 8

// ARAT總分（自動計算：12+8+11+8 = 39）
* item[totalScoreSection].item[aratTotalScore].linkId = "arat-total-score"
* item[totalScoreSection].item[aratTotalScore].text = "ARAT 總分"
* item[totalScoreSection].item[aratTotalScore].answer.valueInteger = 39
