# Ayrshare Social API Hurl Scripts

Test Ayrshare's social media APIs using HURL scripts. Including testing posting images, videos, and getting analytics. 

Learn more about [how to run Hurl scripts](https://www.ayrshare.com/hurl-run-and-test-http-api-requests/).

## Run Commands

- `hurl --test --very-verbose --variables-file vars-dev.env analytics_social.hurl post_flow.hurl user.hurl`
- `hurl --test --variables-file vars-dev.env analytics_social.hurl post_flow.hurl user.hurl`
- `hurl --test --interactive --variables-file vars-prod.env post_video_flow.hurl`

## Quick Run Scripts

- `script.bash`

## Convert Private.key to Base64

`cat private.key | base64`

## Hurl Website

[Hurl Website](https://hurl.dev/)
