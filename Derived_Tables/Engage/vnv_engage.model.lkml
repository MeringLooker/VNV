connection: "mc_panoply"

# include: "*.view.lkml"
# include: "/DCM/*.view"
# include: "/Google_Analytics/*.view"

# datagroup: vnv_engage_datagroup {
#   sql_trigger: SELECT current_date;;
#   max_cache_age: "24 hours"
# }

# explore: pdt_engage_campaign {
#   #persist_with: vca_dream365_datagroup
#   label: "FY20 Engage"
#   view_label: "Engage"
#   group_label: "Visit Napa Valley"
#   hidden: yes
# }
