# /history all posts Instagram -
GET {{BASE_URL}}/api/history/instagram?limit=10
Content-Type: application/json
Authorization: Bearer {{API_KEY}}

HTTP 200
[Asserts]
header "Content-Type" == "application/json; charset=utf-8"
jsonpath "$.status" == "success"
jsonpath "$.posts" count == 10

jsonpath "$.posts[0].caption" exists
jsonpath "$.posts[0].commentsCount" >= 0
jsonpath "$.posts[0].created" exists
jsonpath "$.posts[0].id" exists
jsonpath "$.posts[0].likeCount" >= 0
jsonpath "$.posts[0].mediaProductType" exists
jsonpath "$.posts[0].mediaType" exists
jsonpath "$.posts[0].mediaUrl" exists
jsonpath "$.posts[0].post" exists
jsonpath "$.posts[0].postUrl" exists
jsonpath "$.posts[0].timestamp" exists
jsonpath "$.posts[0].username" exists

jsonpath "$.lastUpdated" exists
jsonpath "$.nextUpdate" exists
# -----------------------

# /history all posts Facebook -
GET {{BASE_URL}}/api/history/facebook?limit=25
Content-Type: application/json
Authorization: Bearer {{API_KEY}}

HTTP 200
[Asserts]
header "Content-Type" == "application/json; charset=utf-8"
jsonpath "$.status" == "success"
jsonpath "$.posts" count == 25

# jsonpath "$.posts[0].clicksUnique" exists
jsonpath "$.posts[0].commentsCount" >= 0
jsonpath "$.posts[0].created" exists
# jsonpath "$.posts[0].engagedUsers" >= 0
jsonpath "$.posts[0].from.name" exists
jsonpath "$.posts[0].from.id" exists
jsonpath "$.posts[0].id" exists
# jsonpath "$.posts[0].impressionsUnique" >= 0
jsonpath "$.posts[0].isPopular" exists
jsonpath "$.posts[0].likeCount" >= 0
jsonpath "$.posts[0].message" exists
# jsonpath "$.posts[0].negativeFeedback" exists
# jsonpath "$.posts[0].negativeFeedbackUnique" exists
jsonpath "$.posts[0].post" exists
jsonpath "$.posts[0].postUrl" exists
# jsonpath "$.posts[0].reactions" exists
# jsonpath "$.posts[0].reactionsByType" exists
jsonpath "$.posts[0].sharesCount" >= 0
jsonpath "$.posts[0].statusType" exists
# jsonpath "$.posts[0].videoViewTime" >= 0
# jsonpath "$.posts[0].videoViews" >= 0
# jsonpath "$.posts[0].videoViewsUnique" >= 0

jsonpath "$.lastUpdated" exists
jsonpath "$.nextUpdate" exists

# /history all posts Facebook -
GET {{BASE_URL}}/api/history/linkedin?limit=10
Content-Type: application/json
Authorization: Bearer {{API_KEY}}

HTTP 200
[Asserts]
header "Content-Type" == "application/json; charset=utf-8"
jsonpath "$.status" == "success"
jsonpath "$.posts" count == 10

jsonpath "$.posts[0].clickCount" >= 0
jsonpath "$.posts[0].commentCount" >= 0
jsonpath "$.posts[0].created" exists
jsonpath "$.posts[0].engagement" >= 0
jsonpath "$.posts[0].impressionCount" >= 0
jsonpath "$.posts[0].id" exists
jsonpath "$.posts[0].lastModified" exists
jsonpath "$.posts[0].likeCount" >= 0
jsonpath "$.posts[0].post" exists
jsonpath "$.posts[0].postUrl" exists
jsonpath "$.posts[0].publishedAt" exists
jsonpath "$.posts[0].shareCount" >= 0
jsonpath "$.posts[0].status" == "PUBLISHED"
jsonpath "$.posts[0].uniqueImpressionsCount" >= 0
jsonpath "$.posts[0].visibility" == "PUBLIC"
# -----------------------