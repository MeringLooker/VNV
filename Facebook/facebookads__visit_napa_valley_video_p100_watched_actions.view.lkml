view: facebookads__visit_napa_valley_video_p100_watched_actions {
  sql_table_name: public."facebookads__visit napa valley_video_p100_watched_actions" ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: string
    sql: ${TABLE}.id ;;
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

  dimension: action_type {
    type: string
    sql: ${TABLE}.action_type ;;
  }

  dimension: facebookads__visit_napa_valley_id {
    type: string
    # hidden: yes
    sql: ${TABLE}."facebookads__visit napa valley_id" ;;
  }

  dimension: value {
    type: number
    sql: ${TABLE}.value ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
      id,
      facebookads__visit_napa_valley.account_name,
      facebookads__visit_napa_valley.ad_name,
      facebookads__visit_napa_valley.adset_name,
      facebookads__visit_napa_valley.campaign_name,
      facebookads__visit_napa_valley.id
    ]
  }
}
