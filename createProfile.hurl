# /createProfile POST -------------
POST {{BASE_URL}}/api/profiles/profile
Content-Type: application/json
Authorization: Bearer {{API_KEY}}
{
    "title": "{{NOW}}"
}

HTTP 200
[Asserts]
header "Content-Type" == "application/json; charset=utf-8"
jsonpath "$.status" == "success"
jsonpath "$.title" exists
jsonpath "$.refId" exists
jsonpath "$.profileKey" exists
# ---------------------------------