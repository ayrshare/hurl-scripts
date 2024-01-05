# TWITTER ----------------------

# POST /messages recipientId
POST {{BASE_URL}}/api/messages/twitter
Content-Type: application/json
Authorization: Bearer {{API_KEY}}
{
    "message": "test",
    "recipientId": "1612532188616200192"
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
jsonpath "$.messages[0].eventType" == "MessageCreate"
jsonpath "$.messages[0].text" exists
jsonpath "$.messages[0].dmConversationId" exists
jsonpath "$.messages[0].id" exists
jsonpath "$.messages[0].sender" exists
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

[Captures]
conversationId: jsonpath "$.conversationIds[0]"
# -----------------------

# GET /messages/twitter?conversationId ---------------
GET {{BASE_URL}}/api/messages/twitter?conversationId={{conversationId}}
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




# FACEBOOK ----------------------

# POST /messages recipientId
POST {{BASE_URL}}/api/messages/facebook
Content-Type: application/json
Authorization: Bearer {{API_KEY}}
{
    "message": "test",
    "recipientId": "7332781063424021"
}

HTTP 200
[Asserts]
header "Content-Type" == "application/json; charset=utf-8"

jsonpath "$.status" == "success"
jsonpath "$.recipient_id" exists
jsonpath "$.message_id" exists
# -----------------------

# /messages/facebook ---------------
GET {{BASE_URL}}/api/messages/facebook
Content-Type: application/json
Authorization: Bearer {{API_KEY}}
[Options]
delay: 30000

HTTP 200
[Asserts]
header "Content-Type" == "application/json; charset=utf-8"

jsonpath "$.status" == "success"
jsonpath "$.messages" exists
jsonpath "$.messages[0].id" exists
jsonpath "$.messages[0].created_time" exists
jsonpath "$.messages[0].from" exists
jsonpath "$.messages[0].to" exists
jsonpath "$.messages[0].message" exists
jsonpath "$.messages[0].conversationId" exists
jsonpath "$.lastUpdated" exists
jsonpath "$.nextUpdate" exists

[Captures]
id: jsonpath "$.messages[0].conversationId"
# -----------------------

# GET /messages/facebook?conversationsOnly=true ---------------
GET {{BASE_URL}}/api/messages/facebook?conversationsOnly=true
Content-Type: application/json
Authorization: Bearer {{API_KEY}}

HTTP 200
[Asserts]
header "Content-Type" == "application/json; charset=utf-8"

jsonpath "$.status" == "success"
jsonpath "$.conversations" exists
jsonpath "$.conversations[0].id" exists
jsonpath "$.conversations[0].link" exists
jsonpath "$.conversations[0].updated_time" exists
jsonpath "$.lastUpdated" exists
jsonpath "$.nextUpdate" exists
# -----------------------

# GET /messages/facebook?conversationId ---------------
GET {{BASE_URL}}/api/messages/facebook?conversationId={{id}}
Content-Type: application/json
Authorization: Bearer {{API_KEY}}

HTTP 200
[Asserts]
header "Content-Type" == "application/json; charset=utf-8"

jsonpath "$.status" == "success"
jsonpath "$.messages" exists
jsonpath "$.messages[0].id" exists
jsonpath "$.messages[0].created_time" exists
jsonpath "$.messages[0].from" exists
jsonpath "$.messages[0].to" exists
jsonpath "$.messages[0].message" exists
jsonpath "$.lastUpdated" exists
jsonpath "$.nextUpdate" exists
# -----------------------




# INSTAGRAM --------------------------

# POST /messages recipientId
POST {{BASE_URL}}/api/messages/instagram
Content-Type: application/json
Authorization: Bearer {{API_KEY}}
{
    "message": "test",
    "recipientId": "7358388697547405"
}

HTTP 200
[Asserts]
header "Content-Type" == "application/json; charset=utf-8"

jsonpath "$.status" == "success"
jsonpath "$.recipient_id" exists
jsonpath "$.message_id" exists
# -----------------------

# /messages/instagram ---------------
GET {{BASE_URL}}/api/messages/instagram
Content-Type: application/json
Authorization: Bearer {{API_KEY}}
[Options]
delay: 30000

HTTP 200
[Asserts]
header "Content-Type" == "application/json; charset=utf-8"

jsonpath "$.status" == "success"
jsonpath "$.messages" exists
jsonpath "$.messages[0].id" exists
jsonpath "$.messages[0].created_time" exists
jsonpath "$.messages[0].from" exists
jsonpath "$.messages[0].to" exists
jsonpath "$.messages[0].message" exists
jsonpath "$.messages[0].conversationId" exists
jsonpath "$.lastUpdated" exists
jsonpath "$.nextUpdate" exists

[Captures]
id: jsonpath "$.messages[0].conversationId"
# -----------------------

# GET /messages/instagram?conversationsOnly=true ---------------
GET {{BASE_URL}}/api/messages/instagram?conversationsOnly=true
Content-Type: application/json
Authorization: Bearer {{API_KEY}}

HTTP 200
[Asserts]
header "Content-Type" == "application/json; charset=utf-8"

jsonpath "$.status" == "success"
jsonpath "$.conversations" exists
jsonpath "$.conversations[0].id" exists
jsonpath "$.conversations[0].updated_time" exists
jsonpath "$.lastUpdated" exists
jsonpath "$.nextUpdate" exists
# -----------------------

# GET /messages/instagram?conversationId ---------------
GET {{BASE_URL}}/api/messages/instagram?conversationId={{id}}
Content-Type: application/json
Authorization: Bearer {{API_KEY}}

HTTP 200
[Asserts]
header "Content-Type" == "application/json; charset=utf-8"

jsonpath "$.status" == "success"
jsonpath "$.messages" exists
jsonpath "$.messages[0].id" exists
jsonpath "$.messages[0].created_time" exists
jsonpath "$.messages[0].from" exists
jsonpath "$.messages[0].to" exists
jsonpath "$.messages[0].message" exists
jsonpath "$.lastUpdated" exists
jsonpath "$.nextUpdate" exists
# -----------------------