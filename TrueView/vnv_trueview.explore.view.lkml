include: "/Google_Analytics/**/*.view"
include: "/TrueView/**/*.view"

###### Exploring TrueView Data #######

explore: vnv_trueview {
  view_name: vnv_us_trueview
  label: "YouTube"
  hidden: yes
  group_label: "Visit Napa Valley"
  view_label: "YouTube"
}

explore: vnv_yt {
  view_name: vnv_quartiles_yt_view
  label: "YouTube (Quartiles)"
  view_label: "YouTube"
  group_label: "Visit Napa Valley"
  hidden: no
}
