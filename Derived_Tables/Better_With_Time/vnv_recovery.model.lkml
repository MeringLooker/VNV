connection: "mc_panoply"

include: "*.view.lkml"
include: "/AdWords/*.view"
include: "/TrueView/*.view"
include: "/Facebook/**/*.view"
include: "/Google_Analytics/*.view"

datagroup: vnv_better_with_time_datagroup {
  sql_trigger: SELECT current_date;;
  max_cache_age: "24 hours"
}

explore: pdt_recovery_campaign {
  #persist_with: vca_dream365_datagroup
  label: "FY21 Better With Time"
  view_label: "Better With Time"
  group_label: "Visit Napa Valley"
#   hidden: yes
}
