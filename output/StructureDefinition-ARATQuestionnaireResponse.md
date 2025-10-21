# ARAT上肢功能評估問卷回覆 - v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **ARAT上肢功能評估問卷回覆**

## Resource Profile: ARAT上肢功能評估問卷回覆 

| | |
| :--- | :--- |
| *Official URL*:http://example.org/StructureDefinition/ARATQuestionnaireResponse | *Version*:0.1.0 |
| Draft as of 2025-10-21 | *Computable Name*:ARATQuestionnaireResponse |

 
針對ARAT上肢功能評估問卷的QuestionnaireResponse Profile，強制回傳格式符合問卷結構 

**Usages:**

* Examples for this Profile: [QuestionnaireResponse/arat-response-example-001](QuestionnaireResponse-arat-response-example-001.md)

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/fhir.example|current/StructureDefinition/ARATQuestionnaireResponse)

### Formal Views of Profile Content

 [Description of Profiles, Differentials, Snapshots and how the different presentations work](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](StructureDefinition-ARATQuestionnaireResponse.csv), [Excel](StructureDefinition-ARATQuestionnaireResponse.xlsx), [Schematron](StructureDefinition-ARATQuestionnaireResponse.sch) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "ARATQuestionnaireResponse",
  "url" : "http://example.org/StructureDefinition/ARATQuestionnaireResponse",
  "version" : "0.1.0",
  "name" : "ARATQuestionnaireResponse",
  "title" : "ARAT上肢功能評估問卷回覆",
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
  "description" : "針對ARAT上肢功能評估問卷的QuestionnaireResponse Profile，強制回傳格式符合問卷結構",
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
  "baseDefinition" : "http://example.org/StructureDefinition/SPACQuestionnaireResponse",
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
        "fixedCanonical" : "http://example.org/fhir/Questionnaire/arat-questionnaire"
      },
      {
        "id" : "QuestionnaireResponse.status",
        "path" : "QuestionnaireResponse.status",
        "patternCode" : "completed"
      },
      {
        "id" : "QuestionnaireResponse.subject",
        "path" : "QuestionnaireResponse.subject",
        "type" : [
          {
            "code" : "Reference",
            "targetProfile" : ["http://hl7.org/fhir/StructureDefinition/Patient"]
          }
        ]
      },
      {
        "id" : "QuestionnaireResponse.item",
        "path" : "QuestionnaireResponse.item",
        "slicing" : {
          "discriminator" : [
            {
              "type" : "value",
              "path" : "linkId"
            }
          ],
          "description" : "根據linkId區分ARAT問卷的主要區塊",
          "ordered" : false,
          "rules" : "closed"
        },
        "min" : 6
      },
      {
        "id" : "QuestionnaireResponse.item:assessmentSide",
        "path" : "QuestionnaireResponse.item",
        "sliceName" : "assessmentSide",
        "min" : 1,
        "max" : "1",
        "mustSupport" : true
      },
      {
        "id" : "QuestionnaireResponse.item:assessmentSide.linkId",
        "path" : "QuestionnaireResponse.item.linkId",
        "fixedString" : "assessment-side"
      },
      {
        "id" : "QuestionnaireResponse.item:assessmentSide.text",
        "path" : "QuestionnaireResponse.item.text",
        "patternString" : "請選擇評估側"
      },
      {
        "id" : "QuestionnaireResponse.item:assessmentSide.answer",
        "path" : "QuestionnaireResponse.item.answer",
        "min" : 1,
        "max" : "1"
      },
      {
        "id" : "QuestionnaireResponse.item:assessmentSide.answer.value[x]",
        "path" : "QuestionnaireResponse.item.answer.value[x]",
        "type" : [
          {
            "code" : "Coding"
          }
        ],
        "binding" : {
          "strength" : "required",
          "valueSet" : "http://example.org/ValueSet/assessment-side-valueset"
        }
      },
      {
        "id" : "QuestionnaireResponse.item:graspSubscale",
        "path" : "QuestionnaireResponse.item",
        "sliceName" : "graspSubscale",
        "min" : 1,
        "max" : "1",
        "mustSupport" : true
      },
      {
        "id" : "QuestionnaireResponse.item:graspSubscale.linkId",
        "path" : "QuestionnaireResponse.item.linkId",
        "fixedString" : "section-a-grasp-subscale"
      },
      {
        "id" : "QuestionnaireResponse.item:graspSubscale.text",
        "path" : "QuestionnaireResponse.item.text",
        "patternString" : "掌握分量表"
      },
      {
        "id" : "QuestionnaireResponse.item:graspSubscale.item",
        "path" : "QuestionnaireResponse.item.item",
        "slicing" : {
          "discriminator" : [
            {
              "type" : "value",
              "path" : "linkId"
            }
          ],
          "rules" : "closed"
        },
        "min" : 7
      },
      {
        "id" : "QuestionnaireResponse.item:graspSubscale.item:aBlock10cm3",
        "path" : "QuestionnaireResponse.item.item",
        "sliceName" : "aBlock10cm3",
        "min" : 1,
        "max" : "1",
        "type" : [
          {
            "code" : "BackboneElement"
          }
        ]
      },
      {
        "id" : "QuestionnaireResponse.item:graspSubscale.item:aBlock10cm3.linkId",
        "path" : "QuestionnaireResponse.item.item.linkId",
        "fixedString" : "a-block-10cm3"
      },
      {
        "id" : "QuestionnaireResponse.item:graspSubscale.item:aBlock10cm3.text",
        "path" : "QuestionnaireResponse.item.item.text",
        "patternString" : "方塊積木, 10 立方公分"
      },
      {
        "id" : "QuestionnaireResponse.item:graspSubscale.item:aBlock10cm3.answer",
        "path" : "QuestionnaireResponse.item.item.answer",
        "min" : 1,
        "max" : "1"
      },
      {
        "id" : "QuestionnaireResponse.item:graspSubscale.item:aBlock10cm3.answer.value[x]",
        "path" : "QuestionnaireResponse.item.item.answer.value[x]",
        "short" : "分數 0-3",
        "type" : [
          {
            "code" : "integer"
          }
        ]
      },
      {
        "id" : "QuestionnaireResponse.item:graspSubscale.item:aBlock10cm3.item",
        "path" : "QuestionnaireResponse.item.item.item",
        "slicing" : {
          "discriminator" : [
            {
              "type" : "value",
              "path" : "linkId"
            }
          ],
          "rules" : "open"
        }
      },
      {
        "id" : "QuestionnaireResponse.item:graspSubscale.item:aBlock10cm3.item:testTimeA1",
        "path" : "QuestionnaireResponse.item.item.item",
        "sliceName" : "testTimeA1",
        "min" : 0,
        "max" : "1",
        "type" : [
          {
            "code" : "BackboneElement"
          }
        ]
      },
      {
        "id" : "QuestionnaireResponse.item:graspSubscale.item:aBlock10cm3.item:testTimeA1.linkId",
        "path" : "QuestionnaireResponse.item.item.item.linkId",
        "fixedString" : "a-block-10cm3-seconds"
      },
      {
        "id" : "QuestionnaireResponse.item:graspSubscale.item:aBlock10cm3.item:testTimeA1.text",
        "path" : "QuestionnaireResponse.item.item.item.text",
        "patternString" : "完成時間（秒）"
      },
      {
        "id" : "QuestionnaireResponse.item:graspSubscale.item:aBlock10cm3.item:testTimeA1.answer",
        "path" : "QuestionnaireResponse.item.item.item.answer",
        "max" : "1"
      },
      {
        "id" : "QuestionnaireResponse.item:graspSubscale.item:aBlock10cm3.item:testTimeA1.answer.value[x]",
        "path" : "QuestionnaireResponse.item.item.item.answer.value[x]",
        "type" : [
          {
            "code" : "decimal"
          }
        ]
      },
      {
        "id" : "QuestionnaireResponse.item:graspSubscale.item:aBlock2_5cm3",
        "path" : "QuestionnaireResponse.item.item",
        "sliceName" : "aBlock2_5cm3",
        "min" : 1,
        "max" : "1",
        "type" : [
          {
            "code" : "BackboneElement"
          }
        ]
      },
      {
        "id" : "QuestionnaireResponse.item:graspSubscale.item:aBlock2_5cm3.linkId",
        "path" : "QuestionnaireResponse.item.item.linkId",
        "fixedString" : "a-block-2.5cm3"
      },
      {
        "id" : "QuestionnaireResponse.item:graspSubscale.item:aBlock2_5cm3.text",
        "path" : "QuestionnaireResponse.item.item.text",
        "patternString" : "方塊積木, 2.5 立方公分"
      },
      {
        "id" : "QuestionnaireResponse.item:graspSubscale.item:aBlock2_5cm3.answer",
        "path" : "QuestionnaireResponse.item.item.answer",
        "min" : 1,
        "max" : "1"
      },
      {
        "id" : "QuestionnaireResponse.item:graspSubscale.item:aBlock2_5cm3.answer.value[x]",
        "path" : "QuestionnaireResponse.item.item.answer.value[x]",
        "type" : [
          {
            "code" : "integer"
          }
        ]
      },
      {
        "id" : "QuestionnaireResponse.item:graspSubscale.item:aBlock2_5cm3.item",
        "path" : "QuestionnaireResponse.item.item.item",
        "slicing" : {
          "discriminator" : [
            {
              "type" : "value",
              "path" : "linkId"
            }
          ],
          "rules" : "open"
        }
      },
      {
        "id" : "QuestionnaireResponse.item:graspSubscale.item:aBlock2_5cm3.item:testTimeA2",
        "path" : "QuestionnaireResponse.item.item.item",
        "sliceName" : "testTimeA2",
        "min" : 0,
        "max" : "1",
        "type" : [
          {
            "code" : "BackboneElement"
          }
        ]
      },
      {
        "id" : "QuestionnaireResponse.item:graspSubscale.item:aBlock2_5cm3.item:testTimeA2.linkId",
        "path" : "QuestionnaireResponse.item.item.item.linkId",
        "fixedString" : "a-block-2.5cm3-seconds"
      },
      {
        "id" : "QuestionnaireResponse.item:graspSubscale.item:aBlock2_5cm3.item:testTimeA2.answer",
        "path" : "QuestionnaireResponse.item.item.item.answer",
        "max" : "1"
      },
      {
        "id" : "QuestionnaireResponse.item:graspSubscale.item:aBlock2_5cm3.item:testTimeA2.answer.value[x]",
        "path" : "QuestionnaireResponse.item.item.item.answer.value[x]",
        "type" : [
          {
            "code" : "decimal"
          }
        ]
      },
      {
        "id" : "QuestionnaireResponse.item:graspSubscale.item:aBlock5cm3",
        "path" : "QuestionnaireResponse.item.item",
        "sliceName" : "aBlock5cm3",
        "min" : 1,
        "max" : "1",
        "type" : [
          {
            "code" : "BackboneElement"
          }
        ]
      },
      {
        "id" : "QuestionnaireResponse.item:graspSubscale.item:aBlock5cm3.linkId",
        "path" : "QuestionnaireResponse.item.item.linkId",
        "fixedString" : "a-block-5cm3"
      },
      {
        "id" : "QuestionnaireResponse.item:graspSubscale.item:aBlock5cm3.text",
        "path" : "QuestionnaireResponse.item.item.text",
        "patternString" : "方塊積木, 5 立方公分"
      },
      {
        "id" : "QuestionnaireResponse.item:graspSubscale.item:aBlock5cm3.answer",
        "path" : "QuestionnaireResponse.item.item.answer",
        "min" : 1,
        "max" : "1"
      },
      {
        "id" : "QuestionnaireResponse.item:graspSubscale.item:aBlock5cm3.answer.value[x]",
        "path" : "QuestionnaireResponse.item.item.answer.value[x]",
        "type" : [
          {
            "code" : "integer"
          }
        ]
      },
      {
        "id" : "QuestionnaireResponse.item:graspSubscale.item:aBlock5cm3.item",
        "path" : "QuestionnaireResponse.item.item.item",
        "slicing" : {
          "discriminator" : [
            {
              "type" : "value",
              "path" : "linkId"
            }
          ],
          "rules" : "open"
        }
      },
      {
        "id" : "QuestionnaireResponse.item:graspSubscale.item:aBlock5cm3.item:testTimeA3",
        "path" : "QuestionnaireResponse.item.item.item",
        "sliceName" : "testTimeA3",
        "min" : 0,
        "max" : "1",
        "type" : [
          {
            "code" : "BackboneElement"
          }
        ]
      },
      {
        "id" : "QuestionnaireResponse.item:graspSubscale.item:aBlock5cm3.item:testTimeA3.linkId",
        "path" : "QuestionnaireResponse.item.item.item.linkId",
        "fixedString" : "a-block-5cm3-seconds"
      },
      {
        "id" : "QuestionnaireResponse.item:graspSubscale.item:aBlock5cm3.item:testTimeA3.answer",
        "path" : "QuestionnaireResponse.item.item.item.answer",
        "max" : "1"
      },
      {
        "id" : "QuestionnaireResponse.item:graspSubscale.item:aBlock5cm3.item:testTimeA3.answer.value[x]",
        "path" : "QuestionnaireResponse.item.item.item.answer.value[x]",
        "type" : [
          {
            "code" : "decimal"
          }
        ]
      },
      {
        "id" : "QuestionnaireResponse.item:graspSubscale.item:aBlock7_5cm3",
        "path" : "QuestionnaireResponse.item.item",
        "sliceName" : "aBlock7_5cm3",
        "min" : 1,
        "max" : "1",
        "type" : [
          {
            "code" : "BackboneElement"
          }
        ]
      },
      {
        "id" : "QuestionnaireResponse.item:graspSubscale.item:aBlock7_5cm3.linkId",
        "path" : "QuestionnaireResponse.item.item.linkId",
        "fixedString" : "a-block-7.5cm3"
      },
      {
        "id" : "QuestionnaireResponse.item:graspSubscale.item:aBlock7_5cm3.text",
        "path" : "QuestionnaireResponse.item.item.text",
        "patternString" : "方塊積木, 7.5 立方公分"
      },
      {
        "id" : "QuestionnaireResponse.item:graspSubscale.item:aBlock7_5cm3.answer",
        "path" : "QuestionnaireResponse.item.item.answer",
        "min" : 1,
        "max" : "1"
      },
      {
        "id" : "QuestionnaireResponse.item:graspSubscale.item:aBlock7_5cm3.answer.value[x]",
        "path" : "QuestionnaireResponse.item.item.answer.value[x]",
        "type" : [
          {
            "code" : "integer"
          }
        ]
      },
      {
        "id" : "QuestionnaireResponse.item:graspSubscale.item:aBlock7_5cm3.item",
        "path" : "QuestionnaireResponse.item.item.item",
        "slicing" : {
          "discriminator" : [
            {
              "type" : "value",
              "path" : "linkId"
            }
          ],
          "rules" : "open"
        }
      },
      {
        "id" : "QuestionnaireResponse.item:graspSubscale.item:aBlock7_5cm3.item:testTimeA4",
        "path" : "QuestionnaireResponse.item.item.item",
        "sliceName" : "testTimeA4",
        "min" : 0,
        "max" : "1",
        "type" : [
          {
            "code" : "BackboneElement"
          }
        ]
      },
      {
        "id" : "QuestionnaireResponse.item:graspSubscale.item:aBlock7_5cm3.item:testTimeA4.linkId",
        "path" : "QuestionnaireResponse.item.item.item.linkId",
        "fixedString" : "a-block-7.5cm3-seconds"
      },
      {
        "id" : "QuestionnaireResponse.item:graspSubscale.item:aBlock7_5cm3.item:testTimeA4.answer",
        "path" : "QuestionnaireResponse.item.item.item.answer",
        "max" : "1"
      },
      {
        "id" : "QuestionnaireResponse.item:graspSubscale.item:aBlock7_5cm3.item:testTimeA4.answer.value[x]",
        "path" : "QuestionnaireResponse.item.item.item.answer.value[x]",
        "type" : [
          {
            "code" : "decimal"
          }
        ]
      },
      {
        "id" : "QuestionnaireResponse.item:graspSubscale.item:aCricketBall",
        "path" : "QuestionnaireResponse.item.item",
        "sliceName" : "aCricketBall",
        "min" : 1,
        "max" : "1",
        "type" : [
          {
            "code" : "BackboneElement"
          }
        ]
      },
      {
        "id" : "QuestionnaireResponse.item:graspSubscale.item:aCricketBall.linkId",
        "path" : "QuestionnaireResponse.item.item.linkId",
        "fixedString" : "a-cricket-ball"
      },
      {
        "id" : "QuestionnaireResponse.item:graspSubscale.item:aCricketBall.text",
        "path" : "QuestionnaireResponse.item.item.text",
        "patternString" : "板球"
      },
      {
        "id" : "QuestionnaireResponse.item:graspSubscale.item:aCricketBall.answer",
        "path" : "QuestionnaireResponse.item.item.answer",
        "min" : 1,
        "max" : "1"
      },
      {
        "id" : "QuestionnaireResponse.item:graspSubscale.item:aCricketBall.answer.value[x]",
        "path" : "QuestionnaireResponse.item.item.answer.value[x]",
        "type" : [
          {
            "code" : "integer"
          }
        ]
      },
      {
        "id" : "QuestionnaireResponse.item:graspSubscale.item:aCricketBall.item",
        "path" : "QuestionnaireResponse.item.item.item",
        "slicing" : {
          "discriminator" : [
            {
              "type" : "value",
              "path" : "linkId"
            }
          ],
          "rules" : "open"
        }
      },
      {
        "id" : "QuestionnaireResponse.item:graspSubscale.item:aCricketBall.item:testTimeA5",
        "path" : "QuestionnaireResponse.item.item.item",
        "sliceName" : "testTimeA5",
        "min" : 0,
        "max" : "1",
        "type" : [
          {
            "code" : "BackboneElement"
          }
        ]
      },
      {
        "id" : "QuestionnaireResponse.item:graspSubscale.item:aCricketBall.item:testTimeA5.linkId",
        "path" : "QuestionnaireResponse.item.item.item.linkId",
        "fixedString" : "a-cricket-ball-seconds"
      },
      {
        "id" : "QuestionnaireResponse.item:graspSubscale.item:aCricketBall.item:testTimeA5.answer",
        "path" : "QuestionnaireResponse.item.item.item.answer",
        "max" : "1"
      },
      {
        "id" : "QuestionnaireResponse.item:graspSubscale.item:aCricketBall.item:testTimeA5.answer.value[x]",
        "path" : "QuestionnaireResponse.item.item.item.answer.value[x]",
        "type" : [
          {
            "code" : "decimal"
          }
        ]
      },
      {
        "id" : "QuestionnaireResponse.item:graspSubscale.item:aSharpeningStone",
        "path" : "QuestionnaireResponse.item.item",
        "sliceName" : "aSharpeningStone",
        "min" : 1,
        "max" : "1",
        "type" : [
          {
            "code" : "BackboneElement"
          }
        ]
      },
      {
        "id" : "QuestionnaireResponse.item:graspSubscale.item:aSharpeningStone.linkId",
        "path" : "QuestionnaireResponse.item.item.linkId",
        "fixedString" : "a-sharpening-stone"
      },
      {
        "id" : "QuestionnaireResponse.item:graspSubscale.item:aSharpeningStone.text",
        "path" : "QuestionnaireResponse.item.item.text",
        "patternString" : "磨刀石"
      },
      {
        "id" : "QuestionnaireResponse.item:graspSubscale.item:aSharpeningStone.answer",
        "path" : "QuestionnaireResponse.item.item.answer",
        "min" : 1,
        "max" : "1"
      },
      {
        "id" : "QuestionnaireResponse.item:graspSubscale.item:aSharpeningStone.answer.value[x]",
        "path" : "QuestionnaireResponse.item.item.answer.value[x]",
        "type" : [
          {
            "code" : "integer"
          }
        ]
      },
      {
        "id" : "QuestionnaireResponse.item:graspSubscale.item:aSharpeningStone.item",
        "path" : "QuestionnaireResponse.item.item.item",
        "slicing" : {
          "discriminator" : [
            {
              "type" : "value",
              "path" : "linkId"
            }
          ],
          "rules" : "open"
        }
      },
      {
        "id" : "QuestionnaireResponse.item:graspSubscale.item:aSharpeningStone.item:testTimeA6",
        "path" : "QuestionnaireResponse.item.item.item",
        "sliceName" : "testTimeA6",
        "min" : 0,
        "max" : "1",
        "type" : [
          {
            "code" : "BackboneElement"
          }
        ]
      },
      {
        "id" : "QuestionnaireResponse.item:graspSubscale.item:aSharpeningStone.item:testTimeA6.linkId",
        "path" : "QuestionnaireResponse.item.item.item.linkId",
        "fixedString" : "a-sharpening-stone-seconds"
      },
      {
        "id" : "QuestionnaireResponse.item:graspSubscale.item:aSharpeningStone.item:testTimeA6.answer",
        "path" : "QuestionnaireResponse.item.item.item.answer",
        "max" : "1"
      },
      {
        "id" : "QuestionnaireResponse.item:graspSubscale.item:aSharpeningStone.item:testTimeA6.answer.value[x]",
        "path" : "QuestionnaireResponse.item.item.item.answer.value[x]",
        "type" : [
          {
            "code" : "decimal"
          }
        ]
      },
      {
        "id" : "QuestionnaireResponse.item:graspSubscale.item:sectionASubscore",
        "path" : "QuestionnaireResponse.item.item",
        "sliceName" : "sectionASubscore",
        "min" : 1,
        "max" : "1",
        "type" : [
          {
            "code" : "BackboneElement"
          }
        ]
      },
      {
        "id" : "QuestionnaireResponse.item:graspSubscale.item:sectionASubscore.linkId",
        "path" : "QuestionnaireResponse.item.item.linkId",
        "fixedString" : "section-a-subscore"
      },
      {
        "id" : "QuestionnaireResponse.item:graspSubscale.item:sectionASubscore.text",
        "path" : "QuestionnaireResponse.item.item.text",
        "patternString" : "A分量表分數（抓握）"
      },
      {
        "id" : "QuestionnaireResponse.item:graspSubscale.item:sectionASubscore.answer",
        "path" : "QuestionnaireResponse.item.item.answer",
        "min" : 1,
        "max" : "1"
      },
      {
        "id" : "QuestionnaireResponse.item:graspSubscale.item:sectionASubscore.answer.value[x]",
        "path" : "QuestionnaireResponse.item.item.answer.value[x]",
        "type" : [
          {
            "code" : "integer"
          }
        ]
      },
      {
        "id" : "QuestionnaireResponse.item:gripSubscale",
        "path" : "QuestionnaireResponse.item",
        "sliceName" : "gripSubscale",
        "min" : 1,
        "max" : "1",
        "mustSupport" : true
      },
      {
        "id" : "QuestionnaireResponse.item:gripSubscale.linkId",
        "path" : "QuestionnaireResponse.item.linkId",
        "fixedString" : "section-b-grip-subscale"
      },
      {
        "id" : "QuestionnaireResponse.item:gripSubscale.text",
        "path" : "QuestionnaireResponse.item.text",
        "patternString" : "握力分量表"
      },
      {
        "id" : "QuestionnaireResponse.item:gripSubscale.item",
        "path" : "QuestionnaireResponse.item.item",
        "slicing" : {
          "discriminator" : [
            {
              "type" : "value",
              "path" : "linkId"
            }
          ],
          "rules" : "closed"
        },
        "min" : 5
      },
      {
        "id" : "QuestionnaireResponse.item:gripSubscale.item:bPourWater",
        "path" : "QuestionnaireResponse.item.item",
        "sliceName" : "bPourWater",
        "min" : 1,
        "max" : "1",
        "type" : [
          {
            "code" : "BackboneElement"
          }
        ]
      },
      {
        "id" : "QuestionnaireResponse.item:gripSubscale.item:bPourWater.linkId",
        "path" : "QuestionnaireResponse.item.item.linkId",
        "fixedString" : "b-pour-water-from-one-glass-to-another"
      },
      {
        "id" : "QuestionnaireResponse.item:gripSubscale.item:bPourWater.answer",
        "path" : "QuestionnaireResponse.item.item.answer",
        "min" : 1,
        "max" : "1"
      },
      {
        "id" : "QuestionnaireResponse.item:gripSubscale.item:bPourWater.answer.value[x]",
        "path" : "QuestionnaireResponse.item.item.answer.value[x]",
        "type" : [
          {
            "code" : "integer"
          }
        ]
      },
      {
        "id" : "QuestionnaireResponse.item:gripSubscale.item:bDisplace225cm",
        "path" : "QuestionnaireResponse.item.item",
        "sliceName" : "bDisplace225cm",
        "min" : 1,
        "max" : "1",
        "type" : [
          {
            "code" : "BackboneElement"
          }
        ]
      },
      {
        "id" : "QuestionnaireResponse.item:gripSubscale.item:bDisplace225cm.linkId",
        "path" : "QuestionnaireResponse.item.item.linkId",
        "fixedString" : "b-displace-2.25-cm-alloy-tube-from-one-side-oftable-to-the-other"
      },
      {
        "id" : "QuestionnaireResponse.item:gripSubscale.item:bDisplace225cm.answer",
        "path" : "QuestionnaireResponse.item.item.answer",
        "min" : 1,
        "max" : "1"
      },
      {
        "id" : "QuestionnaireResponse.item:gripSubscale.item:bDisplace225cm.answer.value[x]",
        "path" : "QuestionnaireResponse.item.item.answer.value[x]",
        "type" : [
          {
            "code" : "integer"
          }
        ]
      },
      {
        "id" : "QuestionnaireResponse.item:gripSubscale.item:bDisplace1cm",
        "path" : "QuestionnaireResponse.item.item",
        "sliceName" : "bDisplace1cm",
        "min" : 1,
        "max" : "1",
        "type" : [
          {
            "code" : "BackboneElement"
          }
        ]
      },
      {
        "id" : "QuestionnaireResponse.item:gripSubscale.item:bDisplace1cm.linkId",
        "path" : "QuestionnaireResponse.item.item.linkId",
        "fixedString" : "b-displace-1-cm-alloy-tube-from-one-side-of-table-to-the-other"
      },
      {
        "id" : "QuestionnaireResponse.item:gripSubscale.item:bDisplace1cm.answer",
        "path" : "QuestionnaireResponse.item.item.answer",
        "min" : 1,
        "max" : "1"
      },
      {
        "id" : "QuestionnaireResponse.item:gripSubscale.item:bDisplace1cm.answer.value[x]",
        "path" : "QuestionnaireResponse.item.item.answer.value[x]",
        "type" : [
          {
            "code" : "integer"
          }
        ]
      },
      {
        "id" : "QuestionnaireResponse.item:gripSubscale.item:bPutWasher",
        "path" : "QuestionnaireResponse.item.item",
        "sliceName" : "bPutWasher",
        "min" : 1,
        "max" : "1",
        "type" : [
          {
            "code" : "BackboneElement"
          }
        ]
      },
      {
        "id" : "QuestionnaireResponse.item:gripSubscale.item:bPutWasher.linkId",
        "path" : "QuestionnaireResponse.item.item.linkId",
        "fixedString" : "b-put-washer-over-bolt"
      },
      {
        "id" : "QuestionnaireResponse.item:gripSubscale.item:bPutWasher.answer",
        "path" : "QuestionnaireResponse.item.item.answer",
        "min" : 1,
        "max" : "1"
      },
      {
        "id" : "QuestionnaireResponse.item:gripSubscale.item:bPutWasher.answer.value[x]",
        "path" : "QuestionnaireResponse.item.item.answer.value[x]",
        "type" : [
          {
            "code" : "integer"
          }
        ]
      },
      {
        "id" : "QuestionnaireResponse.item:gripSubscale.item:sectionBSubscore",
        "path" : "QuestionnaireResponse.item.item",
        "sliceName" : "sectionBSubscore",
        "min" : 1,
        "max" : "1",
        "type" : [
          {
            "code" : "BackboneElement"
          }
        ]
      },
      {
        "id" : "QuestionnaireResponse.item:gripSubscale.item:sectionBSubscore.linkId",
        "path" : "QuestionnaireResponse.item.item.linkId",
        "fixedString" : "section-b-subscore"
      },
      {
        "id" : "QuestionnaireResponse.item:gripSubscale.item:sectionBSubscore.text",
        "path" : "QuestionnaireResponse.item.item.text",
        "patternString" : "B分量表分數（握力）"
      },
      {
        "id" : "QuestionnaireResponse.item:gripSubscale.item:sectionBSubscore.answer",
        "path" : "QuestionnaireResponse.item.item.answer",
        "min" : 1,
        "max" : "1"
      },
      {
        "id" : "QuestionnaireResponse.item:gripSubscale.item:sectionBSubscore.answer.value[x]",
        "path" : "QuestionnaireResponse.item.item.answer.value[x]",
        "type" : [
          {
            "code" : "integer"
          }
        ]
      },
      {
        "id" : "QuestionnaireResponse.item:pinchSubscale",
        "path" : "QuestionnaireResponse.item",
        "sliceName" : "pinchSubscale",
        "min" : 1,
        "max" : "1",
        "mustSupport" : true
      },
      {
        "id" : "QuestionnaireResponse.item:pinchSubscale.linkId",
        "path" : "QuestionnaireResponse.item.linkId",
        "fixedString" : "section-c-pinch-subscale"
      },
      {
        "id" : "QuestionnaireResponse.item:pinchSubscale.text",
        "path" : "QuestionnaireResponse.item.text",
        "patternString" : "握力分量表"
      },
      {
        "id" : "QuestionnaireResponse.item:pinchSubscale.item",
        "path" : "QuestionnaireResponse.item.item",
        "slicing" : {
          "discriminator" : [
            {
              "type" : "value",
              "path" : "linkId"
            }
          ],
          "rules" : "closed"
        },
        "min" : 7
      },
      {
        "id" : "QuestionnaireResponse.item:pinchSubscale.item:cBallBearingRing",
        "path" : "QuestionnaireResponse.item.item",
        "sliceName" : "cBallBearingRing",
        "min" : 1,
        "max" : "1",
        "type" : [
          {
            "code" : "BackboneElement"
          }
        ]
      },
      {
        "id" : "QuestionnaireResponse.item:pinchSubscale.item:cBallBearingRing.linkId",
        "path" : "QuestionnaireResponse.item.item.linkId",
        "fixedString" : "c-ball-bearing-held-between-ring-finger-and-thumb"
      },
      {
        "id" : "QuestionnaireResponse.item:pinchSubscale.item:cBallBearingRing.answer",
        "path" : "QuestionnaireResponse.item.item.answer",
        "min" : 1,
        "max" : "1"
      },
      {
        "id" : "QuestionnaireResponse.item:pinchSubscale.item:cBallBearingRing.answer.value[x]",
        "path" : "QuestionnaireResponse.item.item.answer.value[x]",
        "type" : [
          {
            "code" : "integer"
          }
        ]
      },
      {
        "id" : "QuestionnaireResponse.item:pinchSubscale.item:cMarbleIndex",
        "path" : "QuestionnaireResponse.item.item",
        "sliceName" : "cMarbleIndex",
        "min" : 1,
        "max" : "1",
        "type" : [
          {
            "code" : "BackboneElement"
          }
        ]
      },
      {
        "id" : "QuestionnaireResponse.item:pinchSubscale.item:cMarbleIndex.linkId",
        "path" : "QuestionnaireResponse.item.item.linkId",
        "fixedString" : "c-marble-held-between-index-finger-and-thumb"
      },
      {
        "id" : "QuestionnaireResponse.item:pinchSubscale.item:cMarbleIndex.answer",
        "path" : "QuestionnaireResponse.item.item.answer",
        "min" : 1,
        "max" : "1"
      },
      {
        "id" : "QuestionnaireResponse.item:pinchSubscale.item:cMarbleIndex.answer.value[x]",
        "path" : "QuestionnaireResponse.item.item.answer.value[x]",
        "type" : [
          {
            "code" : "integer"
          }
        ]
      },
      {
        "id" : "QuestionnaireResponse.item:pinchSubscale.item:cBallBearingMiddle",
        "path" : "QuestionnaireResponse.item.item",
        "sliceName" : "cBallBearingMiddle",
        "min" : 1,
        "max" : "1",
        "type" : [
          {
            "code" : "BackboneElement"
          }
        ]
      },
      {
        "id" : "QuestionnaireResponse.item:pinchSubscale.item:cBallBearingMiddle.linkId",
        "path" : "QuestionnaireResponse.item.item.linkId",
        "fixedString" : "c-ball-bearing-held-between-middle-finger-and-thumb"
      },
      {
        "id" : "QuestionnaireResponse.item:pinchSubscale.item:cBallBearingMiddle.answer",
        "path" : "QuestionnaireResponse.item.item.answer",
        "min" : 1,
        "max" : "1"
      },
      {
        "id" : "QuestionnaireResponse.item:pinchSubscale.item:cBallBearingMiddle.answer.value[x]",
        "path" : "QuestionnaireResponse.item.item.answer.value[x]",
        "type" : [
          {
            "code" : "integer"
          }
        ]
      },
      {
        "id" : "QuestionnaireResponse.item:pinchSubscale.item:cBallBearingIndex",
        "path" : "QuestionnaireResponse.item.item",
        "sliceName" : "cBallBearingIndex",
        "min" : 1,
        "max" : "1",
        "type" : [
          {
            "code" : "BackboneElement"
          }
        ]
      },
      {
        "id" : "QuestionnaireResponse.item:pinchSubscale.item:cBallBearingIndex.linkId",
        "path" : "QuestionnaireResponse.item.item.linkId",
        "fixedString" : "c-ball-bearing-held-between-index-finger-and-thumb"
      },
      {
        "id" : "QuestionnaireResponse.item:pinchSubscale.item:cBallBearingIndex.answer",
        "path" : "QuestionnaireResponse.item.item.answer",
        "min" : 1,
        "max" : "1"
      },
      {
        "id" : "QuestionnaireResponse.item:pinchSubscale.item:cBallBearingIndex.answer.value[x]",
        "path" : "QuestionnaireResponse.item.item.answer.value[x]",
        "type" : [
          {
            "code" : "integer"
          }
        ]
      },
      {
        "id" : "QuestionnaireResponse.item:pinchSubscale.item:cMarbleRing",
        "path" : "QuestionnaireResponse.item.item",
        "sliceName" : "cMarbleRing",
        "min" : 1,
        "max" : "1",
        "type" : [
          {
            "code" : "BackboneElement"
          }
        ]
      },
      {
        "id" : "QuestionnaireResponse.item:pinchSubscale.item:cMarbleRing.linkId",
        "path" : "QuestionnaireResponse.item.item.linkId",
        "fixedString" : "c-marble-held-between-ring-finger-and-thumb"
      },
      {
        "id" : "QuestionnaireResponse.item:pinchSubscale.item:cMarbleRing.answer",
        "path" : "QuestionnaireResponse.item.item.answer",
        "min" : 1,
        "max" : "1"
      },
      {
        "id" : "QuestionnaireResponse.item:pinchSubscale.item:cMarbleRing.answer.value[x]",
        "path" : "QuestionnaireResponse.item.item.answer.value[x]",
        "type" : [
          {
            "code" : "integer"
          }
        ]
      },
      {
        "id" : "QuestionnaireResponse.item:pinchSubscale.item:cMarbleMiddle",
        "path" : "QuestionnaireResponse.item.item",
        "sliceName" : "cMarbleMiddle",
        "min" : 1,
        "max" : "1",
        "type" : [
          {
            "code" : "BackboneElement"
          }
        ]
      },
      {
        "id" : "QuestionnaireResponse.item:pinchSubscale.item:cMarbleMiddle.linkId",
        "path" : "QuestionnaireResponse.item.item.linkId",
        "fixedString" : "c-marble-held-between-middle-finger-and-thumb"
      },
      {
        "id" : "QuestionnaireResponse.item:pinchSubscale.item:cMarbleMiddle.answer",
        "path" : "QuestionnaireResponse.item.item.answer",
        "min" : 1,
        "max" : "1"
      },
      {
        "id" : "QuestionnaireResponse.item:pinchSubscale.item:cMarbleMiddle.answer.value[x]",
        "path" : "QuestionnaireResponse.item.item.answer.value[x]",
        "type" : [
          {
            "code" : "integer"
          }
        ]
      },
      {
        "id" : "QuestionnaireResponse.item:pinchSubscale.item:sectionCSubscore",
        "path" : "QuestionnaireResponse.item.item",
        "sliceName" : "sectionCSubscore",
        "min" : 1,
        "max" : "1",
        "type" : [
          {
            "code" : "BackboneElement"
          }
        ]
      },
      {
        "id" : "QuestionnaireResponse.item:pinchSubscale.item:sectionCSubscore.linkId",
        "path" : "QuestionnaireResponse.item.item.linkId",
        "fixedString" : "section-c-subscore"
      },
      {
        "id" : "QuestionnaireResponse.item:pinchSubscale.item:sectionCSubscore.text",
        "path" : "QuestionnaireResponse.item.item.text",
        "patternString" : "C分量表分數（捏取）"
      },
      {
        "id" : "QuestionnaireResponse.item:pinchSubscale.item:sectionCSubscore.answer",
        "path" : "QuestionnaireResponse.item.item.answer",
        "min" : 1,
        "max" : "1"
      },
      {
        "id" : "QuestionnaireResponse.item:pinchSubscale.item:sectionCSubscore.answer.value[x]",
        "path" : "QuestionnaireResponse.item.item.answer.value[x]",
        "type" : [
          {
            "code" : "integer"
          }
        ]
      },
      {
        "id" : "QuestionnaireResponse.item:grossMovementSubscale",
        "path" : "QuestionnaireResponse.item",
        "sliceName" : "grossMovementSubscale",
        "min" : 1,
        "max" : "1",
        "mustSupport" : true
      },
      {
        "id" : "QuestionnaireResponse.item:grossMovementSubscale.linkId",
        "path" : "QuestionnaireResponse.item.linkId",
        "fixedString" : "section-d-gross-movement-subscale"
      },
      {
        "id" : "QuestionnaireResponse.item:grossMovementSubscale.text",
        "path" : "QuestionnaireResponse.item.text",
        "patternString" : "握力分量表"
      },
      {
        "id" : "QuestionnaireResponse.item:grossMovementSubscale.item",
        "path" : "QuestionnaireResponse.item.item",
        "slicing" : {
          "discriminator" : [
            {
              "type" : "value",
              "path" : "linkId"
            }
          ],
          "rules" : "closed"
        },
        "min" : 4
      },
      {
        "id" : "QuestionnaireResponse.item:grossMovementSubscale.item:dHandBehindHead",
        "path" : "QuestionnaireResponse.item.item",
        "sliceName" : "dHandBehindHead",
        "min" : 1,
        "max" : "1",
        "type" : [
          {
            "code" : "BackboneElement"
          }
        ]
      },
      {
        "id" : "QuestionnaireResponse.item:grossMovementSubscale.item:dHandBehindHead.linkId",
        "path" : "QuestionnaireResponse.item.item.linkId",
        "fixedString" : "d-hand-to-behind-the-head"
      },
      {
        "id" : "QuestionnaireResponse.item:grossMovementSubscale.item:dHandBehindHead.answer",
        "path" : "QuestionnaireResponse.item.item.answer",
        "min" : 1,
        "max" : "1"
      },
      {
        "id" : "QuestionnaireResponse.item:grossMovementSubscale.item:dHandBehindHead.answer.value[x]",
        "path" : "QuestionnaireResponse.item.item.answer.value[x]",
        "type" : [
          {
            "code" : "integer"
          }
        ]
      },
      {
        "id" : "QuestionnaireResponse.item:grossMovementSubscale.item:dHandTopHead",
        "path" : "QuestionnaireResponse.item.item",
        "sliceName" : "dHandTopHead",
        "min" : 1,
        "max" : "1",
        "type" : [
          {
            "code" : "BackboneElement"
          }
        ]
      },
      {
        "id" : "QuestionnaireResponse.item:grossMovementSubscale.item:dHandTopHead.linkId",
        "path" : "QuestionnaireResponse.item.item.linkId",
        "fixedString" : "d-hand-to-top-of-head"
      },
      {
        "id" : "QuestionnaireResponse.item:grossMovementSubscale.item:dHandTopHead.answer",
        "path" : "QuestionnaireResponse.item.item.answer",
        "min" : 1,
        "max" : "1"
      },
      {
        "id" : "QuestionnaireResponse.item:grossMovementSubscale.item:dHandTopHead.answer.value[x]",
        "path" : "QuestionnaireResponse.item.item.answer.value[x]",
        "type" : [
          {
            "code" : "integer"
          }
        ]
      },
      {
        "id" : "QuestionnaireResponse.item:grossMovementSubscale.item:dHandMouth",
        "path" : "QuestionnaireResponse.item.item",
        "sliceName" : "dHandMouth",
        "min" : 1,
        "max" : "1",
        "type" : [
          {
            "code" : "BackboneElement"
          }
        ]
      },
      {
        "id" : "QuestionnaireResponse.item:grossMovementSubscale.item:dHandMouth.linkId",
        "path" : "QuestionnaireResponse.item.item.linkId",
        "fixedString" : "d-hand-to-mouth"
      },
      {
        "id" : "QuestionnaireResponse.item:grossMovementSubscale.item:dHandMouth.answer",
        "path" : "QuestionnaireResponse.item.item.answer",
        "min" : 1,
        "max" : "1"
      },
      {
        "id" : "QuestionnaireResponse.item:grossMovementSubscale.item:dHandMouth.answer.value[x]",
        "path" : "QuestionnaireResponse.item.item.answer.value[x]",
        "type" : [
          {
            "code" : "integer"
          }
        ]
      },
      {
        "id" : "QuestionnaireResponse.item:grossMovementSubscale.item:sectionDSubscore",
        "path" : "QuestionnaireResponse.item.item",
        "sliceName" : "sectionDSubscore",
        "min" : 1,
        "max" : "1",
        "type" : [
          {
            "code" : "BackboneElement"
          }
        ]
      },
      {
        "id" : "QuestionnaireResponse.item:grossMovementSubscale.item:sectionDSubscore.linkId",
        "path" : "QuestionnaireResponse.item.item.linkId",
        "fixedString" : "section-d-subscore"
      },
      {
        "id" : "QuestionnaireResponse.item:grossMovementSubscale.item:sectionDSubscore.text",
        "path" : "QuestionnaireResponse.item.item.text",
        "patternString" : "D分量表分數（粗動作）"
      },
      {
        "id" : "QuestionnaireResponse.item:grossMovementSubscale.item:sectionDSubscore.answer",
        "path" : "QuestionnaireResponse.item.item.answer",
        "min" : 1,
        "max" : "1"
      },
      {
        "id" : "QuestionnaireResponse.item:grossMovementSubscale.item:sectionDSubscore.answer.value[x]",
        "path" : "QuestionnaireResponse.item.item.answer.value[x]",
        "type" : [
          {
            "code" : "integer"
          }
        ]
      },
      {
        "id" : "QuestionnaireResponse.item:totalScoreSection",
        "path" : "QuestionnaireResponse.item",
        "sliceName" : "totalScoreSection",
        "min" : 1,
        "max" : "1",
        "mustSupport" : true
      },
      {
        "id" : "QuestionnaireResponse.item:totalScoreSection.linkId",
        "path" : "QuestionnaireResponse.item.linkId",
        "fixedString" : "section-e-total-score"
      },
      {
        "id" : "QuestionnaireResponse.item:totalScoreSection.text",
        "path" : "QuestionnaireResponse.item.text",
        "patternString" : "ARAT 總分計算"
      },
      {
        "id" : "QuestionnaireResponse.item:totalScoreSection.item",
        "path" : "QuestionnaireResponse.item.item",
        "slicing" : {
          "discriminator" : [
            {
              "type" : "value",
              "path" : "linkId"
            }
          ],
          "rules" : "closed"
        },
        "min" : 6
      },
      {
        "id" : "QuestionnaireResponse.item:totalScoreSection.item:sectionsSummary",
        "path" : "QuestionnaireResponse.item.item",
        "sliceName" : "sectionsSummary",
        "min" : 1,
        "max" : "1",
        "type" : [
          {
            "code" : "BackboneElement"
          }
        ]
      },
      {
        "id" : "QuestionnaireResponse.item:totalScoreSection.item:sectionsSummary.linkId",
        "path" : "QuestionnaireResponse.item.item.linkId",
        "fixedString" : "section-scores-summary"
      },
      {
        "id" : "QuestionnaireResponse.item:totalScoreSection.item:sectionsSummary.text",
        "path" : "QuestionnaireResponse.item.item.text",
        "patternString" : "各分量表分數"
      },
      {
        "id" : "QuestionnaireResponse.item:totalScoreSection.item:graspScoreDisplay",
        "path" : "QuestionnaireResponse.item.item",
        "sliceName" : "graspScoreDisplay",
        "min" : 1,
        "max" : "1",
        "type" : [
          {
            "code" : "BackboneElement"
          }
        ]
      },
      {
        "id" : "QuestionnaireResponse.item:totalScoreSection.item:graspScoreDisplay.linkId",
        "path" : "QuestionnaireResponse.item.item.linkId",
        "fixedString" : "grasp-score-display"
      },
      {
        "id" : "QuestionnaireResponse.item:totalScoreSection.item:graspScoreDisplay.answer",
        "path" : "QuestionnaireResponse.item.item.answer",
        "min" : 1,
        "max" : "1"
      },
      {
        "id" : "QuestionnaireResponse.item:totalScoreSection.item:graspScoreDisplay.answer.value[x]",
        "path" : "QuestionnaireResponse.item.item.answer.value[x]",
        "type" : [
          {
            "code" : "integer"
          }
        ]
      },
      {
        "id" : "QuestionnaireResponse.item:totalScoreSection.item:gripScoreDisplay",
        "path" : "QuestionnaireResponse.item.item",
        "sliceName" : "gripScoreDisplay",
        "min" : 1,
        "max" : "1",
        "type" : [
          {
            "code" : "BackboneElement"
          }
        ]
      },
      {
        "id" : "QuestionnaireResponse.item:totalScoreSection.item:gripScoreDisplay.linkId",
        "path" : "QuestionnaireResponse.item.item.linkId",
        "fixedString" : "grip-score-display"
      },
      {
        "id" : "QuestionnaireResponse.item:totalScoreSection.item:gripScoreDisplay.answer",
        "path" : "QuestionnaireResponse.item.item.answer",
        "min" : 1,
        "max" : "1"
      },
      {
        "id" : "QuestionnaireResponse.item:totalScoreSection.item:gripScoreDisplay.answer.value[x]",
        "path" : "QuestionnaireResponse.item.item.answer.value[x]",
        "type" : [
          {
            "code" : "integer"
          }
        ]
      },
      {
        "id" : "QuestionnaireResponse.item:totalScoreSection.item:pinchScoreDisplay",
        "path" : "QuestionnaireResponse.item.item",
        "sliceName" : "pinchScoreDisplay",
        "min" : 1,
        "max" : "1",
        "type" : [
          {
            "code" : "BackboneElement"
          }
        ]
      },
      {
        "id" : "QuestionnaireResponse.item:totalScoreSection.item:pinchScoreDisplay.linkId",
        "path" : "QuestionnaireResponse.item.item.linkId",
        "fixedString" : "pinch-score-display"
      },
      {
        "id" : "QuestionnaireResponse.item:totalScoreSection.item:pinchScoreDisplay.answer",
        "path" : "QuestionnaireResponse.item.item.answer",
        "min" : 1,
        "max" : "1"
      },
      {
        "id" : "QuestionnaireResponse.item:totalScoreSection.item:pinchScoreDisplay.answer.value[x]",
        "path" : "QuestionnaireResponse.item.item.answer.value[x]",
        "type" : [
          {
            "code" : "integer"
          }
        ]
      },
      {
        "id" : "QuestionnaireResponse.item:totalScoreSection.item:movementScoreDisplay",
        "path" : "QuestionnaireResponse.item.item",
        "sliceName" : "movementScoreDisplay",
        "min" : 1,
        "max" : "1",
        "type" : [
          {
            "code" : "BackboneElement"
          }
        ]
      },
      {
        "id" : "QuestionnaireResponse.item:totalScoreSection.item:movementScoreDisplay.linkId",
        "path" : "QuestionnaireResponse.item.item.linkId",
        "fixedString" : "movement-score-display"
      },
      {
        "id" : "QuestionnaireResponse.item:totalScoreSection.item:movementScoreDisplay.answer",
        "path" : "QuestionnaireResponse.item.item.answer",
        "min" : 1,
        "max" : "1"
      },
      {
        "id" : "QuestionnaireResponse.item:totalScoreSection.item:movementScoreDisplay.answer.value[x]",
        "path" : "QuestionnaireResponse.item.item.answer.value[x]",
        "type" : [
          {
            "code" : "integer"
          }
        ]
      },
      {
        "id" : "QuestionnaireResponse.item:totalScoreSection.item:aratTotalScore",
        "path" : "QuestionnaireResponse.item.item",
        "sliceName" : "aratTotalScore",
        "min" : 1,
        "max" : "1",
        "type" : [
          {
            "code" : "BackboneElement"
          }
        ]
      },
      {
        "id" : "QuestionnaireResponse.item:totalScoreSection.item:aratTotalScore.linkId",
        "path" : "QuestionnaireResponse.item.item.linkId",
        "fixedString" : "arat-total-score"
      },
      {
        "id" : "QuestionnaireResponse.item:totalScoreSection.item:aratTotalScore.text",
        "path" : "QuestionnaireResponse.item.item.text",
        "patternString" : "ARAT 總分"
      },
      {
        "id" : "QuestionnaireResponse.item:totalScoreSection.item:aratTotalScore.answer",
        "path" : "QuestionnaireResponse.item.item.answer",
        "min" : 1,
        "max" : "1"
      },
      {
        "id" : "QuestionnaireResponse.item:totalScoreSection.item:aratTotalScore.answer.value[x]",
        "path" : "QuestionnaireResponse.item.item.answer.value[x]",
        "type" : [
          {
            "code" : "integer"
          }
        ]
      }
    ]
  }
}

```
