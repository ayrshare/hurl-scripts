# /generateJWT POST -------------
POST {{BASE_URL}}/api/profiles/generateJWT
Content-Type: application/json
Authorization: Bearer {{API_KEY}}
{
    "domain": "ayrshare",
    "privateKey": "{{PRIVATE_KEY}}",
    "profileKey": "{{PROFILE_KEY}}",
    "logout": true,
    "base64": true
}

HTTP/* 200
[Asserts]
header "Content-Type" == "application/json; charset=utf-8"
jsonpath "$.status" == "success"
jsonpath "$.title" exists
jsonpath "$.token" exists
jsonpath "$.url" startsWith "https://profile.ayrshare.com?domain=ayrshare&jwt="
# ------------------------------