### /history all posts Instagram -
GET {{BASE_URL}}/api/history/instagram?limit=8
Content-Type: application/json
Authorization: Bearer {{API_KEY}}

HTTP 200
[Asserts]
header "Content-Type" == "application/json; charset=utf-8"
jsonpath "$.status" == "success"
jsonpath "$.posts" count >= 2

jsonpath "$.posts[0].commentsCount" >= 0
jsonpath "$.posts[0].created" exists
jsonpath "$.posts[0].id" exists
jsonpath "$.posts[0].likeCount" >= 0
jsonpath "$.posts[0].mediaProductType" exists
jsonpath "$.posts[0].mediaType" exists
jsonpath "$.posts[0].mediaUrl" exists
jsonpath "$.posts[0].post" exists
jsonpath "$.posts[0].postUrl" exists
jsonpath "$.posts[0].username" exists

jsonpath "$.lastUpdated" exists
jsonpath "$.nextUpdate" exists
# -----------------------

### /history all posts Facebook -
GET {{BASE_URL}}/api/history/facebook?limit=10
Content-Type: application/json
Authorization: Bearer {{API_KEY}}

HTTP 200
[Asserts]
header "Content-Type" == "application/json; charset=utf-8"
jsonpath "$.status" == "success"
jsonpath "$.posts" count >= 5

# jsonpath "$.posts[0].clicksUnique" exists
jsonpath "$.posts[0].commentsCount" >= 0
jsonpath "$.posts[0].created" exists
# jsonpath "$.posts[0].engagedUsers" >= 0
# jsonpath "$.posts[0].from.name" exists
# jsonpath "$.posts[0].from.id" exists
jsonpath "$.posts[0].id" exists
# jsonpath "$.posts[0].impressionsUnique" >= 0
jsonpath "$.posts[0].isPopular" exists
jsonpath "$.posts[0].likeCount" >= 0
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

### /history all posts LinkedIn -
GET {{BASE_URL}}/api/history/linkedin?limit=10
Content-Type: application/json
Authorization: Bearer {{API_KEY}}

HTTP 200
[Asserts]
header "Content-Type" == "application/json; charset=utf-8"
jsonpath "$.status" == "success"
jsonpath "$.posts" count >= 5

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

# /history all posts Threads -
# GET {{BASE_URL}}/api/history/threads?limit=10
# Content-Type: application/json
# Authorization: Bearer {{API_KEY}}

#HTTP 200
#[Asserts]
#header "Content-Type" == "application/json; charset=utf-8"
#jsonpath "$.status" == "success"
#jsonpath "$.posts" count >= 5

#jsonpath "$.posts[0].hasReplies" exists
#jsonpath "$.posts[0].id" exists
#jsonpath "$.posts[0].isQuotePost" exists
#jsonpath "$.posts[0].mediaProductType" exists
#jsonpath "$.posts[0].mediaType" exists
#jsonpath "$.posts[0].mediaUrl" exists
#jsonpath "$.posts[0].owner.id" exists
#jsonpath "$.posts[0].permalink" exists
#jsonpath "$.posts[0].replyAudience" exists
#jsonpath "$.posts[0].shortcode" exists
#jsonpath "$.posts[0].text" exists
#jsonpath "$.posts[0].timestamp" exists
#jsonpath "$.posts[0].username" exists

### /history all posts Twitter -
GET {{BASE_URL}}/api/history/twitter?limit=10
Content-Type: application/json
Authorization: Bearer {{API_KEY}}

HTTP 200
[Asserts]
header "Content-Type" == "application/json; charset=utf-8"
jsonpath "$.status" == "success"
jsonpath "$.posts" count >= 5

jsonpath "$.posts[0].authorId" exists
jsonpath "$.posts[0].created" exists
jsonpath "$.posts[0].editHistoryTweetIds" exists
jsonpath "$.posts[0].id" exists
jsonpath "$.posts[0].nonPublicMetrics.impressionCount" >= 0
jsonpath "$.posts[0].nonPublicMetrics.userProfileClicks" >= 0
jsonpath "$.posts[0].organicMetrics.impressionCount" >= 0
jsonpath "$.posts[0].organicMetrics.userProfileClicks" >= 0
jsonpath "$.posts[0].organicMetrics.retweetCount" >= 0
jsonpath "$.posts[0].organicMetrics.likeCount" >= 0
jsonpath "$.posts[0].organicMetrics.replyCount" >= 0
jsonpath "$.posts[0].postUrl" exists
jsonpath "$.posts[0].publicMetrics.retweetCount" >= 0
jsonpath "$.posts[0].publicMetrics.replyCount" >= 0
jsonpath "$.posts[0].publicMetrics.likeCount" >= 0
jsonpath "$.posts[0].publicMetrics.quoteCount" >= 0
jsonpath "$.posts[0].publicMetrics.impressionCount" >= 0
# -----------------------

### /history all posts Bluesky -
GET {{BASE_URL}}/api/history/bluesky?limit=10
Content-Type: application/json
Authorization: Bearer {{API_KEY}}

HTTP 200
[Asserts]
header "Content-Type" == "application/json; charset=utf-8"
jsonpath "$.status" == "success"
jsonpath "$.posts" count >= 5

jsonpath "$.posts[0].created" exists
jsonpath "$.posts[0].cid" exists
jsonpath "$.posts[0].id" exists
jsonpath "$.posts[0].likeCount" >= 0
jsonpath "$.posts[0].replyCount" >= 0
jsonpath "$.posts[0].repostCount" >= 0
jsonpath "$.posts[0].post" exists
jsonpath "$.posts[0].postUrl" exists
# -----------------------

### /history all posts TikTok -
GET {{BASE_URL}}/api/history/tiktok?limit=10
Content-Type: application/json
Authorization: Bearer {{API_KEY}}

HTTP 200
[Asserts]
header "Content-Type" == "application/json; charset=utf-8"
jsonpath "$.status" == "success"
jsonpath "$.posts" count >= 5

jsonpath "$.posts[0].created" exists
jsonpath "$.posts[0].id" exists
jsonpath "$.posts[0].likeCount" >= 0
jsonpath "$.posts[0].mediaType" exists
jsonpath "$.posts[0].post" exists
jsonpath "$.posts[0].postUrl" exists
jsonpath "$.posts[0].videoDuration" exists
jsonpath "$.posts[0].videoViews" exists
jsonpath "$.posts[0].audienceCountries" exists
jsonpath "$.posts[0].impressionSources" exists
# -----------------------
