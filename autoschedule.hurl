# /auto-schedule -----------------
POST {{BASE_URL}}/api/auto-schedule
Content-Type: application/json
Authorization: Bearer {{API_KEY}}
{
    "schedule": ["18:06z", "21:01Z"],
    "daysOfWeek": [0,1,2,3,4,5,6],
    "excludeDates": ["04/04/2024"],
    "title": "greatschedule"
}

HTTP 200
[Asserts]
header "Content-Type" == "application/json; charset=utf-8"
jsonpath "$.status" == "success"
jsonpath "$.message" exists
jsonpath "$.title" exists
jsonpath "$.schedule" exists
jsonpath "$.daysOfWeek" exists
jsonpath "$.excludeDates" exists

[Captures]
title: jsonpath "$['title']"
schedule: jsonpath "$['schedule']"
daysOfWeek: jsonpath "$['daysOfWeek']"
excludeDates: jsonpath "$['excludeDates']"

GET {{BASE_URL}}/api/auto-schedule
Content-Type: application/json
Authorization: Bearer {{API_KEY}}

HTTP 200
[Asserts]
header "Content-Type" == "application/json; charset=utf-8"
jsonpath "$.status" == "success"
jsonpath "$.schedules" exists
jsonpath "$.schedules.{{title}}.schedule" == {{schedule}}
jsonpath "$.schedules.{{title}}.daysOfWeek" == {{daysOfWeek}}
jsonpath "$.schedules.{{title}}.excludeDates" == {{excludeDates}}

DELETE {{BASE_URL}}/api/auto-schedule
Content-Type: application/json
Authorization: Bearer {{API_KEY}}
{
    "title": "{{title}}"
}

HTTP 200
[Asserts]
header "Content-Type" == "application/json; charset=utf-8"
jsonpath "$.status" == "success"
# -----------------------