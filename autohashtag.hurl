# /auto-hashtag -----------------
POST {{BASE_URL}}/auto-hashtag
Content-Type: application/json
Authorization: Bearer {{API_KEY}}
{ 
    "post": "Today is a great day!", "position": "end", "max": 2
}

HTTP 200
[Asserts]
header "Content-Type" == "application/json; charset=utf-8"
jsonpath "$.post" contains "#"
# -----------------------