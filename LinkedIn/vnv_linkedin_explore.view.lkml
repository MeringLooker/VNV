include: "/LinkedIn/**/*.view"
include: "/Google_Analytics/**/*.view"

explore: vnv_linkedin  {
  view_name: vnv_linkedin_campaign
  hidden: yes
  label: "LinkedIn"
  group_label: "Visit Napa Valley"
  view_label: "LinkedIn"

#   join: vnv_ga_onsite {
#     view_label: "Google Analytics"
#     type: left_outer
#     fields: []
#     sql_on: ${vnv_dcm_view.comp_key} = ${vnv_ga_onsite.join_id} ;;
#     relationship: many_to_one
#   }
}
