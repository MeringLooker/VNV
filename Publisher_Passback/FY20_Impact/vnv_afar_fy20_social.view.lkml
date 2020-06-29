view: vnv_afar_fy20_social {
  sql_table_name: public.vnv_afar_fy20_social ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: string
    sql: ${TABLE}.id ;;
  }

  ### Dimensions added to this able via LookML ###

  dimension: vnv_campaign {
    type: string
    sql: 'Impact' ;;
  }

  dimension: vnv_placement {
    type: string
    sql: ${TABLE}.placement ;;
  }

  dimension: creative_name {
    type: string
    sql: ${TABLE}.placement ;;
  }

  dimension: ad_size {
    type: string
    sql: 'Social Post' ;;
  }

### Dimensions Native to this Table ###

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

  dimension: __state {
    type: string
    sql: ${TABLE}.__state ;;
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

  dimension: engagements {
    type: number
    sql: ${TABLE}.engagements ;;
  }

  dimension: placement {
    type: string
    sql: ${TABLE}.placement ;;
  }

  dimension: publisher {
    type: string
    sql: ${TABLE}.publisher ;;
  }

  dimension: reach {
    type: number
    sql: ${TABLE}.reach ;;
  }

  dimension: spend {
    type: number
    sql: ${TABLE}.spend ;;
  }

  #### Measures Go Below ####

  measure: total_impressions {
    type: sum
    sql: ${reach} ;;
  }

  measure: total_clicks {
    type: sum
    sql: ${engagements} ;;
  }

  measure: total_spend {
    type: sum
    sql: ${spend} ;;
  }

  measure: total_views {
    type: sum
    sql: 0 ;;
  }

  measure: total_completes {
    type: sum
    sql: 0 ;;
  }

  measure: total_sessions {
    type: sum
    sql: 0 ;;
  }

  measure: total_session_duration {
    type: sum
    sql: 0 ;;
  }

  measure: count {
    type: count
    drill_fields: [id]
  }
}
