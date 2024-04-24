# /user -----------------
GET {{BASE_URL}}/api/user?instagramQuota=true
Content-Type: application/json
Authorization: Bearer {{API_KEY}}

HTTP 200
[Asserts]
header "Content-Type" == "application/json; charset=utf-8"
jsonpath "$.activeSocialAccounts" count == 10
jsonpath "$.ayrlinkUrl" exists
jsonpath "$.created" exists

# Facebook
jsonpath "$.displayNames[0].created" exists
jsonpath "$.displayNames[0].displayName" exists
jsonpath "$.displayNames[0].id" exists
jsonpath "$.displayNames[0].platform" == "facebook"
jsonpath "$.displayNames[0].profileUrl" exists
jsonpath "$.displayNames[0].userImage" exists

# GMB
jsonpath "$.displayNames[1].created" exists
jsonpath "$.displayNames[1].displayName" exists
jsonpath "$.displayNames[1].platform" == "gmb"

# Instagram
jsonpath "$.displayNames[2].created" exists
jsonpath "$.displayNames[2].displayName" exists
jsonpath "$.displayNames[2].id" exists
jsonpath "$.displayNames[2].platform" == "instagram"
jsonpath "$.displayNames[2].profileUrl" exists
jsonpath "$.displayNames[2].usedQuota" exists
jsonpath "$.displayNames[2].userImage" exists
jsonpath "$.displayNames[2].username" exists

# LinkedIn
jsonpath "$.displayNames[3].created" exists
jsonpath "$.displayNames[3].displayName" exists
jsonpath "$.displayNames[3].id" exists
jsonpath "$.displayNames[3].platform" == "linkedin"
jsonpath "$.displayNames[3].profileUrl" exists
jsonpath "$.displayNames[3].refreshDaysRemaining" exists
jsonpath "$.displayNames[3].type" exists
jsonpath "$.displayNames[3].userImage" exists

# Pinterest
jsonpath "$.displayNames[4].created" exists
jsonpath "$.displayNames[4].displayName" exists
jsonpath "$.displayNames[4].id" exists
jsonpath "$.displayNames[4].platform" == "pinterest"
jsonpath "$.displayNames[4].profileUrl" exists
jsonpath "$.displayNames[4].userImage" exists
jsonpath "$.displayNames[4].username" exists

# Reddit
jsonpath "$.displayNames[5].created" exists
jsonpath "$.displayNames[5].displayName" exists
jsonpath "$.displayNames[5].platform" == "reddit"
jsonpath "$.displayNames[5].profileUrl" exists
jsonpath "$.displayNames[5].userImage" exists
jsonpath "$.displayNames[5].username" exists

# Telegram
jsonpath "$.displayNames[6].created" exists
jsonpath "$.displayNames[6].displayName" exists
jsonpath "$.displayNames[6].id" exists
jsonpath "$.displayNames[6].platform" == "telegram"
jsonpath "$.displayNames[6].profileUrl" exists
jsonpath "$.displayNames[6].type" exists
# jsonpath "$.displayNames[6].userImage" exists

# TikTok
jsonpath "$.displayNames[7].created" exists
jsonpath "$.displayNames[7].displayName" exists
jsonpath "$.displayNames[7].id" exists
jsonpath "$.displayNames[7].platform" == "tiktok"
jsonpath "$.displayNames[7].profileUrl" exists
jsonpath "$.displayNames[7].userImage" exists
jsonpath "$.displayNames[7].username" exists

# Twitter
jsonpath "$.displayNames[8].created" exists
jsonpath "$.displayNames[8].displayName" exists
jsonpath "$.displayNames[8].id" exists
jsonpath "$.displayNames[8].platform" == "twitter"
jsonpath "$.displayNames[8].profileUrl" exists
jsonpath "$.displayNames[8].userImage" exists
jsonpath "$.displayNames[8].username" exists

# YouTube
jsonpath "$.displayNames[9].created" exists
jsonpath "$.displayNames[9].displayName" exists
jsonpath "$.displayNames[9].id" exists
jsonpath "$.displayNames[9].platform" == "youtube"
jsonpath "$.displayNames[9].profileUrl" exists
jsonpath "$.displayNames[9].userImage" exists
jsonpath "$.displayNames[9].username" exists

jsonpath "$.email" == {{EMAIL}}
jsonpath "$.monthlyApiCalls" > 0
jsonpath "$.refId" == {{REFID}}
jsonpath "$.title" == "Primary Profile"
# -----------------------