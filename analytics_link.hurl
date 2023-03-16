# /analytics/links2 -----------------
GET {{BASE_URL}}/api/analytics/links2
Content-Type: application/json
Authorization: Bearer {{API_KEY}}

HTTP 200
[Asserts]
header "Content-Type" == "application/json; charset=utf-8"
jsonpath "$.analytics[0].totalClicks" exists
jsonpath "$.analytics[0].refererCounts" exists
jsonpath "$.analytics[0].browserCounts" exists
jsonpath "$.analytics[0].originalUrl" == "https://www.ayrshare.com"
jsonpath "$.analytics[0].shortUrl" == "https://ayrs.io/TkxYJ_lNCvuSIApU5an6L"
jsonpath "$.analytics[0].created" exists
# -----------------------

# /analytics/links2/:linkId -----------------
GET {{BASE_URL}}/api/analytics/links2/TkxYJ_lNCvuSIApU5an6L
Content-Type: application/json
Authorization: Bearer {{API_KEY}}

HTTP 200
[Asserts]
header "Content-Type" == "application/json; charset=utf-8"
jsonpath "$.analytics.totalClicks" exists
jsonpath "$.analytics.refererCounts" exists
jsonpath "$.analytics.browserCounts" exists
jsonpath "$.analytics.originalUrl" == "https://www.ayrshare.com"
jsonpath "$.analytics.shortUrl" == "https://ayrs.io/TkxYJ_lNCvuSIApU5an6L"
jsonpath "$.analytics.created" exists
# -----------------------
