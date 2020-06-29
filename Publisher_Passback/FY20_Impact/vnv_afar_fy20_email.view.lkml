view: vnv_afar_fy20_email {
  sql_table_name: public.vnv_afar_fy20_email ;;
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
    sql:
      case
        when ${placement} ilike '%newsletter%' then 'Newsletter'
        when ${placement} ilike '%eblast%' then 'E-Blast'
        else 'Uncategorized'
        end;;
  }
  ### Dimensions Native to This Table ###

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

  dimension: banner_clicks {
    type: number
    sql: ${TABLE}.banner_clicks ;;
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

  dimension: delivered {
    type: number
    sql: ${TABLE}.delivered ;;
  }

  dimension: opens {
    type: number
    sql: ${TABLE}.opens ;;
  }

  dimension: partner_post_clicks {
    type: number
    sql: ${TABLE}.partner_post_clicks ;;
  }

  dimension: placement {
    type: string
    sql: ${TABLE}.placement ;;
  }

  dimension: publisher {
    type: string
    sql: ${TABLE}.publisher ;;
  }

  dimension: spend {
    type: number
    sql: ${TABLE}.spend ;;
  }

  #### Measures Go Below ####

  measure: total_impressions {
    type: sum
    sql: ${delivered} ;;
  }

  measure: total_clicks {
    type: sum
    sql: ${banner_clicks} + ${partner_post_clicks} ;;
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
