export HURL_NOW=$(date '+%y%m%d%h%s')
hurl --test --variables-file vars.env --retry --retry-interval 30000 --retry-max-count 4 --json analytics_social.hurl user.hurl post_flow_fb.hurl post_flow_ig.hurl post_flow_li.hurl post_flow_pi.hurl post_flow_tw.hurl history.hurl history_get_all.hurl generate_jwt.hurl createProfile.hurl short.hurl autoschedule.hurl
