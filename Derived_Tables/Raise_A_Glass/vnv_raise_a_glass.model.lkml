connection: "mc_panoply"

# include: "*.view.lkml"
# include: "/AdWords/*.view"
# include: "/DCM/*.view"
# include: "/TrueView/*.view"
# include: "/Facebook/**/*.view"
# include: "/Google_Analytics/*.view"

# datagroup: vnv_raise_a_glass {
#   sql_trigger: SELECT current_date;;
#   max_cache_age: "24 hours"
# }

# explore: pdt_raise_a_glass_campaign {
#   #persist_with: vca_dream365_datagroup
#   label: "FY21 Raise A Glass"
#   view_label: "Raise A Glass"
#   group_label: "Visit Napa Valley"
# #   hidden: yes
# }
