# /auto-hashtag -----------------
POST {{BASE_URL}}/api/auto-hashtag
Content-Type: application/json
Authorization: Bearer {{API_KEY}}
{ 
    "post": "Today is a great day", "position": "auto", "max": 3
}

HTTP 200
[Asserts]
header "Content-Type" == "application/json; charset=utf-8"
jsonpath "$.post" == "#TodayIs a #GreatDay #GreatDays"
# -----------------------

# /auto-hashtag -----------------
POST {{BASE_URL}}/api/auto-hashtag
Content-Type: application/json
Authorization: Bearer {{API_KEY}}
{ 
    "post": "Today is a great day", "position": "end", "max": 3
}

HTTP 200
[Asserts]
header "Content-Type" == "application/json; charset=utf-8"
jsonpath "$.post" == "Today is a great day #todayis #greatday #greatdays"
# -----------------------