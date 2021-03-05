include: "/DCM/**/*.view"
include: "/Publisher_Passback/**/*.view"
include: "/Google_Analytics/**/*.view"


explore: vnv_dcm {
  view_name: vnv_dcm_ga_view
  hidden: yes
  label: "DoubleClick"
  view_label: "DoubleClick"
  group_label: "Visit Napa Valley"

  join: vnv_fy20_engage_dcm_view {
    view_label: "FY20 Engage Passback"
    type: inner
    sql_on: ${vnv_dcm_ga_view.passback_join} = ${vnv_fy20_engage_dcm_view.passback_join} ;;
    relationship: many_to_one
  }

  join: vnv_fy20_impact_dcm_view {
    view_label: "FY20 Impact Passback"
    type: inner
    sql_on: ${vnv_dcm_ga_view.passback_join} = ${vnv_fy20_impact_dcm_view.passback_join} ;;
    relationship: many_to_one
  }

  join: vnv_fy20_local_viant {
    view_label: "FY20 Local Passback"
    type: inner
    sql_on: ${vnv_dcm_ga_view.passback_join_ad} = ${vnv_fy20_local_viant.passback_join_ad} ;;
    relationship: many_to_one
  }

  join: vnv_fy20_impact_wsj {
    view_label: "FY20 WSJ Passback"
    type: inner
    sql_on: ${vnv_dcm_ga_view.passback_join} = ${vnv_fy20_impact_wsj.passback_join} ;;
    relationship: many_to_one
  }

  join: vnv_fy20_group_viant {
    view_label: "FY20 Group Passback"
    type: inner
    sql_on: ${vnv_dcm_ga_view.passback_join_ad} = ${vnv_fy20_group_viant.passback_join_ad} ;;
    relationship: many_to_one
  }

  join: vnv_fy21_rag_2_adtheorant_dcm {
    view_label: "FY21 RAG 2.0 Passback"
    type: inner
    sql_on: ${vnv_dcm_ga_view.passback_join_ad} = ${vnv_fy21_rag_2_adtheorant_dcm.dcm_join_id} ;;
    relationship: many_to_one
  }
}
