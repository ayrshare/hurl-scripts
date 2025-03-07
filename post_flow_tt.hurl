# /post POST -------------
POST {{BASE_URL}}/post
Content-Type: application/json
Authorization: Bearer {{API_KEY}}
{
    "randomPost": true,
    "platforms": [
        "tiktok"
    ],
    "randomMediaUrl": true,
    "isPortraitVideo": true
}

HTTP 200
[Asserts]
header "Content-Type" == "application/json; charset=utf-8"
jsonpath "$.status" == "success"
jsonpath "$.errors" count == 0

jsonpath "$.postIds[0].status" == "success"
jsonpath "$.postIds[0].id" exists
jsonpath "$.postIds[0].platform" == "tiktok"

jsonpath "$.id" exists
jsonpath "$.refId" exists
jsonpath "$.post" exists

[Captures]
id: jsonpath "$['id']"
# -----------------------

# /comments POST
POST {{BASE_URL}}/comments
Content-Type: application/json
Authorization: Bearer {{API_KEY}}
[Options]
delay: 180000
{
    "id": "{{id}}",
    "platforms": ["tiktok"],
    "randomComment": true
}
HTTP 200

[Asserts]
header "Content-Type" == "application/json; charset=utf-8"
jsonpath "$.status" == "success"
jsonpath "$.id" == "{{id}}"

jsonpath "$.tiktok" exists
jsonpath "$.tiktok.status" == "success"
# jsonpath "$.facebook.comment" == "hurl"

[Captures]
tt_comment_id: jsonpath "$.tiktok.commentId"
tt_comment: jsonpath "$.tiktok.comment"
tt_comment_top_id: jsonpath "$.commentId"
# -----------------------

# /comments GET
GET {{BASE_URL}}/comments?id={{id}}
Content-Type: application/json
Authorization: Bearer {{API_KEY}}
[Options]
delay: 10000
HTTP 200

[Asserts]
header "Content-Type" == "application/json; charset=utf-8"
jsonpath "$.status" == "success"
jsonpath "$.id" == "{{id}}"

jsonpath "$.tiktok" isCollection
jsonpath "$.tiktok[0].commentId" == "{{tt_comment_id}}"
jsonpath "$.tiktok[0].comment" == "{{tt_comment}}"
# -----------------------

# /comments/reply POST
POST {{BASE_URL}}/comments/reply
Content-Type: application/json
Authorization: Bearer {{API_KEY}}
{
    "commentId": "{{tt_comment_top_id}}",
    "platforms": [
        "tiktok"
    ],
    "randomComment": true
}
HTTP 200

[Asserts]
header "Content-Type" == "application/json; charset=utf-8"
jsonpath "$.status" == "success"
jsonpath "$.id" == "{{id}}"
jsonpath "$.commentId" exists
jsonpath "$.tiktok" exists
jsonpath "$.tiktok.status" == "success"
jsonpath "$.tiktok.commentId" exists
jsonpath "$.tiktok.sourceCommentId" exists
jsonpath "$.tiktok.comment" exists
jsonpath "$.tiktok.platform" == "tiktok"
# -----------------------

# /comments DELETE
DELETE {{BASE_URL}}/comments/{{id}}
Content-Type: application/json
Authorization: Bearer {{API_KEY}}

HTTP 200
[Asserts]
header "Content-Type" == "application/json; charset=utf-8"
jsonpath "$.status" == "success"
jsonpath "$.tiktok" exists
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

jsonpath "$.tiktok" exists
jsonpath "$.tiktok.postUrl" exists
jsonpath "$.tiktok.analytics.commentsCount" exists
jsonpath "$.tiktok.analytics.created" exists
jsonpath "$.tiktok.analytics.embedUrl" exists
jsonpath "$.tiktok.analytics.itemId" exists
jsonpath "$.tiktok.analytics.likeCount" exists
jsonpath "$.tiktok.analytics.mediaType" exists
jsonpath "$.tiktok.analytics.postUrl" exists
jsonpath "$.tiktok.analytics.shareCount" exists
jsonpath "$.tiktok.analytics.tags" exists
jsonpath "$.tiktok.analytics.thumbnailHeight" exists
jsonpath "$.tiktok.analytics.thumbnailUrl" exists
jsonpath "$.tiktok.analytics.thumbnailWidth" exists
jsonpath "$.tiktok.analytics.url" exists
jsonpath "$.tiktok.analytics.videoViews" exists
jsonpath "$.tiktok.lastUpdated" exists
jsonpath "$.tiktok.nextUpdate" exists
# -----------------------

# /post DELETE ---------
DELETE {{BASE_URL}}/post
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
jsonpath "$.code" == 200
# -----------------------
