{
  "title": "DIY Store Fantastic",
  "version": "2.4",
  "settings": {
    "pagenumber": 0,
    "editable": true,
    "fullscreenEnabled": false,
    "parameters": {
      "neodash_customer_id": "wp_13098",
      "neodash_order_id": "liv_20230211-003",
      "undefined": {
        "year": 2023,
        "month": 2,
        "day": 12
      },
      "neodash_date": {
        "year": 2023,
        "month": 2,
        "day": 14
      },
      "neodash_article_number": "23456785",
      "neodash_order_qty": 1,
      "neodash_qty_needed": "6",
      "neodash_date_needed": {
        "year": 2023,
        "month": 2,
        "day": 14
      },
      "neodash_ordered_qty": 1,
      "neodash_order_customer_id": "wp_13098",
      "neodash_order_customer_id_display": "wp_13098",
      "neodash_product_article_number": "34567891",
      "neodash_product_article_number_display": "01234567"
    },
    "theme": "dark"
  },
  "pages": [
    {
      "title": "Intro Fantastic Store",
      "reports": [
        {
          "id": "e751e7a9-e176-41b8-92f7-2638cdadb805",
          "title": "Nations in Far-Far-Away",
          "query": "In the land Far-Far-Away, there are many nations. Each possesses unique characteristics. \n\n- **Sunland**:\t A nation known for its endless sunshine and vibrant energy.\n- **Moonville**:\t A nation that thrives in the moonlight, with a culture rich in night-time traditions.\n- **Starhaven**:\t A nation located high in the mountains, where the stars seem within reach.\n- **Rainbowbay**:\t A nation famous for its seven-colored rainbows that appear after every rain.\n- **Windport**:\t A coastal nation known for its strong winds and skilled sailors.\n- **Earthgate**:\t A nation surrounded by lush forests and fertile farmlands.\n- **Firefort**:\t A nation built near a volcano, known for its skilled blacksmiths.\n- **Waterway**:\t A nation of interconnected islands and canals, where boats are the primary mode of transport.\n- **Frostlands**:\t A nation covered in snow and ice, known for its beautiful ice sculptures.\n- **Flowerfield**:\t A nation filled with blooming flowers, where every citizen is a gardener.\n- **Stonehall**:\t A nation known for its grand stone architecture and skilled masons.\n- **Skyloft**:\t A nation floating in the sky, known for its airships and cloud farms.\n- **Searock**:\t A nation with beautiful beaches and abundant marine life.\n- **Meadowmere**:\t A nation of rolling meadows and peaceful pastoral life.\n- **Timbertown**:\t A nation located in the heart of a vast forest, known for its woodcraft.\n- **Goldengrove**:\t A nation famous for its golden wheat fields and bountiful harvests.\n- **Silverstream**:\t A nation built around a shimmering silver river, known for its fish and pearls.\n\n\n\n",
          "width": 20,
          "height": 5,
          "x": 0,
          "y": 7,
          "type": "text",
          "selection": {},
          "settings": {},
          "schema": []
        },
        {
          "id": "5f36818e-9f89-438f-8b73-ab6e3f127180",
          "title": "Assignment",
          "query": "Let's observe a short history and see if everyone has a fair development opportunity.\n\nThrough the demography of the coworkers, observe if there are patterns. Patterns could indicate possible *bias*.\n\n- All coworker demography\n- Management demography\n- Demography of development for coworkers who:\n  - changed jobs within the department\n  - changed jobs and department\n  - become a manager\n  - become full-time employees\n  - become permanent employees\n  - stay at Fantastic Store after being a trainee\n\n\n\n",
          "width": 9,
          "height": 7,
          "x": 11,
          "y": 0,
          "type": "text",
          "selection": {},
          "settings": {},
          "schema": []
        },
        {
          "id": "6b3a1db0-400b-4311-bf3b-40a1d93a09bf",
          "title": "Does everyone have a fair development opportunity?",
          "query": "![poster](file:///C:/Users/SHBAC/OneDrive%20-%20IKEA/Graph%20db/analytics_on_graph/poster_2.jpg)\n\n\nIn the land Far-Far-Away, there is a country called **\"Windport\"**. In Windport, there is a store called **\"Fantastic\"**, whose mission is to create better everyday life for the many people.\n\nThe mission is carried out by a group of dedicated coworkers with a mix of gender, nationality, age and service year. They commit to helping customers. In the meantime, they develop themselves in various ways. \n",
          "width": 11,
          "height": 7,
          "x": 0,
          "y": 0,
          "type": "text",
          "selection": {},
          "settings": {},
          "schema": []
        }
      ]
    },
    {
      "title": "Coworker Development",
      "reports": [
        {
          "id": "36abf87c-6d73-43c0-b0d2-ae62b86aa541",
          "title": "Model",
          "query": "//CALL db.schema.visualization()\nCALL apoc.meta.subGraph({\n  includeLabels: [\"Coworker\",\"Department\",\"Job\",\"EmployeeGroup\", \"DeptList\", \"EmpGrpList\", \"JobList\"],\n  includeRels: [\"IS_MEMBER_OF\",\"WORKS_IN\",\"HAS_JOB\", \"IN_LIST\",\"PREVIOUS_JOB\",\"PREVIOUS_DEPARTMENT\",\"PREVIOUS_EMPLOYEE_GROUP\"]\n});\n\n",
          "width": 7,
          "height": 3,
          "x": 6,
          "y": 0,
          "type": "graph",
          "selection": {
            "Coworker": "name",
            "Department": "name",
            "DeptList": "name",
            "EmpGrpList": "name",
            "EmployeeGroup": "name",
            "Job": "name",
            "JobList": "name",
            "IN_LIST": "(label)",
            "HAS_JOB": "(label)",
            "PREVIOUS_JOB": "(label)",
            "PREVIOUS_DEPARTMENT": "(label)",
            "WORKS_IN": "(label)",
            "PREVIOUS_EMPLOYEE_GROUP": "(label)",
            "IS_MEMBER_OF": "(label)"
          },
          "settings": {
            "hideSelections": true,
            "fullscreenEnabled": true
          },
          "schema": [
            [
              "Coworker",
              "name",
              "count"
            ],
            [
              "Department",
              "name",
              "count"
            ],
            [
              "DeptList",
              "name",
              "count"
            ],
            [
              "EmpGrpList",
              "name",
              "count"
            ],
            [
              "EmployeeGroup",
              "name",
              "count"
            ],
            [
              "Job",
              "name",
              "count"
            ],
            [
              "JobList",
              "name",
              "count"
            ],
            [
              "IN_LIST",
              "count",
              "type",
              "in",
              "out"
            ],
            [
              "HAS_JOB",
              "count",
              "type",
              "in",
              "out"
            ],
            [
              "PREVIOUS_JOB",
              "count",
              "type",
              "in",
              "out"
            ],
            [
              "PREVIOUS_DEPARTMENT",
              "count",
              "type",
              "in",
              "out"
            ],
            [
              "WORKS_IN",
              "count",
              "type",
              "in",
              "out"
            ],
            [
              "PREVIOUS_EMPLOYEE_GROUP",
              "count",
              "type",
              "in",
              "out"
            ],
            [
              "IS_MEMBER_OF",
              "count",
              "type",
              "in",
              "out"
            ]
          ]
        },
        {
          "id": "5bb8f588-02a1-44c3-9b90-c5eea41a6e4b",
          "title": "Key node counts",
          "query": "MATCH (n)\nWHERE NOT \"_Neodash_Dashboard\" IN labels(n) and (\"Coworker\" in labels(n) or \"JobList\" in labels(n) or \"DeptList\" in labels(n) or \"EmpGrpList\" in labels(n))\nWITH labels(n) AS NodeType, count(n) AS Counts\nRETURN NodeType[0] as NodeType, Counts\nORDER BY NodeType\n",
          "width": 7,
          "height": 3,
          "x": 13,
          "y": 0,
          "type": "table",
          "selection": {},
          "settings": {
            "compact": true
          }
        },
        {
          "id": "8492f1d7-58ea-4baf-94cb-679d84c78d98",
          "title": "By gender - All",
          "query": "match (n:Coworker)\nreturn n.gender as Gender, count(n) as Counts\norder by Gender desc\n\n",
          "width": 5,
          "height": 3,
          "x": 0,
          "y": 10,
          "type": "bar",
          "selection": {
            "index": "Gender",
            "value": "Counts",
            "key": "(none)"
          },
          "settings": {
            "refreshButtonEnabled": true,
            "layout": "horizontal",
            "fullscreenEnabled": true,
            "barValues": true,
            "hideSelections": true,
            "styleRules": [
              {
                "field": "Gender",
                "condition": "=",
                "value": "Female",
                "customization": "bar color",
                "customizationValue": "#FACD7F"
              },
              {
                "field": "Gender",
                "condition": "=",
                "value": "Male",
                "customization": "bar color",
                "customizationValue": "#40CFFF"
              }
            ],
            "labelRotation": 45
          },
          "schema": []
        },
        {
          "id": "e7b75074-5834-4227-bfc8-6c6547f13d7d",
          "title": "By nationality - All",
          "query": "",
          "width": 5,
          "height": 3,
          "x": 5,
          "y": 10,
          "type": "bar",
          "selection": {
            "index": "Nationality",
            "value": "Counts",
            "key": "(none)"
          },
          "settings": {
            "refreshButtonEnabled": true,
            "layout": "horizontal",
            "fullscreenEnabled": true,
            "barValues": true,
            "labelRotation": 45,
            "hideSelections": true,
            "marginLeft": 100,
            "description": "Write a query to return the number of coworkers per nationality so we can see the distribution in a bar chart, largest group at the top."
          },
          "schema": []
        },
        {
          "id": "978e3673-9534-4b5c-9477-330d351a7c36",
          "title": "By age group - All",
          "query": "",
          "width": 5,
          "height": 3,
          "x": 10,
          "y": 10,
          "type": "bar",
          "selection": {
            "index": "AgeGroup",
            "value": "Counts",
            "key": "(none)"
          },
          "settings": {
            "refreshButtonEnabled": true,
            "layout": "horizontal",
            "fullscreenEnabled": true,
            "barValues": true,
            "hideSelections": true,
            "marginLeft": 100,
            "labelRotation": 45,
            "description": "Write a query to return the number of coworkers per age_group so we can see the distribution in a bar chart."
          },
          "schema": []
        },
        {
          "id": "758ac4d8-5873-4849-b1bd-eb26295d67e2",
          "title": "By service year group - All",
          "query": "match (n:Coworker)\nreturn n.service_year_group as ServiceYearGroup, count(n) as Counts\norder by ServiceYearGroup desc\n\n",
          "width": 6,
          "height": 3,
          "x": 15,
          "y": 10,
          "type": "bar",
          "selection": {
            "index": "ServiceYearGroup",
            "value": "Counts",
            "key": "(none)"
          },
          "settings": {
            "refreshButtonEnabled": true,
            "layout": "horizontal",
            "fullscreenEnabled": true,
            "barValues": true,
            "hideSelections": true,
            "marginLeft": 100
          },
          "schema": []
        },
        {
          "id": "44c9b3ad-a87d-4bd0-83eb-6f5d1ffca9be",
          "title": "By gender - is_manager",
          "query": "match (n:Coworker)-[r]->(j:Job {is_manager:true})\nwhere date(j.end_date)=date('9999-12-31')\nreturn n.gender as Gender, count(n) as Counts\norder by Gender desc\n\n",
          "width": 5,
          "height": 3,
          "x": 0,
          "y": 15,
          "type": "bar",
          "selection": {
            "index": "Gender",
            "value": "Counts",
            "key": "(none)"
          },
          "settings": {
            "refreshButtonEnabled": true,
            "layout": "horizontal",
            "fullscreenEnabled": true,
            "barValues": true,
            "hideSelections": true,
            "styleRules": [
              {
                "field": "Gender",
                "condition": "=",
                "value": "Female",
                "customization": "bar color",
                "customizationValue": "#FACD7F"
              },
              {
                "field": "Gender",
                "condition": "=",
                "value": "Male",
                "customization": "bar color",
                "customizationValue": "#40CFFF"
              }
            ],
            "labelRotation": 45
          },
          "schema": []
        },
        {
          "id": "c4ba30e1-134f-437e-9a4b-542e0e4c108f",
          "title": "Demography of all coworkers",
          "query": "Fantastic Store has many talented coworkers with a mix of gender, nationality, age and service year. Some just joined in 2023. Their \"entry_year\" property value is \"2023\" and \"service_year\" is \"0\".\n\nCoworker's age and service year have been binned into groups for desensitization and fitting for analytical purpose.\n\nWith the following demographic analysis, can you tell if the coworker population is balanced?\n\n\n",
          "width": 21,
          "height": 2,
          "x": 0,
          "y": 8,
          "type": "text",
          "selection": {},
          "settings": {},
          "schema": []
        },
        {
          "id": "ce0849e3-4ff9-404b-8d85-ce34a1346d57",
          "title": "By nationality - is_manager",
          "query": "match (n:Coworker)-[r]->(j:Job {is_manager:true})\nwhere date(j.end_date)=date('9999-12-31')\nreturn n.nationality as Nationality, count(n) as Counts\norder by Counts\n\n",
          "width": 5,
          "height": 3,
          "x": 5,
          "y": 15,
          "type": "bar",
          "selection": {
            "index": "Nationality",
            "value": "Counts",
            "key": "(none)"
          },
          "settings": {
            "refreshButtonEnabled": true,
            "layout": "horizontal",
            "fullscreenEnabled": true,
            "barValues": true,
            "labelRotation": 45,
            "hideSelections": true,
            "marginLeft": 100,
            "colors": "accent"
          },
          "schema": []
        },
        {
          "id": "ccaecf41-b3b2-4766-9b05-ec2d7c12bfaf",
          "title": "By age group - is_manager",
          "query": "match (n:Coworker)-[r]->(j:Job {is_manager:true})\nwhere date(j.end_date)=date('9999-12-31')\nreturn n.age_group as AgeGroup, count(n) as Counts\norder by AgeGroup desc\n\n",
          "width": 5,
          "height": 3,
          "x": 10,
          "y": 15,
          "type": "bar",
          "selection": {
            "index": "AgeGroup",
            "value": "Counts",
            "key": "(none)"
          },
          "settings": {
            "refreshButtonEnabled": true,
            "layout": "horizontal",
            "fullscreenEnabled": true,
            "barValues": true,
            "labelRotation": 45,
            "hideSelections": true,
            "marginLeft": 100,
            "colors": "accent"
          },
          "schema": []
        },
        {
          "id": "30a30f30-f000-4ee1-aa11-575648cf1b11",
          "title": "By service year group - is_manager",
          "query": "match (n:Coworker)-[r]->(j:Job {is_manager:true})\nwhere date(j.end_date)=date('9999-12-31')\nreturn n.service_year_group as ServiceYearGroup, count(n) as Counts\norder by ServiceYearGroup desc\n\n",
          "width": 6,
          "height": 3,
          "x": 15,
          "y": 15,
          "type": "bar",
          "selection": {
            "index": "ServiceYearGroup",
            "value": "Counts",
            "key": "(none)"
          },
          "settings": {
            "refreshButtonEnabled": true,
            "layout": "horizontal",
            "fullscreenEnabled": true,
            "barValues": true,
            "hideSelections": true,
            "marginLeft": 100,
            "colors": "accent",
            "labelRotation": 45
          },
          "schema": []
        },
        {
          "id": "69cce1d4-0e94-4153-ae16-5c94bf9e5b7c",
          "title": "Demography of coworkers who have people responsibility",
          "query": "Other than the coworkers in the Department \"Management Team\" who are the top management of the store, there are other coworkers who have people responsibility. They have jobs which have the property \"is_manager\" as \"Manager\", versus \"Non Manager\".\n\nWith the following demographic analysis, and compared to that of the whole coworker population, can you tell if the managers are a balanced group?\n\n\n",
          "width": 15,
          "height": 2,
          "x": 0,
          "y": 13,
          "type": "text",
          "selection": {},
          "settings": {},
          "schema": []
        },
        {
          "id": "4ce4fe78-db2f-40bc-837f-67ab6c1cf6a5",
          "title": "Departments",
          "query": "",
          "width": 5,
          "height": 5,
          "x": 0,
          "y": 3,
          "type": "table",
          "selection": {},
          "settings": {
            "compact": true,
            "wrapContent": true,
            "description": "Write a query to return the name of the departments and their coworker counts so we can see them as a list."
          }
        },
        {
          "id": "8f2839cd-3d62-4671-87ca-744b10161d64",
          "title": "Employee groups",
          "query": "MATCH (e:EmployeeGroup)-[]-(c:Coworker)\nRETURN distinct e.name as EmployeeGroup, count(c) as CoworkerCounts\nORDER BY EmployeeGroup\n",
          "width": 6,
          "height": 5,
          "x": 14,
          "y": 3,
          "type": "table",
          "selection": {},
          "settings": {
            "compact": true
          }
        },
        {
          "id": "294664e4-324b-4905-9adc-fb86b2cb45cd",
          "title": "Is_manager",
          "query": "match (n:Coworker)-[r]->(j:Job {is_manager:true})\nwhere date(j.end_date)=date('9999-12-31')\nreturn count(n) as Counts\n\n",
          "width": 6,
          "height": 2,
          "x": 15,
          "y": 13,
          "type": "value",
          "selection": {},
          "settings": {
            "refreshButtonEnabled": true,
            "layout": "horizontal",
            "fullscreenEnabled": true,
            "barValues": true,
            "hideSelections": true,
            "styleRules": [
              {
                "field": "Gender",
                "condition": "=",
                "value": "Female",
                "customization": "bar color",
                "customizationValue": "#FACD7F"
              },
              {
                "field": "Gender",
                "condition": "=",
                "value": "Male",
                "customization": "bar color",
                "customizationValue": "#40CFFF"
              }
            ],
            "labelRotation": 40
          },
          "schema": []
        },
        {
          "id": "b4f57502-c8f5-4f72-b561-948571638a27",
          "title": "Management team",
          "query": "MATCH (n:Department {name:'Management Team'})-[r1]-(c:Coworker)-[r2]-(j:Job)\nwhere date(j.end_date) = date('9999-12-31')\nRETURN distinct j.name as ManagementTeamJob, count(c) as CoworkerCounts\nORDER BY ManagementTeamJob\n",
          "width": 9,
          "height": 5,
          "x": 5,
          "y": 3,
          "type": "table",
          "selection": {},
          "settings": {
            "compact": true,
            "columnWidths": "[2,1]",
            "wrapContent": true
          }
        },
        {
          "id": "8670338a-2cf0-4a17-8569-c51a65eb4dfd",
          "title": "Job change within the department - details",
          "query": "// How many coworkers have had more than one job?\nMATCH p1 = (c:Coworker)-[:HAS_JOB]->(j1:Job)-[:PREVIOUS_JOB*]->(j2:Job)\nMATCH (c)-[:WORKS_IN]->(d:Department)\nWHERE length(p1) > 1 and not (d)-[:PREVIOUS_DEPARTMENT]->(:Department)\nRETURN c.employee_id AS EmployeeID, d.name as Department, j1.name as CurrentJob, j2.name as PreviousJob, toString(j1.start_date.year) as StartYear\nORDER BY StartYear, Department",
          "width": 21,
          "height": 3,
          "x": 0,
          "y": 20,
          "type": "table",
          "selection": {},
          "settings": {
            "fullscreenEnabled": true,
            "layout": "force-directed",
            "refreshButtonEnabled": true,
            "wrapContent": true,
            "compact": true
          },
          "schema": []
        },
        {
          "id": "d47e10d6-c70b-4f1b-8005-24b2c1d579a0",
          "title": "Job change between departments - details",
          "query": "MATCH p1 = (c:Coworker)-[:HAS_JOB]->(j1:Job)-[:PREVIOUS_JOB*]->(j2:Job)\nMATCH p2 = (c)-[:WORKS_IN]->(d1:Department)-[:PREVIOUS_DEPARTMENT*]->(d2:Department)\nWHERE length(p1) > 1 and length(p2) > 1\nRETURN c.employee_id AS EmployeeID, d1.name as CurrentDept, j1.name as CurrentJob, d2.name as PreviousDept, j2.name as PreviousJob, toString(j1.start_date.year) as StartYear\nORDER BY StartYear, PreviousDept",
          "width": 21,
          "height": 4,
          "x": 0,
          "y": 23,
          "type": "table",
          "selection": {},
          "settings": {
            "fullscreenEnabled": true,
            "layout": "force-directed",
            "refreshButtonEnabled": true,
            "wrapContent": true,
            "compact": true
          },
          "schema": []
        },
        {
          "id": "ea4cbef0-1f24-4773-ba7e-ccf257021ca1",
          "title": "By gender - job change",
          "query": "",
          "width": 4,
          "height": 3,
          "x": 0,
          "y": 27,
          "type": "bar",
          "selection": {
            "index": "Gender",
            "value": "NumberOfCoworker",
            "key": "(none)"
          },
          "settings": {
            "fullscreenEnabled": true,
            "layout": "horizontal",
            "refreshButtonEnabled": true,
            "wrapContent": true,
            "compact": true,
            "barValues": true,
            "styleRules": [
              {
                "field": "Gender",
                "condition": "=",
                "value": "Female",
                "customization": "bar color",
                "customizationValue": "#FACD7F"
              },
              {
                "field": "Gender",
                "condition": "=",
                "value": "Male",
                "customization": "bar color",
                "customizationValue": "#40CFFF"
              }
            ],
            "hideSelections": true,
            "description": "Write a query to return the number of coworkers who changed job, per gender so we can see the distribution in a bar chart."
          },
          "schema": []
        },
        {
          "id": "640de9a9-9c16-4b10-9f1c-4db4739e01da",
          "title": "By nationality - job change",
          "query": "",
          "width": 4,
          "height": 3,
          "x": 4,
          "y": 27,
          "type": "bar",
          "selection": {
            "index": "Nationality",
            "value": "NumberOfCoworker",
            "key": "(none)"
          },
          "settings": {
            "fullscreenEnabled": true,
            "layout": "horizontal",
            "refreshButtonEnabled": true,
            "wrapContent": true,
            "compact": true,
            "barValues": true,
            "styleRules": [
              {
                "field": "Gender",
                "condition": "=",
                "value": "Female",
                "customization": "bar color",
                "customizationValue": "#FACD7F"
              },
              {
                "field": "Gender",
                "condition": "=",
                "value": "Male",
                "customization": "bar color",
                "customizationValue": "#40CFFF"
              }
            ],
            "hideSelections": true,
            "colors": "paired",
            "marginLeft": 100,
            "description": "Write a query to return the number of coworkers who changed job, per nationality so we can see the distribution in a bar chart."
          },
          "schema": []
        },
        {
          "id": "4c8a3035-577f-4100-97c6-e43581f49d88",
          "title": "By age group - job change",
          "query": "MATCH p1 = (c:Coworker)-[:HAS_JOB]->(j1:Job)-[:PREVIOUS_JOB*]->(j2:Job)\nWHERE length(p1) > 1\nRETURN  distinct c.age_group AS AgeGroup, count(c.employee_id) as NumberOfCoworkers\nORDER BY NumberOfCoworkers",
          "width": 5,
          "height": 3,
          "x": 8,
          "y": 27,
          "type": "bar",
          "selection": {
            "index": "AgeGroup",
            "value": "NumberOfCoworkers",
            "key": "(none)"
          },
          "settings": {
            "fullscreenEnabled": true,
            "layout": "horizontal",
            "refreshButtonEnabled": true,
            "wrapContent": true,
            "compact": true,
            "barValues": true,
            "styleRules": [
              {
                "field": "Gender",
                "condition": "=",
                "value": "Female",
                "customization": "bar color",
                "customizationValue": "#FACD7F"
              },
              {
                "field": "Gender",
                "condition": "=",
                "value": "Male",
                "customization": "bar color",
                "customizationValue": "#40CFFF"
              }
            ],
            "hideSelections": true,
            "colors": "paired",
            "marginLeft": 100
          },
          "schema": []
        },
        {
          "id": "06fb0380-7872-4aa6-9a5c-a225a90ae426",
          "title": "By service year group - job change",
          "query": "",
          "width": 4,
          "height": 3,
          "x": 13,
          "y": 27,
          "type": "bar",
          "selection": {
            "index": "ServiceYear",
            "value": "NumberOfCoworker",
            "key": "(none)"
          },
          "settings": {
            "fullscreenEnabled": true,
            "layout": "horizontal",
            "refreshButtonEnabled": true,
            "wrapContent": true,
            "compact": true,
            "barValues": true,
            "styleRules": [
              {
                "field": "Gender",
                "condition": "=",
                "value": "Female",
                "customization": "bar color",
                "customizationValue": "#FACD7F"
              },
              {
                "field": "Gender",
                "condition": "=",
                "value": "Male",
                "customization": "bar color",
                "customizationValue": "#40CFFF"
              }
            ],
            "hideSelections": true,
            "colors": "paired",
            "marginLeft": 100,
            "description": "Write a query to return the number of coworkers who changed job, per service_year_group so we can see the distribution in a bar chart."
          },
          "schema": []
        },
        {
          "id": "f9cfa04f-2204-482b-a627-4846283eae84",
          "title": "Demography of coworkers who changed jobs in the recent years",
          "query": "One development trend is changing jobs. It can be job change within the department and between departments. We have 2 start years for new jobs: 2022 and 2023.\n\nLooking at the demography of the coworkers who changed jobs, can you observe if there is any bias?\n\n*(Since this is a fable. There are no job changes before 2022.)*",
          "width": 21,
          "height": 2,
          "x": 0,
          "y": 18,
          "type": "text",
          "selection": {},
          "settings": {},
          "schema": []
        },
        {
          "id": "e1569406-51c5-4822-b9b6-18e2b57cffb5",
          "title": "Demography of coworkers who have become managers in the short history",
          "query": "Another development trend is becoming a manager who has people responsibility. We have 2 start years for new jobs: 2022 and 2023.\n\nLooking at the demography of the coworkers who have become managers, can you observe if the opportunity is fair to everyone?",
          "width": 15,
          "height": 2,
          "x": 0,
          "y": 30,
          "type": "text",
          "selection": {},
          "settings": {},
          "schema": []
        },
        {
          "id": "6739d824-cfd9-455c-bb3e-2f59a86df2ea",
          "title": "Becoming a manager",
          "query": "MATCH p = (:Job{is_manager:false})<-[:PREVIOUS_JOB*]-(:Job{is_manager:true})-[:HAS_JOB]-(c:Coworker)\nreturn count(c)",
          "width": 6,
          "height": 2,
          "x": 15,
          "y": 30,
          "type": "value",
          "selection": {},
          "settings": {
            "fullscreenEnabled": true,
            "layout": "horizontal",
            "refreshButtonEnabled": true,
            "wrapContent": true,
            "compact": true,
            "barValues": true,
            "styleRules": [
              {
                "field": "Gender",
                "condition": "=",
                "value": "Female",
                "customization": "bar color",
                "customizationValue": "#FACD7F"
              },
              {
                "field": "Gender",
                "condition": "=",
                "value": "Male",
                "customization": "bar color",
                "customizationValue": "#40CFFF"
              }
            ],
            "hideSelections": true
          },
          "schema": []
        },
        {
          "id": "a852c9da-a46b-4df7-b432-0ce5964d7467",
          "title": "By gender - becoming a manager",
          "query": "",
          "width": 5,
          "height": 3,
          "x": 0,
          "y": 32,
          "type": "bar",
          "selection": {
            "index": "Gender",
            "value": "count(c)",
            "key": "(none)"
          },
          "settings": {
            "fullscreenEnabled": true,
            "layout": "horizontal",
            "refreshButtonEnabled": true,
            "wrapContent": true,
            "compact": true,
            "barValues": true,
            "styleRules": [
              {
                "field": "Gender",
                "condition": "=",
                "value": "Female",
                "customization": "bar color",
                "customizationValue": "#FACD7F"
              },
              {
                "field": "Gender",
                "condition": "=",
                "value": "Male",
                "customization": "bar color",
                "customizationValue": "#40CFFF"
              }
            ],
            "hideSelections": true,
            "description": "Write a query to return the number of coworkers who were promoted to a managerial job, per gender so we can see the distribution in a bar chart."
          },
          "schema": []
        },
        {
          "id": "3600ae4c-4665-491d-b67a-cddc730973ee",
          "title": "By nationality - becoming a manager",
          "query": "",
          "width": 5,
          "height": 3,
          "x": 5,
          "y": 32,
          "type": "bar",
          "selection": {
            "index": "Nationality",
            "value": "count(c)",
            "key": "(none)"
          },
          "settings": {
            "fullscreenEnabled": true,
            "layout": "horizontal",
            "refreshButtonEnabled": true,
            "wrapContent": true,
            "compact": true,
            "barValues": true,
            "styleRules": [
              {
                "field": "Gender",
                "condition": "=",
                "value": "Female",
                "customization": "bar color",
                "customizationValue": "#FACD7F"
              },
              {
                "field": "Gender",
                "condition": "=",
                "value": "Male",
                "customization": "bar color",
                "customizationValue": "#40CFFF"
              }
            ],
            "hideSelections": true,
            "colors": "category10",
            "marginLeft": 100,
            "description": "Write a query to return the number of coworkers who were promoted to a managerial job, per nationality so we can see the distribution in a bar chart."
          },
          "schema": []
        },
        {
          "id": "ea08500f-07dc-43ce-a8f4-c144b5b33a34",
          "title": "By age group - becoming a manager",
          "query": "",
          "width": 5,
          "height": 3,
          "x": 10,
          "y": 32,
          "type": "bar",
          "selection": {
            "index": "AgeGroup",
            "value": "count(c)",
            "key": "(none)"
          },
          "settings": {
            "fullscreenEnabled": true,
            "layout": "horizontal",
            "refreshButtonEnabled": true,
            "wrapContent": true,
            "compact": true,
            "barValues": true,
            "styleRules": [
              {
                "field": "Gender",
                "condition": "=",
                "value": "Female",
                "customization": "bar color",
                "customizationValue": "#FACD7F"
              },
              {
                "field": "Gender",
                "condition": "=",
                "value": "Male",
                "customization": "bar color",
                "customizationValue": "#40CFFF"
              }
            ],
            "hideSelections": true,
            "colors": "category10",
            "marginLeft": 100,
            "description": "Write a query to return the number of coworkers who were promoted to a managerial job, per age_group so we can see the distribution in a bar chart."
          },
          "schema": []
        },
        {
          "id": "71a0d99d-66e0-409f-8f6a-b7996fc50242",
          "title": "By service year group - becoming a manager",
          "query": "MATCH p = (:Job{is_manager:false})<-[:PREVIOUS_JOB*]-(:Job{is_manager:true})-[:HAS_JOB]-(c:Coworker)\nRETURN c.service_year_group, count(c.service_year_group) AS promoted_to_managers\nORDER BY promoted_to_managers;",
          "width": 6,
          "height": 3,
          "x": 15,
          "y": 32,
          "type": "bar",
          "selection": {
            "index": "c.service_year_group",
            "value": "promoted_to_managers",
            "key": "(none)"
          },
          "settings": {
            "fullscreenEnabled": true,
            "layout": "horizontal",
            "refreshButtonEnabled": true,
            "wrapContent": true,
            "compact": true,
            "barValues": true,
            "styleRules": [
              {
                "field": "Gender",
                "condition": "=",
                "value": "Female",
                "customization": "bar color",
                "customizationValue": "#FACD7F"
              },
              {
                "field": "Gender",
                "condition": "=",
                "value": "Male",
                "customization": "bar color",
                "customizationValue": "#40CFFF"
              }
            ],
            "hideSelections": true,
            "colors": "category10",
            "marginLeft": 100
          },
          "schema": []
        },
        {
          "id": "146a30a1-2372-445f-8b14-30cc6c290a51",
          "title": "Fantastic Store statistics",
          "query": "Let's have a look at how Fantastic Store is organized, the demography of the coworkers and see *if they are a balanced group*. \n",
          "width": 6,
          "height": 3,
          "x": 0,
          "y": 0,
          "type": "text",
          "selection": {},
          "settings": {},
          "schema": []
        },
        {
          "id": "da226530-3268-4cee-8dd6-07bc86ab9739",
          "title": "Top 3 jobs from which coworkers changed the most",
          "query": "",
          "width": 5,
          "height": 3,
          "x": 17,
          "y": 27,
          "type": "table",
          "selection": {},
          "settings": {
            "description": "Write a query to return the top 3 previous jobs from which coworkers changed the most."
          }
        }
      ]
    }
  ],
  "parameters": {},
  "extensions": {
    "active": true,
    "activeReducers": [],
    "advanced-charts": {
      "active": true
    },
    "styling": {
      "active": true
    },
    "actions": {
      "active": true
    },
    "forms": {
      "active": true
    }
  },
  "uuid": "99fbb3e1-cd1d-4884-87e2-9e2faabc1b8d"
}