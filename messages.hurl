# POST /messages recipientId
POST {{BASE_URL}}/api/messages/twitter
Content-Type: application/json
Authorization: Bearer {{API_KEY}}
{
    "message": "test",
    "recipientId": "1660570896971583488"
}

HTTP 200
[Asserts]
header "Content-Type" == "application/json; charset=utf-8"

jsonpath "$.status" == "success"
jsonpath "$.dm_conversation_id" exists
jsonpath "$.dm_event_id" exists
# -----------------------

# /messages/twitter ---------------
GET {{BASE_URL}}/api/messages/twitter
Content-Type: application/json
Authorization: Bearer {{API_KEY}}
[Options]
delay: 30000

HTTP 200
[Asserts]
header "Content-Type" == "application/json; charset=utf-8"

jsonpath "$.status" == "success"
jsonpath "$.messages" exists
jsonpath "$.messages[0].event_type" == "MessageCreate"
jsonpath "$.messages[0].text" exists
jsonpath "$.messages[0].dm_conversation_id" exists
jsonpath "$.messages[0].id" exists
jsonpath "$.messages[0].sender_id" exists
jsonpath "$.users" exists
jsonpath "$.users[0].id" exists
jsonpath "$.users[0].name" exists
jsonpath "$.users[0].username" exists
jsonpath "$.lastUpdated" exists
jsonpath "$.nextUpdate" exists

[Captures]
id: jsonpath "$.users[0].id"
# -----------------------

# POST /messages conversationId
POST {{BASE_URL}}/api/messages/twitter
Content-Type: application/json
Authorization: Bearer {{API_KEY}}
{
    "message": "test",
    "conversationId": "{{id}}-{{id}}"
}

HTTP 200
[Asserts]
header "Content-Type" == "application/json; charset=utf-8"

jsonpath "$.status" == "success"
jsonpath "$.dm_conversation_id" exists
jsonpath "$.dm_event_id" exists
# -----------------------

# GET /messages/twitter?conversationsOnly=true ---------------
GET {{BASE_URL}}/api/messages/twitter?conversationsOnly=true
Content-Type: application/json
Authorization: Bearer {{API_KEY}}

HTTP 200
[Asserts]
header "Content-Type" == "application/json; charset=utf-8"

jsonpath "$.status" == "success"
jsonpath "$.conversationIds" exists
jsonpath "$.users" exists
jsonpath "$.users[0].id" exists
jsonpath "$.users[0].name" exists
jsonpath "$.users[0].username" exists
jsonpath "$.lastUpdated" exists
jsonpath "$.nextUpdate" exists
# -----------------------

# GET /messages/twitter?conversationId ---------------
GET {{BASE_URL}}/api/messages/twitter?conversationId={{id}}-1660570896971583488
Content-Type: application/json
Authorization: Bearer {{API_KEY}}

HTTP 200
[Asserts]
header "Content-Type" == "application/json; charset=utf-8"

jsonpath "$.status" == "success"
jsonpath "$.messages" exists
jsonpath "$.messages[0].event_type" == "MessageCreate"
jsonpath "$.messages[0].text" exists
jsonpath "$.messages[0].id" exists
jsonpath "$.messages[0].sender_id" exists
jsonpath "$.users" exists
jsonpath "$.users[0].id" exists
jsonpath "$.users[0].name" exists
jsonpath "$.users[0].username" exists
jsonpath "$.lastUpdated" exists
jsonpath "$.nextUpdate" exists
# -----------------------
