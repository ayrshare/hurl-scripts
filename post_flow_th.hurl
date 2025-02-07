# /post POST -------------
POST {{BASE_URL}}/post
Content-Type: application/json
Authorization: Bearer {{API_KEY}}
{
    "randomPost": true,
    "platforms": [
        "threads"
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
jsonpath "$.postIds[0].platform" == "threads"

jsonpath "$.id" exists
jsonpath "$.refId" exists
jsonpath "$.post" exists

[Captures]
id: jsonpath "$['id']"
th_id: jsonpath "$.postIds[0].id"
# -----------------------

# /comments POST
POST {{BASE_URL}}/comments
Content-Type: application/json
Authorization: Bearer {{API_KEY}}
[Options]
delay: 5000
{
    "id": "{{id}}",
    "platforms": ["threads"],
    "randomComment": true
}
HTTP 200

[Asserts]
header "Content-Type" == "application/json; charset=utf-8"
jsonpath "$.status" == "success"
jsonpath "$.id" == "{{id}}"

jsonpath "$.threads" exists
jsonpath "$.threads.status" == "success"
# jsonpath "$.threads.comment" == "hurl"

[Captures]
th_comment_id: jsonpath "$.threads.commentId"
th_comment: jsonpath "$.threads.comment"
th_comment_top_id: jsonpath "$.commentId"

# -----------------------

# /comments GET
GET {{BASE_URL}}/comments?id={{id}}
Content-Type: application/json
Authorization: Bearer {{API_KEY}}
[Options]
delay: 30000
HTTP 200

[Asserts]
header "Content-Type" == "application/json; charset=utf-8"
jsonpath "$.status" == "success"
jsonpath "$.id" == "{{id}}"

jsonpath "$.threads" isCollection
jsonpath "$.threads[0].commentId" == "{{th_comment_id}}"
jsonpath "$.threads[0].comment" == "{{th_comment}}"
# -----------------------

# /comments/reply POST
POST {{BASE_URL}}/comments/reply
Content-Type: application/json
Authorization: Bearer {{API_KEY}}
{
    "commentId": "{{th_comment_top_id}}",
    "platforms": [
        "threads"
    ],
    "randomComment": true
}
HTTP 200

[Asserts]
header "Content-Type" == "application/json; charset=utf-8"
jsonpath "$.status" == "success"
jsonpath "$.id" == "{{id}}"
jsonpath "$.commentId" exists
jsonpath "$.threads" exists
jsonpath "$.threads.status" == "success"
jsonpath "$.threads.commentId" exists
jsonpath "$.threads.sourceCommentId" exists
jsonpath "$.threads.comment" exists
jsonpath "$.threads.platform" == "threads"
# -----------------------

# /analytics/post -------
POST {{BASE_URL}}/analytics/post
Content-Type: application/json
Authorization: Bearer {{API_KEY}}
{
    "id": "{{id}}"
}

HTTP 200
[Asserts]
header "Content-Type" == "application/json; charset=utf-8"
jsonpath "$.status" == "success"
jsonpath "$.id" == "{{id}}"

jsonpath "$.threads" exists
jsonpath "$.threads.id" == "{{th_id}}"
jsonpath "$.threads.analytics.views" exists
jsonpath "$.threads.analytics.likes" exists
jsonpath "$.threads.analytics.replies" exists
jsonpath "$.threads.analytics.reposts" exists
jsonpath "$.threads.analytics.quotes" exists
# -----------------------

