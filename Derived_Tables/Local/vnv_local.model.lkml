connection: "mc_panoply"

include: "*.view.lkml"
include: "/DCM/*.view"
include: "/Facebook/**/*.view"
include: "/Google_Analytics/*.view"

datagroup: vnv_local_datagroup {
  sql_trigger: SELECT current_date;;
  max_cache_age: "24 hours"
}

explore: pdt_local_campaign {
  #persist_with: vca_dream365_datagroup
  label: "FY20 Local"
  view_label: "Local"
  group_label: "Visit Napa Valley"
  hidden: yes
}
