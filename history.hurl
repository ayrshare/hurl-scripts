# /history ---------------
GET {{BASE_URL}}/history
Content-Type: application/json
Authorization: Bearer {{API_KEY}}

HTTP 200
[Asserts]
header "Content-Type" == "application/json; charset=utf-8"

jsonpath "$.history[0].created" exists
jsonpath "$.history[0].id" exists
jsonpath "$.history[0].post" exists
jsonpath "$.history[0].platforms" count >= 1
jsonpath "$.history[0].status" exists
jsonpath "$.history[0].type" exists
# -----------------------
