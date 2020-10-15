connection: "mc_panoply"

# include: "*.view.lkml"
# include: "/DCM/*.view"
# include: "/Facebook/*.view"
# include: "/AdWords/*.view"
# include: "/Publisher_Passback/*/*.view"
# include: "/Google_Analytics/*.view"

# datagroup: vnv_impact_datagroup {
#   sql_trigger: SELECT current_date;;
#   max_cache_age: "24 hours"
# }

# explore: pdt_impact_campaign {
#   label: "FY20 Impact"
#   view_label: "Impact"
#   group_label: "Visit Napa Valley"
#   hidden: yes
# }
