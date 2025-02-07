# /resize -----------------
POST {{BASE_URL}}/media/resize
Content-Type: application/json
Authorization: Bearer {{API_KEY}}
{
    "mediaUrl": "https://i.ytimg.com/vi/G8M6DZdtcMc/maxresdefault.jpg",
    "platform": "instagram"
}

HTTP 200
[Asserts]
header "Content-Type" == "application/json; charset=utf-8"
jsonpath "$.status" == "success"
jsonpath "$.url" matches /https:\/\/media.ayrshare.com\/[\w]*\/[\w|-]*.jpg/
jsonpath "$.platform" == "instagram" 
# -----------------------

# /resize with watermark, blur, dimensions-----------------
POST {{BASE_URL}}/media/resize
Content-Type: application/json
Authorization: Bearer {{API_KEY}}
{
    "mediaUrl": "https://i.ytimg.com/vi/G8M6DZdtcMc/maxresdefault.jpg",
    "watermarkUrl": "https://www.ayrshare.com/wp-content/uploads/ayrshare-purple-icon.jpg",
    "effects": { "blur": true, "color": "#000000" },
    "dimensions": { "width": 100, "height": 100 }
}

HTTP 200
[Asserts]
header "Content-Type" == "application/json; charset=utf-8"
jsonpath "$.status" == "success"
jsonpath "$.url" matches /https:\/\/media.ayrshare.com\/[\w]*\/[\w|-]*.jpg/
# -----------------------