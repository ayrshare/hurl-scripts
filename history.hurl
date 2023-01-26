# /history ---------------
GET {{BASE_URL}}/api/history
Content-Type: application/json
Authorization: Bearer {{API_KEY}}

HTTP 200
[Asserts]
header "Content-Type" == "application/json; charset=utf-8"

jsonpath "$[0].created" exists
jsonpath "$[0].id" exists
jsonpath "$[0].post" exists
jsonpath "$[0].platforms" count >= 1
jsonpath "$[0].status" exists
jsonpath "$[0].type" exists
# -----------------------