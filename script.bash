export HURL_NOW=$(date '+%y%m%d%h%s')
hurl --test --very-verbose --variables-file vars.env messages.hurl
#resize.hurl
#post_flow_fb.hurl post_flow_ig.hurl post_flow_li.hurl post_flow_pi.hurl post_flow_tw.hurl
#profile.hurl
#analytics_social.hurl user.hurl post_flow_fb.hurl post_flow_ig.hurl post_flow_li.hurl post_flow_pi.hurl post_flow_tw.hurl history.hurl history_get_all.hurl generate_jwt.hurl autoschedule.hurl links.hurl resize.hurl feed.hurl hook.hurl profile.hurl autohashtag.hurl
