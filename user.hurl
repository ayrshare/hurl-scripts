# /user -----------------
GET {{BASE_URL}}/user?instagramQuota=true
Content-Type: application/json
Authorization: Bearer {{API_KEY}}

HTTP 200
[Asserts]
header "Content-Type" == "application/json; charset=utf-8"
jsonpath "$.activeSocialAccounts" count == 13
jsonpath "$.ayrlinkUrl" exists
jsonpath "$.created" exists

# Bluesky
jsonpath "$.displayNames[0].created" exists
jsonpath "$.displayNames[0].displayName" exists
jsonpath "$.displayNames[0].id" exists
jsonpath "$.displayNames[0].platform" == "bluesky"
jsonpath "$.displayNames[0].profileUrl" exists
jsonpath "$.displayNames[0].userImage" exists
jsonpath "$.displayNames[0].username" exists

# Facebook
jsonpath "$.displayNames[1].created" exists
jsonpath "$.displayNames[1].displayName" exists
jsonpath "$.displayNames[1].id" exists
jsonpath "$.displayNames[1].platform" == "facebook"
jsonpath "$.displayNames[1].profileUrl" exists
jsonpath "$.displayNames[1].userImage" exists

# GMB
jsonpath "$.displayNames[2].created" exists
jsonpath "$.displayNames[2].displayName" exists
jsonpath "$.displayNames[2].platform" == "gmb"

# Instagram
jsonpath "$.displayNames[3].created" exists
jsonpath "$.displayNames[3].displayName" exists
jsonpath "$.displayNames[3].id" exists
jsonpath "$.displayNames[3].platform" == "instagram"
jsonpath "$.displayNames[3].profileUrl" exists
jsonpath "$.displayNames[3].usedQuota" exists
jsonpath "$.displayNames[3].userImage" exists
jsonpath "$.displayNames[3].username" exists

# LinkedIn
jsonpath "$.displayNames[4].created" exists
jsonpath "$.displayNames[4].displayName" exists
jsonpath "$.displayNames[4].id" exists
jsonpath "$.displayNames[4].platform" == "linkedin"
jsonpath "$.displayNames[4].profileUrl" exists
jsonpath "$.displayNames[4].refreshDaysRemaining" exists
jsonpath "$.displayNames[4].type" exists
jsonpath "$.displayNames[4].userImage" exists

# Pinterest
jsonpath "$.displayNames[5].created" exists
jsonpath "$.displayNames[5].displayName" exists
jsonpath "$.displayNames[5].id" exists
jsonpath "$.displayNames[5].platform" == "pinterest"
jsonpath "$.displayNames[5].profileUrl" exists
jsonpath "$.displayNames[5].userImage" exists
jsonpath "$.displayNames[5].username" exists

# Reddit
jsonpath "$.displayNames[6].created" exists
jsonpath "$.displayNames[6].displayName" exists
jsonpath "$.displayNames[6].platform" == "reddit"
jsonpath "$.displayNames[6].profileUrl" exists
jsonpath "$.displayNames[6].userImage" exists
jsonpath "$.displayNames[6].username" exists

# Snapchat
jsonpath "$.displayNames[7].created" exists
jsonpath "$.displayNames[7].displayName" exists
jsonpath "$.displayNames[7].id" exists
jsonpath "$.displayNames[7].platform" == "snapchat"
jsonpath "$.displayNames[7].profileUrl" exists
jsonpath "$.displayNames[7].userImage" exists

# Telegram
jsonpath "$.displayNames[8].created" exists
jsonpath "$.displayNames[8].displayName" exists
jsonpath "$.displayNames[8].id" exists
jsonpath "$.displayNames[8].platform" == "telegram"
jsonpath "$.displayNames[8].profileUrl" exists
jsonpath "$.displayNames[8].type" exists
# jsonpath "$.displayNames[8].userImage" exists

# Threads
jsonpath "$.displayNames[9].created" exists
jsonpath "$.displayNames[9].displayName" exists
jsonpath "$.displayNames[9].id" exists
jsonpath "$.displayNames[9].platform" == "threads"
jsonpath "$.displayNames[9].profileUrl" exists
jsonpath "$.displayNames[9].userImage" exists
jsonpath "$.displayNames[9].username" exists

# TikTok
jsonpath "$.displayNames[10].created" exists
jsonpath "$.displayNames[10].displayName" exists
jsonpath "$.displayNames[10].id" exists
jsonpath "$.displayNames[10].platform" == "tiktok"
jsonpath "$.displayNames[10].profileUrl" exists
jsonpath "$.displayNames[10].userImage" exists
jsonpath "$.displayNames[10].username" exists

# Twitter
jsonpath "$.displayNames[11].created" exists
jsonpath "$.displayNames[11].displayName" exists
jsonpath "$.displayNames[11].id" exists
jsonpath "$.displayNames[11].platform" == "twitter"
jsonpath "$.displayNames[11].profileUrl" exists
jsonpath "$.displayNames[11].userImage" exists
jsonpath "$.displayNames[11].username" exists

# YouTube
jsonpath "$.displayNames[12].created" exists
jsonpath "$.displayNames[12].displayName" exists
jsonpath "$.displayNames[12].id" exists
jsonpath "$.displayNames[12].platform" == "youtube"
jsonpath "$.displayNames[12].profileUrl" exists
jsonpath "$.displayNames[12].userImage" exists
jsonpath "$.displayNames[12].username" exists

jsonpath "$.email" == {{EMAIL}}
jsonpath "$.monthlyApiCalls" >= 0
jsonpath "$.refId" == {{REFID}}
jsonpath "$.title" == "Primary Profile"
# -----------------------