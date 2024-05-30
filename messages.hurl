# TWITTER ----------------------

# POST /messages recipientId
POST {{BASE_URL}}/api/messages/twitter
Content-Type: application/json
Authorization: Bearer {{API_KEY}}
{
    "message": "test",
    "recipientId": "{{X_RECIPIENT_ID}}"
}

HTTP 200
[Asserts]
header "Content-Type" == "application/json; charset=utf-8"

jsonpath "$.status" == "success"
jsonpath "$.messageId" exists
# -----------------------

# /messages/twitter ---------------
GET {{BASE_URL}}/api/messages/twitter
Content-Type: application/json
Authorization: Bearer {{API_KEY}}
[Options]
delay: 3000

HTTP 200
[Asserts]
header "Content-Type" == "application/json; charset=utf-8"

jsonpath "$.status" == "success"
jsonpath "$.messages" exists
jsonpath "$.messages[0].action" == "sent"
jsonpath "$.messages[0].message" exists
jsonpath "$.messages[0].id" exists
jsonpath "$.messages[0].senderDetails" exists
jsonpath "$.messagesCount" > 0
jsonpath "$.lastUpdated" exists
jsonpath "$.nextUpdate" exists

# GET /messages/twitter?conversationsOnly=true ---------------
GET {{BASE_URL}}/api/messages/twitter?conversationsOnly=true
Content-Type: application/json
Authorization: Bearer {{API_KEY}}

HTTP 200
[Asserts]
header "Content-Type" == "application/json; charset=utf-8"

jsonpath "$.status" == "success"
jsonpath "$.conversationIds" exists
jsonpath "$.conversationIds[0]" exists
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
jsonpath "$.messages[0].message" exists
jsonpath "$.messages[0].id" exists
jsonpath "$.messages[0].conversationId" exists
jsonpath "$.messagesCount" > 0
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
    "recipientId": "{{FB_RECIPIENT_ID}}"
}

HTTP 200
[Asserts]
header "Content-Type" == "application/json; charset=utf-8"

jsonpath "$.status" == "success"
jsonpath "$.recipientId" exists
jsonpath "$.messageId" exists
jsonpath "$.message" exists
# -----------------------

# /messages/facebook ---------------
GET {{BASE_URL}}/api/messages/facebook
Content-Type: application/json
Authorization: Bearer {{API_KEY}}
[Options]
delay: 3000

HTTP 200
[Asserts]
header "Content-Type" == "application/json; charset=utf-8"

jsonpath "$.status" == "success"
jsonpath "$.messages" exists
jsonpath "$.messages[0].id" exists
jsonpath "$.messages[0].created" exists
jsonpath "$.messages[0].action" == "sent"
jsonpath "$.messages[0].message" exists
jsonpath "$.messages[0].conversationId" exists
jsonpath "$.messages[0].recipientId" exists
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
jsonpath "$.conversationIds" exists
jsonpath "$.conversationIds[0]" exists
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
jsonpath "$.messages[0].created" exists
jsonpath "$.messages[0].action" == "sent"
jsonpath "$.messages[0].message" exists
jsonpath "$.messages[0].conversationId" exists
jsonpath "$.messages[0].recipientId" exists
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
    "recipientId": "{{IG_RECIPIENT_ID}}"
}

HTTP 200
[Asserts]
header "Content-Type" == "application/json; charset=utf-8"

jsonpath "$.status" == "success"
jsonpath "$.recipientId" exists
jsonpath "$.messageId" exists
jsonpath "$.message" exists
# -----------------------

# /messages/instagram ---------------
GET {{BASE_URL}}/api/messages/instagram
Content-Type: application/json
Authorization: Bearer {{API_KEY}}
[Options]
delay: 3000

HTTP 200
[Asserts]
header "Content-Type" == "application/json; charset=utf-8"

jsonpath "$.status" == "success"
jsonpath "$.messages" exists
jsonpath "$.messages[0].action" == "sent"
jsonpath "$.messages[0].message" exists
jsonpath "$.messages[0].senderId" exists
jsonpath "$.messages[0].id" exists
jsonpath "$.messages[0].conversationId" exists
jsonpath "$.messages[0].created" exists
jsonpath "$.messagesCount" > 0
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
jsonpath "$.conversationIds" exists
jsonpath "$.conversationIds[0]" exists
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
jsonpath "$.messages[0].created" exists
jsonpath "$.messages[0].action" == "sent"
jsonpath "$.messages[0].message" exists
jsonpath "$.messages[0].conversationId" exists
jsonpath "$.messages[0].recipientId" exists
jsonpath "$.lastUpdated" exists
jsonpath "$.nextUpdate" exists
# -----------------------