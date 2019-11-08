view: vnv_ga_goals {
  sql_table_name: public.vnv_ga_goals ;;
  drill_fields: [id]

######## Primary Key ########

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
    sql: ${TABLE}.__sampled ;;
  }

  dimension_group: __senttime {
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
    value_format_name: id
    sql: ${TABLE}.adwordsadgroupid ;;
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

  dimension: goal1completions {
    type: number
    label: "Download of V Guide"
    hidden: yes
    sql: ${TABLE}.goal1completions ;;
  }

  dimension: goal2completions {
    type: number
    label: "Guide Hard Copy Referrals"
    hidden: yes
    sql: ${TABLE}.goal2completions ;;
  }

  dimension: goal3completions {
    type: number
    label: "View Guide Online"
    hidden: yes
    sql: ${TABLE}.goal3completions ;;
  }

  dimension: goal4completions {
    type: number
    label: "E-Newsletter Sign-Up"
    hidden: yes
    sql: ${TABLE}.goal4completions ;;
  }

  dimension: goal5completions {
    type: number
    label: "Partner Referral"
    hidden: yes
    sql: ${TABLE}.goal5completions ;;
  }

  dimension: goal6completions {
    type: number
    label: "Guide Hard Copy Sign-Up"
    hidden: yes
    sql: ${TABLE}.goal6completions ;;
  }

  dimension: goal7completions {
    type: number
    label: "Concerige Form Submissions"
    hidden: yes
    sql: ${TABLE}.goal7completions ;;
  }

  dimension: keyword {
    type: string
    sql: ${TABLE}.keyword ;;
  }

  dimension: sourcemedium {
    type: string
    sql: ${TABLE}.sourcemedium ;;
  }

######### All measures go below #########

  measure: total_goal1completions {
    label: "V Guide Downloads"
    type: sum_distinct
    sql_distinct_key: ${TABLE}.id ;;
    sql: ${TABLE}.goal1completions ;;
  }

  measure: total_goal2completions {
    label: "Guide Hard Copy Referrals"
    type: sum_distinct
    sql_distinct_key: ${TABLE}.id ;;
    sql: ${TABLE}.goal2completions ;;
  }

  measure: total_goal3completions {
    label: "View Guide Online"
    type: sum_distinct
    sql_distinct_key: ${TABLE}.id ;;
    sql: ${TABLE}.goal3completions ;;
  }

  measure: total_goal4completions {
    label: "E-Newsletter Sign-Up"
    type: sum_distinct
    sql_distinct_key: ${TABLE}.id ;;
    sql: ${TABLE}.goal4completions ;;
  }

  measure: total_goal5completions {
    label: "Partner Referral"
    type: sum_distinct
    sql_distinct_key: ${TABLE}.id ;;
    sql: ${TABLE}.goal5completions ;;
  }

  measure: total_goal6completions {
    label: "Guide Hard Copy Sign-Up"
    type: sum_distinct
    sql_distinct_key: ${TABLE}.id ;;
    sql: ${TABLE}.goal6completions ;;
  }

  measure: total_goal7completions {
    label: "Concerige Form Submissions"
    type: sum_distinct
    sql_distinct_key: ${TABLE}.id ;;
    sql: ${TABLE}.goal7completions ;;
  }

  measure: count {
    type: count
    drill_fields: [id]
  }
}
