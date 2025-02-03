# /post POST compliant image -------------
POST {{BASE_URL}}/api/post 
Content-Type: application/json
Authorization: Bearer {{API_KEY}}
[Options]
delay: 10000
{
    "randomPost": true,
    "platforms": ["linkedin"],
    "mediaUrl": ["https://img.ayrshare.com/012/j2.jpg"]
}

HTTP 200
[Asserts]
header "Content-Type" == "application/json; charset=utf-8"
jsonpath "$.status" == "success"
jsonpath "$.errors" count == 0

jsonpath "$.postIds[0].status" == "success"
jsonpath "$.postIds[0].id" exists
jsonpath "$.postIds[0].postUrl" exists
jsonpath "$.postIds[0].platform" == "linkedin"

jsonpath "$.id" exists
jsonpath "$.refId" exists
jsonpath "$.post" exists

[Captures]
id: jsonpath "$['id']"
li_id: jsonpath "$.postIds[0].id"
# -----------------------

# /post POST non-compliant too large image -------------
POST {{BASE_URL}}/api/post 
Content-Type: application/json
Authorization: Bearer {{API_KEY}}
[Options]
delay: 10000
{
    "randomPost": true,
    "platforms": ["linkedin"],
    "mediaUrl": ["https://img.ayrshare.com/012/j1.jpg"]
}

HTTP 400
[Asserts]
header "Content-Type" == "application/json; charset=utf-8"
jsonpath "$.status" == "error"
jsonpath "$.errors" count == 1 
jsonpath "$.errors[0].action" == "post"
jsonpath "$.errors[0].status" == "error"
jsonpath "$.errors[0].code" == 254
jsonpath "$.errors[0].message" exists
jsonpath "$.errors[0].verifyCheck" == true
jsonpath "$.errors[0].platform" == "linkedin"

jsonpath "$.postIds" count == 0
jsonpath "$.id" exists
jsonpath "$.refId" exists
jsonpath "$.post" exists
jsonpath "$.validate" == true
# -----------------------

# CLEANUP ----------------------------
DELETE {{BASE_URL}}/api/post
Content-Type: application/json
Authorization: Bearer {{API_KEY}}
[Options]
delay: 10000
{
    "id": "{{id}}"
}
# ------------------------------------