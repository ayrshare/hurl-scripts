# /post POST compliant reel -------------
POST {{BASE_URL}}/post 
Content-Type: application/json
Authorization: Bearer {{API_KEY}}
[Options]
delay: 10000
{
    "randomPost": true,
    "platforms": ["instagram"],
    "mediaUrl": ["https://firebasestorage.googleapis.com/v0/b/ayrshare-dev.appspot.com/o/media%2Fsmaller.mov?alt=media&token=54a1605a-cc21-4a20-b1fa-6c548fdfee73"], 
    "isVideo": true, 
    "instagramOptions": {
        "reels": true
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
jsonpath "$.postIds[0].platform" == "instagram"

jsonpath "$.id" exists
jsonpath "$.refId" exists
jsonpath "$.post" exists

[Captures]
id: jsonpath "$['id']"
li_id: jsonpath "$.postIds[0].id"
# -----------------------

# /post POST non-compliant too wide reel -------------
POST {{BASE_URL}}/post 
Content-Type: application/json
Authorization: Bearer {{API_KEY}}
[Options]
delay: 10000
{
    "randomPost": true,
    "platforms": ["instagram"],
    "mediaUrl": ["https://firebasestorage.googleapis.com/v0/b/ayrshare-dev.appspot.com/o/media%2Flarger.mov?alt=media&token=f7dbb6ae-17a3-4139-9804-cafaee1e5bc1"], 
    "isVideo": true, 
    "instagramOptions": {
        "reels": true
    }
}

HTTP 400
[Asserts]
header "Content-Type" == "application/json; charset=utf-8"
jsonpath "$.status" == "error"
jsonpath "$.errors" count == 1 
jsonpath "$.errors[0].action" == "post"
jsonpath "$.errors[0].status" == "error"
jsonpath "$.errors[0].code" == 182
jsonpath "$.errors[0].message" exists
jsonpath "$.errors[0].verifyCheck" == true
jsonpath "$.errors[0].platform" == "instagram"

jsonpath "$.postIds" count == 0
jsonpath "$.id" exists
jsonpath "$.refId" exists
jsonpath "$.post" exists
jsonpath "$.validate" == true
# -----------------------

# CLEANUP ----------------------------
DELETE {{BASE_URL}}/post
Content-Type: application/json
Authorization: Bearer {{API_KEY}}
[Options]
delay: 10000
{
    "id": "{{id}}"
}
# ------------------------------------