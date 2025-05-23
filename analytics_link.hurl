# /links POST -----------------
POST {{BASE_URL}}/links
Content-Type: application/json
Authorization: Bearer {{API_KEY}}
{
    "url": "https://www.ayrshare.com/"
}

HTTP 200
[Captures]
urlId: jsonpath "$.shortUrl" regex /https:\/\/ayrs.io\/(.*)/
[Asserts]
header "Content-Type" == "application/json; charset=utf-8"
jsonpath "$.status" == "success"
jsonpath "$.shortUrl" matches /https:\/\/ayrs.io\/(.*)/
jsonpath "$.shortUrl" contains "{{urlId}}"
jsonpath "$.id" == "{{urlId}}"
jsonpath "$.originalUrl" == "https://www.ayrshare.com/"
jsonpath "$.created" exists
# -----------------------

# /analytics/links-short GET -----------------
GET {{BASE_URL}}/analytics/links-short
Content-Type: application/json
Authorization: Bearer {{API_KEY}}

HTTP 200
[Asserts]
header "Content-Type" == "application/json; charset=utf-8"
jsonpath "$.status" == "success"
jsonpath "$.analytics[0].totalClicks" exists
jsonpath "$.analytics[0].refererCounts" exists
jsonpath "$.analytics[0].browserCounts" exists
jsonpath "$.analytics[0].originalUrl" == "https://www.ayrshare.com/"
jsonpath "$.analytics[0].shortUrl" == "https://ayrs.io/{{urlId}}"
jsonpath "$.analytics[0].created" exists
# -----------------------

# /analytics/links-short GET with created date params-----------------
#GET {{BASE_URL}}/analytics/links-short?fromCreatedDate=2023-03-16&toCreatedDate=2023-03-17
#Content-Type: application/json
#Authorization: Bearer {{API_KEY}}

#HTTP 200
#[Asserts]
#header "Content-Type" == "application/json; charset=utf-8"
#jsonpath "$.status" == "success"
#jsonpath "$.analytics[0]" exists
#jsonpath "$.analytics[1]" not exists
#jsonpath "$.analytics[0].totalClicks" > 0
#jsonpath "$.analytics[0].refererCounts" exists
#jsonpath "$.analytics[0].browserCounts" exists
#jsonpath "$.analytics[0].originalUrl" == "https://www.ayrshare.com/"
#jsonpath "$.analytics[0].shortUrl" == "https://ayrs.io/{{urlId}}"
#jsonpath "$.analytics[0].created" exists
# -----------------------

# /analytics/links-short GET with click date params -----------------
#GET {{BASE_URL}}/analytics/links-short?fromClickDate=2023-03-17&toClickDate=2023-03-18
#Content-Type: application/json
#Authorization: Bearer {{API_KEY}}

#HTTP 200
#[Asserts]
#header "Content-Type" == "application/json; charset=utf-8"
#jsonpath "$.status" == "success"
#jsonpath "$.analytics[0]" exists
#jsonpath "$.analytics[1]" exists
#jsonpath "$.analytics[0].totalClicks" == 1
#jsonpath "$.analytics[0].refererCounts" exists
#jsonpath "$.analytics[0].browserCounts" exists
#jsonpath "$.analytics[0].originalUrl" == "https://www.ayrshare.com/"
#jsonpath "$.analytics[0].shortUrl" == "https://ayrs.io/{{urlId}}"
#jsonpath "$.analytics[0].created" exists
# -----------------------

# /analytics/links-short/:linkId GET -----------------
GET {{BASE_URL}}/links/{{urlId}}
Content-Type: application/json
Authorization: Bearer {{API_KEY}}

HTTP 200
[Asserts]
header "Content-Type" == "application/json; charset=utf-8"
jsonpath "$.status" == "success"
jsonpath "$.analytics.totalClicks" exists
jsonpath "$.analytics.shortUrl" matches /https:\/\/ayrs.io\/(.*)/
jsonpath "$.analytics.id" == "{{urlId}}"
jsonpath "$.analytics.originalUrl" == "https://www.ayrshare.com/"
jsonpath "$.analytics.created" exists
jsonpath "$.analytics.totalClicks" >= 0
# -----------------------

# /analytics/links-short/:linkId GET with click date params-----------------
# GET {{BASE_URL}}/links/{{urlId}}?fromClickDate=2023-03-17&toClickDate=2023-03-18
# Content-Type: application/json
# Authorization: Bearer {{API_KEY}}

# HTTP 200
# [Asserts]
# header "Content-Type" == "application/json; charset=utf-8"
# jsonpath "$.status" == "success"
# jsonpath "$.analytics.totalClicks" == 1
# jsonpath "$.analytics.shortUrl" matches /https:\/\/ayrs.io\/(.*)/
# jsonpath "$.analytics.id" == "{{urlId}}"
# jsonpath "$.analytics.originalUrl" == "https://www.ayrshare.com/"
# jsonpath "$.analytics.created" exists
# -----------------------