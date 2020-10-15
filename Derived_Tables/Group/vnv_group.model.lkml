connection: "mc_panoply"

# include: "*.view.lkml"
# include: "/AdWords/*.view"
# include: "/DCM/*.view"
# include: "/LinkedIn/*.view"
# include: "/Google_Analytics/*.view"

# datagroup: vnv_group_datagroup {
#   sql_trigger: SELECT current_date;;
#   max_cache_age: "24 hours"
# }

# explore: pdt_group_campaign {
#   #persist_with: vca_dream365_datagroup
#   label: "FY20 Group"
#   view_label: "Group"
#   group_label: "Visit Napa Valley"
#   hidden: yes
# }
