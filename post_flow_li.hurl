# /post POST -------------
POST {{BASE_URL}}/api/post
Content-Type: application/json
Authorization: Bearer {{API_KEY}}
{
    "randomPost": true,
    "platforms": [
        "linkedin"
    ],
    "randomMediaUrl": true
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

# /comments POST
POST {{BASE_URL}}/api/comments
Content-Type: application/json
Authorization: Bearer {{API_KEY}}
[Options]
delay: 15000
{
    "id": "{{id}}",
    "platforms": ["linkedin"],
    "randomComment": true
}
HTTP 200

[Asserts]
header "Content-Type" == "application/json; charset=utf-8"
jsonpath "$.status" == "success"
jsonpath "$.id" == "{{id}}"

jsonpath "$.linkedin" exists
jsonpath "$.linkedin.status" == "success"
# jsonpath "$.facebook.comment" == "hurl"

[Captures]
li_comment_id: jsonpath "$.linkedin.commentId"
li_comment: jsonpath "$.linkedin.comment"
li_comment_top_id: jsonpath "$.commentId"
# -----------------------

# /comments GET
GET {{BASE_URL}}/api/comments?id={{id}}
Content-Type: application/json
Authorization: Bearer {{API_KEY}}
[Options]
delay: 15000
HTTP 200

[Asserts]
header "Content-Type" == "application/json; charset=utf-8"
jsonpath "$.status" == "success"
jsonpath "$.id" == "{{id}}"

jsonpath "$.linkedin" isCollection
jsonpath "$.linkedin[0].commentId" == "{{li_comment_id}}"
jsonpath "$.linkedin[0].comment" == "{{li_comment}}"
# -----------------------

# /comments/reply POST
POST {{BASE_URL}}/api/comments/reply
Content-Type: application/json
Authorization: Bearer {{API_KEY}}
{
    "commentId": "{{li_comment_top_id}}",
    "platforms": [
        "linkedin"
    ],
    "randomComment": true
}
HTTP 200

[Asserts]
header "Content-Type" == "application/json; charset=utf-8"
jsonpath "$.status" == "success"
jsonpath "$.id" == "{{id}}"
jsonpath "$.commentId" exists
jsonpath "$.linkedin" exists
jsonpath "$.linkedin.status" == "success"
jsonpath "$.linkedin.commentId" exists
jsonpath "$.linkedin.sourceCommentId" exists
jsonpath "$.linkedin.comment" exists
jsonpath "$.linkedin.platform" == "linkedin"
# -----------------------

# /comments DELETE
DELETE {{BASE_URL}}/api/comments/{{id}}
Content-Type: application/json
Authorization: Bearer {{API_KEY}}

HTTP 200
[Asserts]
header "Content-Type" == "application/json; charset=utf-8"
jsonpath "$.status" == "success"
jsonpath "$.linkedin" exists
# -----------------------

# /analytics/post -------
#POST {{BASE_URL}}/api/analytics/post
#Content-Type: application/json
#Authorization: Bearer {{API_KEY}}
#{
#    "id": "{{id}}"
#}

#HTTP 200
#[Asserts]
#header "Content-Type" == "application/json; charset=utf-8"
#jsonpath "$.status" == "success"
#jsonpath "$.id" == "{{id}}"

#jsonpath "$.linkedin" exists
#jsonpath "$.linkedin.id" == "{{li_id}}"
#jsonpath "$.linkedin.postUrl" exists
#jsonpath "$.linkedin.analytics.shareCount" exists
#jsonpath "$.linkedin.analytics.likeCount" exists
#jsonpath "$.linkedin.analytics.engagement" exists
#jsonpath "$.linkedin.analytics.clickCount" exists
#jsonpath "$.linkedin.analytics.impressionCount" exists
#jsonpath "$.linkedin.analytics.commentCount" exists
# -----------------------

# /post DELETE ---------
DELETE {{BASE_URL}}/api/post
Content-Type: application/json
Authorization: Bearer {{API_KEY}}
[Options]
delay: 15000
{
    "id": "{{id}}"
}

HTTP 200
[Asserts]
header "Content-Type" == "application/json; charset=utf-8"
jsonpath "$.status" == "success"
jsonpath "$.id" == "{{id}}"
jsonpath "$.code" == 200
# -----------------------