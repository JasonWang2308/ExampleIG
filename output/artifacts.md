# Artifacts Summary - v0.1.0

* [**Table of Contents**](toc.md)
* **Artifacts Summary**

## Artifacts Summary

This page provides a list of the FHIR artifacts defined as part of this implementation guide.

### Structures: Resource Profiles 

These define constraints on FHIR resources for systems conforming to this implementation guide.

| | |
| :--- | :--- |
| [ARAT上肢功能評估問卷回覆](StructureDefinition-ARATQuestionnaireResponse.md) | 針對ARAT上肢功能評估問卷的QuestionnaireResponse Profile，強制回傳格式符合問卷結構 |
| [MyPatient](StructureDefinition-MyPatient.md) | An example profile of the Patient resource. |
| [評估問卷](StructureDefinition-SPACQuestionnaire.md) | 評估問卷的結構化定義，實際問卷內容請參考Structure: Questionnaire，可依據前者內容做為範本進行擴充 |
| [評估問卷回覆](StructureDefinition-SPACQuestionnaireResponse.md) | 問卷回覆的結構化定義，實際問回覆內容可參考Examples，可依據前者內容做為範本進行擴充 |

### Structures: Extension Definitions 

These define constraints on FHIR data types for systems conforming to this implementation guide.

| | |
| :--- | :--- |
| [測試時間擴展](StructureDefinition-test-time-extension.md) | 記錄單一測試項目的完成時間 |

### Terminology: Value Sets 

These define sets of codes used by systems conforming to this implementation guide.

| | |
| :--- | :--- |
| [評估側別選項](ValueSet-assessment-side-valueset.md) | ARAT評估時選擇左側或右側的選項 |

### Example: Example Instances 

These are example instances that show what data produced and consumed by systems conforming with this implementation guide might look like.

| | |
| :--- | :--- |
| [ARAT問卷回覆範例](QuestionnaireResponse-arat-response-example-001.md) | 一位右側中風患者進行左側上肢ARAT評估的問卷回覆範例，包含各測試項目分數、完成時間及自動計算分數 |
| [PatientExample](Patient-PatientExample.md) | An example of a patient with a license to krill. |

