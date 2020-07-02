connection: "mc_panoply"

include: "*.view.lkml"
include: "/AdWords/*.view"
include: "/TrueView/*.view"
include: "/Facebook/**/*.view"
include: "/Google_Analytics/*.view"

datagroup: vnv_recovery_datagroup {
  sql_trigger: SELECT current_date;;
  max_cache_age: "24 hours"
}

explore: pdt_recovery_campaign {
  #persist_with: vca_dream365_datagroup
  label: "FY21 Recovery"
  view_label: "Recovery"
  group_label: "Visit Napa Valley"
#   hidden: yes
}
