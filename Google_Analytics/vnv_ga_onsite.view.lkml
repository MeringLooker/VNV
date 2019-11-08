view: vnv_ga_onsite {
  sql_table_name: public.vnv_ga_onsite ;;
  drill_fields: [id]

####### Primary Key #########

  dimension: id {
    primary_key: yes
    hidden: yes
    type: string
    sql: ${TABLE}.id ;;
  }

######### Join Id ##########

  dimension: join_id {
    type: string
    hidden: yes
    sql: ${keyword}||'_'||${date_date} ;;
  }

####### AdWords Join ID #######

  dimension: adwords_join_id {
    type: string
    hidden: yes
    sql: ${adwordsadgroupid}||'_'||${date_date} ;;
  }

####### Dimensions go Below ########

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

  dimension: adwordsadgroupid {
    type: number
    hidden: yes
    value_format_name: id
    sql: ${TABLE}.adwordsadgroupid ;;
  }

  dimension: bounces {
    type: number
    hidden: yes
    sql: ${TABLE}.bounces ;;
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

  dimension: keyword {
    type: string
    hidden: yes
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
    hidden: yes
    sql: ${TABLE}.sourcemedium ;;
  }

  dimension: users {
    type: number
    hidden: yes
    sql: ${TABLE}.users ;;
  }

######### All measures go below #########

  measure: total_sessions {
    label: "Sessions"
    type: sum_distinct
    sql_distinct_key: ${TABLE}.id ;;
    sql: ${TABLE}.sessions ;;
  }

  measure: total_session_duration {
    label: "Total Time on Site"
    hidden: yes
    type: sum_distinct
    sql_distinct_key: ${TABLE}.id ;;
    sql: ${TABLE}.sessionduration ;;
  }

  measure: avg_time_on_site {
    label: "Avg. TOS"
    description: "Average Length of a User's session"
    type: number
    sql: (${total_session_duration}/nullif(${total_sessions}, 0))::float/86400;;
    value_format: "m:ss"
  }

  measure: total_users {
    label: "Users"
    type: sum_distinct
    sql_distinct_key: ${TABLE}.id ;;
    sql: ${TABLE}.users ;;
  }

  measure: new_users {
    label: "New Users"
    type: sum_distinct
    sql_distinct_key: ${TABLE}.id ;;
    sql: ${TABLE}.newusers ;;
  }

  measure: percent_new_users {
    label: "% New Users"
    type: number
    sql: ${new_users}/nullif(${total_users}, 0) ;;
    value_format_name: percent_0
  }

  measure: total_pageviews {
    label: "Pageviews"
    type: sum_distinct
    sql_distinct_key: ${TABLE}.id ;;
    sql: ${TABLE}.pageviews ;;
  }

  measure: pages_per_session {
    label: "Pgs/Session"
    type: number
    sql: ${total_pageviews}/nullif(${total_sessions}, 0) ;;
    value_format: "#.0"
  }

  measure: total_bounces {
    label: "Bounces"
    type: sum_distinct
    sql_distinct_key: ${TABLE}.id ;;
    sql: ${TABLE}.bounces ;;
  }

  measure: bounce_rate {
    label: "Bounce Rate"
    type: number
    sql: ${total_bounces}/nullif(${total_sessions}, 0) ;;
    value_format_name: percent_0
  }

  measure: count {
    type: count
    drill_fields: [id]
  }
}
