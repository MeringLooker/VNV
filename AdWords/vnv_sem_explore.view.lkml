include: "/AdWords/**/*.view"
include: "/Google_Analytics/**/*.view"

explore: vnv_sem {
  hidden: yes
  view_name: vnv_sem_view
  label: "AdWords Search"
  view_label: "AdWords Search"
  group_label: "Visit Napa Valley"

  join: vnv_ga_onsite {
    view_label: "Google Analytics"
    fields: []
    type:left_outer
    sql_on: ${vnv_ga_onsite.adwords_join_id} = ${vnv_sem_view.join_id_onsite} ;;
    relationship: many_to_one
  }
#
#   join: vnv_ga_userinfo {
#     view_label: "Google Analytics - User Info"
#     type: left_outer
#     sql_on: ${vnv_ga_onsite.adwords_join_id} = ${vnv_sem_gdn_view.join_id} ;;
#     relationship: many_to_one
#   }
#
#   join: vnv_ga_pageinfo {
#     view_label: "Google Analytics - Page Info"
#     type: inner
#     sql_on: ${vnv_ga_onsite.adwords_join_id} = ${vnv_sem_gdn_view.join_id} ;;
#     relationship: many_to_one
#   }
#
#   join: vnv_ga_events {
#     view_label: "Google Analytics - Events"
#     type: inner
#     sql_on: ${vnv_ga_onsite.adwords_join_id} = ${vnv_sem_gdn_view.join_id} ;;
#     relationship: many_to_one
#   }
#
#   join: vnv_ga_goals {
#     view_label: "Google Analytics - Goals"
#     type: inner
#     sql_on: ${vnv_ga_onsite.adwords_join_id} = ${vnv_sem_gdn_view.join_id} ;;
#     relationship: many_to_one
#   }


}
