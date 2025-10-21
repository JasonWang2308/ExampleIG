# 測試時間擴展 - v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **測試時間擴展**

## Extension: 測試時間擴展 

| | |
| :--- | :--- |
| *Official URL*:http://example.org/StructureDefinition/test-time-extension | *Version*:0.1.0 |
| Draft as of 2025-10-21 | *Computable Name*:TestTimeExtension |

記錄單一測試項目的完成時間

**Context of Use**

**Usage info**

**Usages:**

* This Extension is not used by any profiles in this Implementation Guide

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/fhir.example|current/StructureDefinition/test-time-extension)

### Formal Views of Extension Content

 [Description of Profiles, Differentials, Snapshots, and how the XML and JSON presentations work](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](StructureDefinition-test-time-extension.csv), [Excel](StructureDefinition-test-time-extension.xlsx), [Schematron](StructureDefinition-test-time-extension.sch) 

#### Constraints



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "test-time-extension",
  "url" : "http://example.org/StructureDefinition/test-time-extension",
  "version" : "0.1.0",
  "name" : "TestTimeExtension",
  "title" : "測試時間擴展",
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
  "description" : "記錄單一測試項目的完成時間",
  "fhirVersion" : "4.0.1",
  "mapping" : [
    {
      "identity" : "rim",
      "uri" : "http://hl7.org/v3",
      "name" : "RIM Mapping"
    }
  ],
  "kind" : "complex-type",
  "abstract" : false,
  "context" : [
    {
      "type" : "element",
      "expression" : "QuestionnaireResponse.item"
    }
  ],
  "type" : "Extension",
  "baseDefinition" : "http://hl7.org/fhir/StructureDefinition/Extension",
  "derivation" : "constraint",
  "differential" : {
    "element" : [
      {
        "id" : "Extension",
        "path" : "Extension",
        "short" : "測試時間擴展",
        "definition" : "記錄單一測試項目的完成時間"
      },
      {
        "id" : "Extension.extension",
        "path" : "Extension.extension",
        "max" : "0"
      },
      {
        "id" : "Extension.url",
        "path" : "Extension.url",
        "fixedUri" : "http://example.org/StructureDefinition/test-time-extension"
      },
      {
        "id" : "Extension.value[x]",
        "path" : "Extension.value[x]",
        "type" : [
          {
            "code" : "time"
          }
        ]
      }
    ]
  }
}

```
