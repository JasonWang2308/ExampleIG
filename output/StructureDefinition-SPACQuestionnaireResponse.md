# 評估問卷回覆 - v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **評估問卷回覆**

## Resource Profile: 評估問卷回覆 

| | |
| :--- | :--- |
| *Official URL*:http://example.org/StructureDefinition/SPACQuestionnaireResponse | *Version*:0.1.0 |
| Draft as of 2025-10-21 | *Computable Name*:SPACQuestionnaireResponse |

 
問卷回覆的結構化定義，實際問回覆內容可參考Examples，可依據前者內容做為範本進行擴充 

**Usages:**

* Derived from this Profile: [ARAT上肢功能評估問卷回覆](StructureDefinition-ARATQuestionnaireResponse.md)

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/fhir.example|current/StructureDefinition/SPACQuestionnaireResponse)

### Formal Views of Profile Content

 [Description of Profiles, Differentials, Snapshots and how the different presentations work](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](StructureDefinition-SPACQuestionnaireResponse.csv), [Excel](StructureDefinition-SPACQuestionnaireResponse.xlsx), [Schematron](StructureDefinition-SPACQuestionnaireResponse.sch) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "SPACQuestionnaireResponse",
  "url" : "http://example.org/StructureDefinition/SPACQuestionnaireResponse",
  "version" : "0.1.0",
  "name" : "SPACQuestionnaireResponse",
  "title" : "評估問卷回覆",
  "status" : "draft",
  "date" : "2025-10-21T09:33:18+08:00",
  "publisher" : "Example Publisher",
  "contact" : [
    {
      "name" : "Example Publisher",
      "telecom" : [
        {
          "system" : "url",
          "value" : "http://example.org/example-publisher"
        }
      ]
    }
  ],
  "description" : "問卷回覆的結構化定義，實際問回覆內容可參考Examples，可依據前者內容做為範本進行擴充",
  "fhirVersion" : "4.0.1",
  "mapping" : [
    {
      "identity" : "workflow",
      "uri" : "http://hl7.org/fhir/workflow",
      "name" : "Workflow Pattern"
    },
    {
      "identity" : "rim",
      "uri" : "http://hl7.org/v3",
      "name" : "RIM Mapping"
    },
    {
      "identity" : "w5",
      "uri" : "http://hl7.org/fhir/fivews",
      "name" : "FiveWs Pattern Mapping"
    }
  ],
  "kind" : "resource",
  "abstract" : false,
  "type" : "QuestionnaireResponse",
  "baseDefinition" : "http://hl7.org/fhir/StructureDefinition/QuestionnaireResponse",
  "derivation" : "constraint",
  "differential" : {
    "element" : [
      {
        "id" : "QuestionnaireResponse",
        "path" : "QuestionnaireResponse"
      },
      {
        "id" : "QuestionnaireResponse.questionnaire",
        "path" : "QuestionnaireResponse.questionnaire",
        "mustSupport" : true
      },
      {
        "id" : "QuestionnaireResponse.status",
        "path" : "QuestionnaireResponse.status",
        "mustSupport" : true
      },
      {
        "id" : "QuestionnaireResponse.subject",
        "path" : "QuestionnaireResponse.subject",
        "min" : 1,
        "mustSupport" : true
      },
      {
        "id" : "QuestionnaireResponse.subject.reference",
        "path" : "QuestionnaireResponse.subject.reference",
        "min" : 1,
        "mustSupport" : true
      },
      {
        "id" : "QuestionnaireResponse.authored",
        "path" : "QuestionnaireResponse.authored",
        "min" : 1,
        "mustSupport" : true
      },
      {
        "id" : "QuestionnaireResponse.author",
        "path" : "QuestionnaireResponse.author",
        "mustSupport" : true
      },
      {
        "id" : "QuestionnaireResponse.author.reference",
        "path" : "QuestionnaireResponse.author.reference",
        "min" : 1,
        "mustSupport" : true
      },
      {
        "id" : "QuestionnaireResponse.source",
        "path" : "QuestionnaireResponse.source",
        "mustSupport" : true
      },
      {
        "id" : "QuestionnaireResponse.source.reference",
        "path" : "QuestionnaireResponse.source.reference",
        "min" : 1,
        "mustSupport" : true
      },
      {
        "id" : "QuestionnaireResponse.item",
        "path" : "QuestionnaireResponse.item",
        "min" : 1,
        "mustSupport" : true
      },
      {
        "id" : "QuestionnaireResponse.item.linkId",
        "path" : "QuestionnaireResponse.item.linkId",
        "mustSupport" : true
      },
      {
        "id" : "QuestionnaireResponse.item.text",
        "path" : "QuestionnaireResponse.item.text",
        "mustSupport" : true
      },
      {
        "id" : "QuestionnaireResponse.item.answer",
        "path" : "QuestionnaireResponse.item.answer",
        "mustSupport" : true
      },
      {
        "id" : "QuestionnaireResponse.item.answer.value[x]",
        "path" : "QuestionnaireResponse.item.answer.value[x]",
        "mustSupport" : true
      },
      {
        "id" : "QuestionnaireResponse.item.item",
        "path" : "QuestionnaireResponse.item.item",
        "mustSupport" : true
      }
    ]
  }
}

```
