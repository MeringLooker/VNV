include: "/Pinterest/**/*.view"
include: "/Google_Analytics/**/*.view"

explore: vnv_pinterest_ads {
  view_name: vnv_pinterest
  hidden: yes
  label: "Pinterest"
  view_label: "Pinterest"
  group_label: "Visit Napa Valley"

  join: vnv_ga_onsite {
    view_label: "Google Analytics"
    type: left_outer
    fields: []
    sql_on: ${vnv_pinterest.pinterest_ga_join} = ${vnv_ga_onsite.join_id} ;;
    relationship: one_to_many
  }
}
