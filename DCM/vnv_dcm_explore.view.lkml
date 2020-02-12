include: "/DCM/**/*.view"
include: "/Google_Analytics/**/*.view"


explore: vnv_dcm {
  view_name: vnv_dcm_view
  hidden: yes
  label: "DoubleClick"
  view_label: "DoubleClick"
  group_label: "Visit Napa Valley"

  join: vnv_ga_onsite {
    view_label: "Google Analytics"
    type: left_outer
    fields: []
    sql_on: ${vnv_dcm_view.comp_key} = ${vnv_ga_onsite.join_id} ;;
    relationship: many_to_one
  }
}
