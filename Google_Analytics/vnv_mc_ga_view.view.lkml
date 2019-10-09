view: vnv_mc_ga_view {
  sql_table_name: public.vnv_mc_ga_view ;;
  drill_fields: [id]

####### All Dimensions go below ########

  dimension: id {
    primary_key: yes
    hidden: yes
    type: string
    sql: ${TABLE}.id ;;
  }

  dimension: __sampled {
    type: yesno
    hidden: yes
    sql: ${TABLE}.__sampled ;;
  }

  dimension_group: __senttime {
    type: time
    hidden: yes
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.__senttime ;;
  }

  dimension_group: __updatetime {
    type: time
    hidden: yes
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.__updatetime ;;
  }

  dimension: adcontent {
    type: string
    sql: ${TABLE}.adcontent ;;
  }

  dimension: campaign {
    type: string
    sql: ${TABLE}.campaign ;;
  }

  dimension: comp_key {
    type: string
    hidden: yes
    sql: ${TABLE}.comp_key ;;
  }

  dimension: comp_key_backup {
    type: string
    hidden: yes
    sql: ${TABLE}.comp_key_backup ;;
  }

  dimension_group: date {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.date ;;
  }

  dimension: devicecategory {
    type: string
    sql: ${TABLE}.devicecategory ;;
  }

  dimension: goal3completions {
    type: number
    hidden: yes
    sql: ${TABLE}.goal3completions ;;
  }

  dimension: goal5completions {
    type: number
    hidden: yes
    sql: ${TABLE}.goal5completions ;;
  }

  dimension: goal7completions {
    type: number
    hidden: yes
    sql: ${TABLE}.goal7completions ;;
  }

  dimension: keyword {
    type: string
    sql: ${TABLE}.keyword ;;
  }

  dimension: newusers {
    type: number
    hidden: yes
    sql: ${TABLE}.newusers ;;
  }

  dimension: pageviews {
    type: number
    hidden: yes
    sql: ${TABLE}.pageviews ;;
  }

  dimension: region {
    type: string
    sql: ${TABLE}.region ;;
  }

  dimension: sessionduration {
    type: number
    hidden: yes
    sql: ${TABLE}.sessionduration ;;
  }

  dimension: sessions {
    type: number
    hidden: yes
    sql: ${TABLE}.sessions ;;
  }

  dimension: sourcemedium {
    type: string
    sql: ${TABLE}.sourcemedium ;;
  }

  dimension: users {
    type: number
    hidden: yes
    sql: ${TABLE}.users ;;
  }

######## All measures go below #######

  measure: total_sessions {
    label: "Sessions"
    type: sum
    sql: ${sessions} ;;
  }

  measure: total_session_duration {
    label: "Total Time on Site"
    hidden: yes
    type: sum
    sql: ${sessionduration} ;;
  }

  measure: avg_time_on_site {
    label: "Avg. TOS - Unformatted"
    hidden: yes
    description: "Average Length of a User's session"
    type: number
    sql: ${total_session_duration}/nullif(${total_sessions}, 0);;
    value_format: "0.##"
  }

  measure: formatted_tos {
    label: "Avg. TOS"
    type: number
    sql:  ${avg_time_on_site}::float/86400 ;;
    value_format: "m:ss"
  }

  measure: total_users {
    label: "Users"
    type: sum
    sql: ${users} ;;
  }

  measure: new_users {
    label: "New Users"
    type: sum
    sql: ${newusers} ;;
  }

  measure: percent_new_users {
    label: "% New Users"
    type: number
    sql: ${new_users}/nullif(${total_users}, 0) ;;
    value_format_name: percent_0
  }

  measure: total_pageviews {
    label: "Pageviews"
    type: sum
    sql: ${pageviews} ;;
  }

  measure: pages_per_session {
    label: "Pgs/Session"
    type: number
    sql: ${total_pageviews}/nullif(${total_sessions}, 0) ;;
    value_format: "#.0"
  }

  measure: view_guide_online {
    type: sum
    label: "Goal: View Guide Online"
    sql: ${TABLE}.goal3completions ;;
  }

  measure: partner_referrals {
    type: sum
   label: "Goal: Partner Referrals"
    sql: ${TABLE}.goal5completions ;;
  }

  measure: concierge_form_submits {
    type: sum
    label: "Goal: Concierge Form Submits"
    sql: ${TABLE}.goal7completions ;;
  }

  measure: count {
    type: count
    drill_fields: [id]
  }
}
