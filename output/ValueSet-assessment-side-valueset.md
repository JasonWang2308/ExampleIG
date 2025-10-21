# 評估側別選項 - v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **評估側別選項**

## ValueSet: 評估側別選項 

| | |
| :--- | :--- |
| *Official URL*:http://example.org/ValueSet/assessment-side-valueset | *Version*:0.1.0 |
| Draft as of 2025-10-21 | *Computable Name*:AssessmentSideValueSet |

 
ARAT評估時選擇左側或右側的選項 

 **References** 

* [ARAT上肢功能評估問卷回覆](StructureDefinition-ARATQuestionnaireResponse.md)

### Logical Definition (CLD)

 

### Expansion

Expansion from tx.fhir.org based on SNOMED CT International edition 01-2月 2025

This value set contains 2 concepts

-------

 Explanation of the columns that may appear on this page: 

| | |
| :--- | :--- |
| Level | A few code lists that FHIR defines are hierarchical - each code is assigned a level. In this scheme, some codes are under other codes, and imply that the code they are under also applies |
| System | The source of the definition of the code (when the value set draws in codes defined elsewhere) |
| Code | The code (used as the code in the resource instance) |
| Display | The display (used in the*display*element of a[Coding](http://hl7.org/fhir/R4/datatypes.html#Coding)). If there is no display, implementers should not simply display the code, but map the concept into their application |
| Definition | An explanation of the meaning of the concept |
| Comments | Additional notes about how to use the code |



## Resource Content

```json
{
  "resourceType" : "ValueSet",
  "id" : "assessment-side-valueset",
  "url" : "http://example.org/ValueSet/assessment-side-valueset",
  "version" : "0.1.0",
  "name" : "AssessmentSideValueSet",
  "title" : "評估側別選項",
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
  "description" : "ARAT評估時選擇左側或右側的選項",
  "compose" : {
    "include" : [
      {
        "system" : "http://snomed.info/sct",
        "concept" : [
          {
            "code" : "24028007",
            "display" : "患者左側"
          },
          {
            "code" : "7771000",
            "display" : "患者右側"
          }
        ]
      }
    ]
  }
}

```
