# /profiles/profile POST -------------
POST {{BASE_URL}}/api/profiles/profile
Content-Type: application/json
Authorization: Bearer {{API_KEY}}
{
    "title": "{{NOW}}"
}

HTTP 200
[Captures]
profileKey: jsonpath "$.profileKey"
refId: jsonpath "$.refId"
[Asserts]
header "Content-Type" == "application/json; charset=utf-8"
jsonpath "$.status" == "success"
jsonpath "$.title" exists
jsonpath "$.refId" exists
jsonpath "$.profileKey" exists
# ---------------------------------

# /profiles/profile GET -------------
GET {{BASE_URL}}/api/profiles?profileKeys[0]={{profileKey}}
Content-Type: application/json
Authorization: Bearer {{API_KEY}}

HTTP 200
[Asserts]
header "Content-Type" == "application/json; charset=utf-8"
jsonpath "$.profiles" isCollection
jsonpath "$.profiles[0].title" exists
jsonpath "$.profiles[0].created" exists
jsonpath "$.profiles[0].createdUTC" exists
jsonpath "$.profiles[0].refId" == "{{refId}}"
# ---------------------------------

# /profiles/profile PUT -------------
PUT {{BASE_URL}}/api/profiles/profile
Content-Type: application/json
Authorization: Bearer {{API_KEY}}
{
    "profileKey": "{{profileKey}}",
    "disableSocial": ["facebook", "instagram"],
    "title": "{{NOW}} updated",
    "hideTitle": true,
    "displayTitle": "{{NOW}} updated"
}

HTTP 200
[Asserts]
header "Content-Type" == "application/json; charset=utf-8"
jsonpath "$.status" == "success"
jsonpath "$.refId" == "{{refId}}"
# ---------------------------------

# /profiles/profile DELETE -------------
DELETE {{BASE_URL}}/api/profiles/profile
Content-Type: application/json
Authorization: Bearer {{API_KEY}}
{
    "profileKey": "{{profileKey}}"
}

HTTP 200
[Asserts]
header "Content-Type" == "application/json; charset=utf-8"
jsonpath "$.status" == "success"
jsonpath "$.refId" == "{{refId}}"
# ---------------------------------