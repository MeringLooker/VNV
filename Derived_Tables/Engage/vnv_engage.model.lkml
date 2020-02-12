connection: "mc_panoply"

include: "*.view.lkml"
include: "/DCM/*.view"
include: "/Google_Analytics/*.view"

datagroup: vnv_engage_datagroup {
  sql_trigger: SELECT current_date;;
  max_cache_age: "24 hours"
}

explore: pdt_engage_campaign {
  #persist_with: vca_dream365_datagroup
  label: "Engage"
  view_label: "Engage"
  group_label: "Visit Napa Valley"
  hidden: yes
}

explore: pdt_engage_adara {
  #persist_with: vca_dream365_datagroup
  label: "adara"
  view_label: "Engage"
  group_label: "Visit Napa Valley"
  hidden: yes
}

explore: test_pdt_adara {
  #persist_with: vca_dream365_datagroup
  label: "adara test"
  view_label: "Engage"
  group_label: "Visit Napa Valley"
  hidden: yes
}
