# /post POST -------------
POST {{BASE_URL}}/api/post
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
POST {{BASE_URL}}/api/comments
Content-Type: application/json
Authorization: Bearer {{API_KEY}}
[Options]
delay: 30000
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
tt_comment_top_id: jsonpath "$.id"
# -----------------------

# /comments GET
GET {{BASE_URL}}/api/comments?id={{id}}
Content-Type: application/json
Authorization: Bearer {{API_KEY}}
[Options]
delay: 30000
HTTP 200

[Asserts]
header "Content-Type" == "application/json; charset=utf-8"
jsonpath "$.status" == "success"
jsonpath "$.id" == "{{id}}"

jsonpath "$.tiktok" isCollection
jsonpath "$.tiktok[0].commentId" == "{{tt_comment_id}}"
jsonpath "$.tiktok[0].comment" == "{{tt_comment}}"
# -----------------------

# /comments DELETE
DELETE {{BASE_URL}}/api/comments/{{tt_comment_top_id}}
Content-Type: application/json
Authorization: Bearer {{API_KEY}}

HTTP 200
[Asserts]
header "Content-Type" == "application/json; charset=utf-8"
jsonpath "$.status" == "success"
jsonpath "$.tiktok" exists
# -----------------------

# /analytics/post -------
POST {{BASE_URL}}/api/analytics/post
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
jsonpath "$.tiktok.analytics.caption" exists
jsonpath "$.tiktok.analytics.comments" exists
jsonpath "$.tiktok.analytics.created" exists
jsonpath "$.tiktok.analytics.embedUrl" exists
jsonpath "$.tiktok.analytics.itemId" exists
jsonpath "$.tiktok.analytics.likes" exists
jsonpath "$.tiktok.analytics.mediaType" exists
jsonpath "$.tiktok.analytics.postUrl" exists
jsonpath "$.tiktok.analytics.shareUrl" exists
jsonpath "$.tiktok.analytics.shares" exists
jsonpath "$.tiktok.analytics.tags" exists
jsonpath "$.tiktok.analytics.thumbnailHeight" exists
jsonpath "$.tiktok.analytics.thumbnailUrl" exists
jsonpath "$.tiktok.analytics.thumbnailWidth" exists
jsonpath "$.tiktok.analytics.url" exists
jsonpath "$.tiktok.analytics.videoDuration" exists
jsonpath "$.tiktok.analytics.videoViews" exists
jsonpath "$.tiktok.lastUpdated" exists
jsonpath "$.tiktok.nextUpdate" exists
# -----------------------

# /post DELETE ---------
DELETE {{BASE_URL}}/api/post
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
