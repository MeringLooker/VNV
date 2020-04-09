connection: "mc_panoply"

include: "/TrueView/**/*.view"
include: "/Google_Analytics/**/*.view"

explore: vnv_trueview_extended {
  extends: [vnv_trueview]
  hidden: no
}

explore: vnv_yt_extended {
  extends: [vnv_yt]
  hidden: yes
  label: "YouTube"
  view_label: "YouTube"
  group_label: "San Diego Tourism"
}
