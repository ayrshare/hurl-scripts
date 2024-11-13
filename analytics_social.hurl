# /analytics/social -----
POST {{BASE_URL}}/api/analytics/social
Content-Type: application/json
Authorization: Bearer {{API_KEY}}
{
    "platforms": [
        "twitter", "facebook", "instagram",  "linkedin", "tiktok", "youtube"
    ]
}

HTTP 200
[Asserts]
header "Content-Type" == "application/json; charset=utf-8"
jsonpath "$.status" == "success"

jsonpath "$.twitter.analytics.created" exists
jsonpath "$.twitter.analytics.description" exists
jsonpath "$.twitter.analytics.displayName" exists
jsonpath "$.twitter.analytics.followersCount" exists
jsonpath "$.twitter.analytics.id" exists
jsonpath "$.twitter.analytics.listedCount" exists
jsonpath "$.twitter.analytics.location" exists
jsonpath "$.twitter.analytics.name" exists
jsonpath "$.twitter.analytics.profileImageUrl" exists
jsonpath "$.twitter.analytics.protected" exists
jsonpath "$.twitter.analytics.tweetCount" exists
jsonpath "$.twitter.analytics.url" exists
jsonpath "$.twitter.analytics.username" exists
jsonpath "$.twitter.analytics.verified" exists

jsonpath "$.facebook.analytics.fanCount" exists
jsonpath "$.facebook.analytics.followersCount" exists
jsonpath "$.facebook.analytics.id" exists
jsonpath "$.facebook.analytics.link" exists
jsonpath "$.facebook.analytics.name" exists
# jsonpath "$.facebook.analytics.pageConsumptions" exists
# jsonpath "$.facebook.analytics.pageConsumptionsByConsumptionType" exists
# jsonpath "$.facebook.analytics.pageEngagedUsers" exists
jsonpath "$.facebook.analytics.pageFanRemoves" exists
# jsonpath "$.facebook.analytics.pageFansByLikeSource" exists
# jsonpath "$.facebook.analytics.pageFansByLikeSourceUnique" exists
jsonpath "$.facebook.analytics.pageImpressions" exists
jsonpath "$.facebook.analytics.pageImpressionsPaid" exists
jsonpath "$.facebook.analytics.pagePostEngagements" exists
jsonpath "$.facebook.analytics.pagePostsImpressions" exists
jsonpath "$.facebook.analytics.pagePostsImpressionsPaid" exists
jsonpath "$.facebook.analytics.pageVideoViewTime" exists
jsonpath "$.facebook.analytics.pageVideoViews" exists
jsonpath "$.facebook.analytics.pageVideoViewsPaid" exists
jsonpath "$.facebook.analytics.reactions.anger" exists
jsonpath "$.facebook.analytics.reactions.like" exists
jsonpath "$.facebook.analytics.reactions.love" exists
jsonpath "$.facebook.analytics.reactions.wow" exists
jsonpath "$.facebook.analytics.reactions.haha" exists
jsonpath "$.facebook.analytics.reactions.sorry" exists
jsonpath "$.facebook.analytics.reactions.total" exists
jsonpath "$.facebook.analytics.verified" exists

jsonpath "$.instagram.analytics.biography" exists
jsonpath "$.instagram.analytics.commentsCount" exists
jsonpath "$.instagram.analytics.emailContactsCount" exists
jsonpath "$.instagram.analytics.followersCount" exists
jsonpath "$.instagram.analytics.followsCount" exists
jsonpath "$.instagram.analytics.id" exists
jsonpath "$.instagram.analytics.igId" exists
jsonpath "$.instagram.analytics.impressionsCount" exists
jsonpath "$.instagram.analytics.likeCount" exists
jsonpath "$.instagram.analytics.mediaCount" exists
jsonpath "$.instagram.analytics.name" exists
jsonpath "$.instagram.analytics.phoneCallClicksCount" exists
jsonpath "$.instagram.analytics.profilePictureUrl" exists
jsonpath "$.instagram.analytics.profileViewsCount" exists
jsonpath "$.instagram.analytics.reachCount" exists
jsonpath "$.instagram.analytics.textMessageClicksCount" exists
jsonpath "$.instagram.analytics.username" exists
jsonpath "$.instagram.analytics.websiteClicksCount" exists

jsonpath "$.linkedin.analytics.clickCount" exists
# jsonpath "$.linkedin.analytics.clicks.mobileCareersPageClicks.careersPageJobsClicks" exists
# jsonpath "$.linkedin.analytics.clicks.mobileCareersPageClicks.careersPagePromoLinksClicks" exists
# jsonpath "$.linkedin.analytics.clicks.mobileCareersPageClicks.careersPageEmployeesClicks" exists
# jsonpath "$.linkedin.analytics.clicks.careersPageClicks.careersPagePromoLinksClicks" exists
# jsonpath "$.linkedin.analytics.clicks.careersPageClicks.careersPageBannerPromoClicks" exists
# jsonpath "$.linkedin.analytics.clicks.careersPageClicks.careersPageJobsClicks" exists
# jsonpath "$.linkedin.analytics.clicks.careersPageClicks.careersPageEmployeesClicks" exists
jsonpath "$.linkedin.analytics.commentCount" exists
jsonpath "$.linkedin.analytics.engagement" exists
jsonpath "$.linkedin.analytics.followers.organicFollowerCount" exists
jsonpath "$.linkedin.analytics.followers.paidFollowerCount" exists
jsonpath "$.linkedin.analytics.impressionCount" exists
jsonpath "$.linkedin.analytics.likeCount" exists
jsonpath "$.linkedin.analytics.shareCount" exists
jsonpath "$.linkedin.analytics.views.aboutPageViews" exists
jsonpath "$.linkedin.analytics.views.allDesktopPageViews" exists
jsonpath "$.linkedin.analytics.views.allMobilePageViews" exists
jsonpath "$.linkedin.analytics.views.allPageViews" exists
jsonpath "$.linkedin.analytics.views.careersPageViews" exists
jsonpath "$.linkedin.analytics.views.desktopAboutPageViews" exists
jsonpath "$.linkedin.analytics.views.desktopCareersPageViews" exists
jsonpath "$.linkedin.analytics.views.desktopInsightsPageViews" exists
jsonpath "$.linkedin.analytics.views.desktopJobsPageViews" exists
jsonpath "$.linkedin.analytics.views.desktopLifeAtPageViews" exists
jsonpath "$.linkedin.analytics.views.desktopOverviewPageViews" exists
jsonpath "$.linkedin.analytics.views.desktopPeoplePageViews" exists
jsonpath "$.linkedin.analytics.views.desktopProductsPageViews" exists
jsonpath "$.linkedin.analytics.views.jobsPageViews" exists
jsonpath "$.linkedin.analytics.views.lifeAtPageViews" exists
jsonpath "$.linkedin.analytics.views.mobileAboutPageViews" exists
jsonpath "$.linkedin.analytics.views.mobileCareersPageViews" exists
jsonpath "$.linkedin.analytics.views.mobileInsightsPageViews" exists
jsonpath "$.linkedin.analytics.views.mobileJobsPageViews" exists
jsonpath "$.linkedin.analytics.views.mobileLifeAtPageViews" exists
jsonpath "$.linkedin.analytics.views.mobileOverviewPageViews" exists
jsonpath "$.linkedin.analytics.views.mobilePeoplePageViews" exists
jsonpath "$.linkedin.analytics.views.mobileProductsPageViews" exists
jsonpath "$.linkedin.analytics.views.overviewPageViews" exists
jsonpath "$.linkedin.analytics.views.peoplePageViews" exists
jsonpath "$.linkedin.analytics.views.productsPageViews" exists

jsonpath "$.tiktok.analytics.bio" exists
jsonpath "$.tiktok.analytics.commentCountTotal" exists
jsonpath "$.tiktok.analytics.displayName" exists
jsonpath "$.tiktok.analytics.durationAverage" exists
jsonpath "$.tiktok.analytics.followerCount" exists
jsonpath "$.tiktok.analytics.followingCount" exists
jsonpath "$.tiktok.analytics.likeCountTotal" exists
jsonpath "$.tiktok.analytics.shareCountTotal" exists
jsonpath "$.tiktok.analytics.url" exists
jsonpath "$.tiktok.analytics.userImage" exists
jsonpath "$.tiktok.analytics.username" exists
jsonpath "$.tiktok.analytics.videoCountTotal" exists
jsonpath "$.tiktok.analytics.viewCountTotal" exists

jsonpath "$.youtube.analytics.averageViewDuration" exists
jsonpath "$.youtube.analytics.averageViewPercentage" exists
jsonpath "$.youtube.analytics.comments" exists
jsonpath "$.youtube.analytics.created" exists
jsonpath "$.youtube.analytics.description" exists
jsonpath "$.youtube.analytics.dislikes" exists
jsonpath "$.youtube.analytics.estimatedMinutesWatched" exists
jsonpath "$.youtube.analytics.handle" exists
jsonpath "$.youtube.analytics.hiddenSubscriberCount" exists
jsonpath "$.youtube.analytics.id" exists
jsonpath "$.youtube.analytics.isLinked" exists
jsonpath "$.youtube.analytics.likes" exists
jsonpath "$.youtube.analytics.longUploadsStatus" exists
jsonpath "$.youtube.analytics.playlistId" exists
jsonpath "$.youtube.analytics.playlists[0].description" exists
jsonpath "$.youtube.analytics.playlists[0].id" exists
jsonpath "$.youtube.analytics.playlists[0].publishedAt" exists
jsonpath "$.youtube.analytics.playlists[0].title" exists
jsonpath "$.youtube.analytics.playlists[0].url" exists
jsonpath "$.youtube.analytics.playlists[0].channelId" exists
jsonpath "$.youtube.analytics.playlists[1].description" exists
jsonpath "$.youtube.analytics.playlists[1].id" exists
jsonpath "$.youtube.analytics.playlists[1].publishedAt" exists
jsonpath "$.youtube.analytics.playlists[1].title" exists
jsonpath "$.youtube.analytics.playlists[1].url" exists
jsonpath "$.youtube.analytics.playlists[1].channelId" exists
jsonpath "$.youtube.analytics.privacyStatus" exists
jsonpath "$.youtube.analytics.subscriberCount" exists
jsonpath "$.youtube.analytics.subscribersGained" exists
jsonpath "$.youtube.analytics.subscribersLost" exists
jsonpath "$.youtube.analytics.thumbnailUrl" exists
jsonpath "$.youtube.analytics.title" exists
jsonpath "$.youtube.analytics.url" exists
jsonpath "$.youtube.analytics.videoCount" exists
jsonpath "$.youtube.analytics.videosAddedToPlaylists" exists
jsonpath "$.youtube.analytics.viewCount" exists
jsonpath "$.youtube.analytics.views" exists

jsonpath "$.threads.analytics.followersCount" exists
jsonpath "$.threads.analytics.likes" exists
jsonpath "$.threads.analytics.quotes" exists
jsonpath "$.threads.analytics.replies" exists
jsonpath "$.threads.analytics.reposts" exists
jsonpath "$.threads.analytics.views" exists

# -----------------------