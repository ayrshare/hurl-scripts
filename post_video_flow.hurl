# /post POST -------------
POST {{BASE_URL}}/post
Content-Type: application/json
Authorization: Bearer {{API_KEY}}
{
    "randomPost": true,
    "platforms": [
        "instagram", "facebook", "linkedin", "pinterest", "twitter", "tiktok", "youtube", "threads"
    ],
    "mediaUrl": ["https://img.ayrshare.com/012/vid.mp4"],
    "youTubeOptions": {
        "title": "Super One!"
    },
    "pinterestOptions": {
        "thumbNail": "https://images.unsplash.com/photo-1513093496871-0a81425386e5?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MnwxNjQ1ODN8MHwxfHJhbmRvbXx8fHx8fHx8fDE2Mzg0ODAzNDA&ixlib=rb-1.2.1&q=80&w=400"
    }
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
jsonpath "$.postIds[4].platform" == "threads"

jsonpath "$.postIds[5].status" == "success"
#jsonpath "$.postIds[5].id" == "pending"
jsonpath "$.postIds[5].platform" == "tiktok"

jsonpath "$.postIds[6].status" == "success"
jsonpath "$.postIds[6].id" exists
jsonpath "$.postIds[6].postUrl" exists
jsonpath "$.postIds[6].platform" == "twitter"

jsonpath "$.postIds[7].status" == "success"
jsonpath "$.postIds[7].id" exists
jsonpath "$.postIds[7].postUrl" exists
jsonpath "$.postIds[7].platform" == "youtube"



jsonpath "$.id" exists
jsonpath "$.refId" exists
jsonpath "$.post" exists

[Captures]
id: jsonpath "$['id']"
fb_id: jsonpath "$.postIds[0].id"
ig_id: jsonpath "$.postIds[1].id"
li_id: jsonpath "$.postIds[2].id"
pi_id: jsonpath "$.postIds[3].id"
th_id: jsonpath "$.postIds[4].id"
tt_id: jsonpath "$.postIds[5].id"
tw_id: jsonpath "$.postIds[6].id"
yt_id: jsonpath "$.postIds[7].id"
# -----------------------

# /analytics/post -------
POST {{BASE_URL}}/analytics/post
Content-Type: application/json
Authorization: Bearer {{API_KEY}}
{
    "id": "{{id}}",
    "platforms": ["instagram", "facebook", "linkedin", "pinterest", "twitter", "youtube", "threads"]
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
jsonpath "$.twitter.analytics.nonPublicMetrics.video.playback50Count" exists
jsonpath "$.twitter.analytics.nonPublicMetrics.video.playback0Count" exists
jsonpath "$.twitter.analytics.nonPublicMetrics.video.playback75Count" exists
jsonpath "$.twitter.analytics.nonPublicMetrics.video.playback100Count" exists
jsonpath "$.twitter.analytics.nonPublicMetrics.video.playback25Count" exists
jsonpath "$.twitter.analytics.organicMetrics" exists
jsonpath "$.twitter.analytics.organicMetrics.likeCount" exists
jsonpath "$.twitter.analytics.organicMetrics.impressionCount" exists
jsonpath "$.twitter.analytics.organicMetrics.replyCount" exists
jsonpath "$.twitter.analytics.organicMetrics.retweetCount" exists
jsonpath "$.twitter.analytics.organicMetrics.userProfileClicks" exists
jsonpath "$.twitter.analytics.organicMetrics.video.playback50Count" exists
jsonpath "$.twitter.analytics.organicMetrics.video.playback0Count" exists
jsonpath "$.twitter.analytics.organicMetrics.video.playback75Count" exists
jsonpath "$.twitter.analytics.organicMetrics.video.playback100Count" exists
jsonpath "$.twitter.analytics.organicMetrics.video.playback25Count" exists
jsonpath "$.twitter.analytics.organicMetrics.video.viewCount" exists
jsonpath "$.twitter.analytics.post" exists
jsonpath "$.twitter.analytics.publicMetrics" exists
jsonpath "$.twitter.analytics.publicMetrics.likeCount" exists
jsonpath "$.twitter.analytics.publicMetrics.quoteCount" exists
jsonpath "$.twitter.analytics.publicMetrics.replyCount" exists
jsonpath "$.twitter.analytics.publicMetrics.retweetCount" exists
jsonpath "$.twitter.analytics.username" exists

jsonpath "$.youtube" exists
jsonpath "$.youtube.id" == "{{yt_id}}"
jsonpath "$.youtube.postUrl" exists
jsonpath "$.youtube.analytics.averageViewDuration" exists
jsonpath "$.youtube.analytics.averageViewPercentage" exists
jsonpath "$.youtube.analytics.channelTitle" exists
jsonpath "$.youtube.analytics.comments" exists
jsonpath "$.youtube.analytics.created" exists
jsonpath "$.youtube.analytics.description" exists
jsonpath "$.youtube.analytics.dislikes" exists
jsonpath "$.youtube.analytics.estimatedMinutesWatched" exists
jsonpath "$.youtube.analytics.likes" exists
jsonpath "$.youtube.analytics.madeForKids" == false
jsonpath "$.youtube.analytics.privacyStatus" == "private"
jsonpath "$.youtube.analytics.subscribersGained" exists
jsonpath "$.youtube.analytics.subscribersLost" exists
jsonpath "$.youtube.analytics.tags" exists
jsonpath "$.youtube.analytics.thumbnailUrl" exists
jsonpath "$.youtube.analytics.title" exists
jsonpath "$.youtube.analytics.videosAddedToPlaylists" exists
jsonpath "$.youtube.analytics.views" exists

jsonpath "$.threads" exists
jsonpath "$.threads.id" == "{{th_id}}"
jsonpath "$.threads.analytics.views" exists
jsonpath "$.threads.analytics.likes" exists
jsonpath "$.threads.analytics.replies" exists
jsonpath "$.threads.analytics.reposts" exists
jsonpath "$.threads.analytics.quotes" exists
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