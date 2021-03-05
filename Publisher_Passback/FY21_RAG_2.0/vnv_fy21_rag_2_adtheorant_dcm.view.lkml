view: vnv_fy21_rag_2_adtheorant_dcm {
  sql_table_name: public.vnv_fy21_rag_2_adtheorant_dcm ;;

  ## Primary Key ##

  dimension: dcm_join_id {
    type: string
    hidden: yes
    primary_key: yes
    sql: ${TABLE}.dcm_join_id ;;
  }

  ## Dimensions Below ##

  dimension: ad_id {
    type: number
    sql: ${TABLE}.ad_id ;;
  }

  dimension: clicks {
    hidden: yes
    type: number
    sql: ${TABLE}.clicks ;;
  }

  dimension: completes {
    hidden: yes
    type: number
    sql: ${TABLE}.completes ;;
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

  dimension: impressions {
    hidden: yes
    type: number
    sql: ${TABLE}.impressions ;;
  }

  dimension: spend {
    hidden: yes
    type: number
    sql: ${TABLE}.spend ;;
  }

  dimension: views {
    hidden: yes
    type: number
    sql: ${TABLE}.views ;;
  }

  ## Measures Below ##

  measure: total_impressions {
    type: sum
    sql: ${impressions} ;;
  }

  measure: total_clicks {
    type: sum
    sql: ${clicks} ;;
  }

  measure: total_spend {
    type: sum
    value_format_name: usd
    sql: ${spend} ;;
  }

  measure: total_views {
    type: sum
    sql: ${views} ;;
  }

  measure: total_completes {
    type: sum
    sql: ${completes} ;;
  }

  measure: count {
    hidden: yes
    type: count
    drill_fields: []
  }
}
