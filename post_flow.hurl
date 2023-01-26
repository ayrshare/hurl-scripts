# /post POST -------------
POST {{BASE_URL}}/api/post
Content-Type: application/json
Authorization: Bearer {{API_KEY}}
{
    "randomPost": true,
    "platforms": [
        "instagram", "facebook", "linkedin", "pinterest", "twitter"
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
jsonpath "$.postIds[0].platform" == "facebook"

jsonpath "$.postIds[1].status" == "success"
jsonpath "$.postIds[1].id" exists
jsonpath "$.postIds[1].postUrl" exists
jsonpath "$.postIds[1].usedQuota" > 0
jsonpath "$.postIds[1].platform" == "instagram"

jsonpath "$.postIds[2].status" == "success"
jsonpath "$.postIds[2].id" exists
jsonpath "$.postIds[2].postUrl" exists
jsonpath "$.postIds[2].platform" == "linkedin"

jsonpath "$.postIds[3].status" == "success"
jsonpath "$.postIds[3].id" exists
jsonpath "$.postIds[3].postUrl" exists
jsonpath "$.postIds[3].platform" == "pinterest"

jsonpath "$.postIds[4].status" == "success"
jsonpath "$.postIds[4].id" exists
jsonpath "$.postIds[4].postUrl" exists
jsonpath "$.postIds[4].platform" == "twitter"

jsonpath "$.id" exists
jsonpath "$.refId" exists
jsonpath "$.post" exists

[Captures]
id: jsonpath "$['id']"
fb_id: jsonpath "$.postIds[0].id"
ig_id: jsonpath "$.postIds[1].id"
li_id: jsonpath "$.postIds[2].id"
pi_id: jsonpath "$.postIds[3].id"
tw_id: jsonpath "$.postIds[4].id"
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

jsonpath "$.facebook" exists
jsonpath "$.facebook.id" == "{{fb_id}}"
jsonpath "$.facebook.postUrl" exists
jsonpath "$.facebook.analytics.clicksUnique" exists
jsonpath "$.facebook.analytics.commentsCount" exists
jsonpath "$.facebook.analytics.engagedUsers" exists
jsonpath "$.facebook.analytics.impressionsUnique" exists
jsonpath "$.facebook.analytics.likeCount" exists
jsonpath "$.facebook.analytics.negativeFeedback" exists
jsonpath "$.facebook.analytics.negativeFeedbackUnique" exists
jsonpath "$.facebook.analytics.reactions" exists
jsonpath "$.facebook.analytics.reactionsByType" exists
jsonpath "$.facebook.analytics.sharesCount" exists
jsonpath "$.facebook.analytics.videoViewTime" exists
jsonpath "$.facebook.analytics.videoViews" exists
jsonpath "$.facebook.analytics.videoViewsUnique" exists

jsonpath "$.instagram" exists
jsonpath "$.instagram.id" == "{{ig_id}}"
jsonpath "$.instagram.postUrl" exists
jsonpath "$.instagram.analytics.caption" exists
jsonpath "$.instagram.analytics.commentsCount" exists
jsonpath "$.instagram.analytics.created" exists
jsonpath "$.instagram.analytics.engagementCount" exists
jsonpath "$.instagram.analytics.impressionsCount" exists
jsonpath "$.instagram.analytics.likeCount" exists
jsonpath "$.instagram.analytics.mediaProductType" exists
jsonpath "$.instagram.analytics.mediaType" exists
jsonpath "$.instagram.analytics.reachCount" exists
jsonpath "$.instagram.analytics.savedCount" exists
jsonpath "$.instagram.analytics.username" exists

jsonpath "$.linkedin" exists
jsonpath "$.linkedin.id" == "{{li_id}}"
jsonpath "$.linkedin.postUrl" exists
jsonpath "$.linkedin.analytics.shareCount" exists
jsonpath "$.linkedin.analytics.likeCount" exists
jsonpath "$.linkedin.analytics.engagement" exists
jsonpath "$.linkedin.analytics.clickCount" exists
jsonpath "$.linkedin.analytics.impressionCount" exists
jsonpath "$.linkedin.analytics.commentCount" exists

jsonpath "$.pinterest" exists
jsonpath "$.pinterest.id" == "{{pi_id}}"
jsonpath "$.pinterest.postUrl" exists
jsonpath "$.pinterest.analytics.impression" exists
jsonpath "$.pinterest.analytics.save" exists
jsonpath "$.pinterest.analytics.pinClick" exists
jsonpath "$.pinterest.analytics.outboundClick" exists
jsonpath "$.pinterest.analytics.videoMrcView" exists
jsonpath "$.pinterest.analytics.videoAvgWatchTime" exists
jsonpath "$.pinterest.analytics.videoV50WatchTime" exists
jsonpath "$.pinterest.analytics.quartile95PercentView" exists

jsonpath "$.twitter" exists
jsonpath "$.twitter.id" == "{{tw_id}}"
jsonpath "$.twitter.postUrl" exists
jsonpath "$.twitter.analytics.created" exists
jsonpath "$.twitter.analytics.name" exists
jsonpath "$.twitter.analytics.nonPublicMetrics" exists
jsonpath "$.twitter.analytics.nonPublicMetrics.userProfileClicks" exists
jsonpath "$.twitter.analytics.nonPublicMetrics.impressionCount" exists
jsonpath "$.twitter.analytics.organicMetrics" exists
jsonpath "$.twitter.analytics.organicMetrics.likeCount" exists
jsonpath "$.twitter.analytics.organicMetrics.impressionCount" exists
jsonpath "$.twitter.analytics.organicMetrics.replyCount" exists
jsonpath "$.twitter.analytics.organicMetrics.retweetCount" exists
jsonpath "$.twitter.analytics.organicMetrics.userProfileClicks" exists
jsonpath "$.twitter.analytics.post" exists
jsonpath "$.twitter.analytics.publicMetrics" exists
jsonpath "$.twitter.analytics.publicMetrics.likeCount" exists
jsonpath "$.twitter.analytics.publicMetrics.quoteCount" exists
jsonpath "$.twitter.analytics.publicMetrics.replyCount" exists
jsonpath "$.twitter.analytics.publicMetrics.retweetCount" exists
jsonpath "$.twitter.analytics.username" exists
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