view: vnv_linkedin_campaign_pivotvalues {
  sql_table_name: public.vnv_linkedin_campaign_pivotvalues ;;
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

  dimension: value {
    type: string
    sql: ${TABLE}.value ;;
  }

  dimension: vnv_linkedin_campaign_id {
    type: string
    # hidden: yes
    sql: ${TABLE}.vnv_linkedin_campaign_id ;;
  }

  measure: count {
    type: count
    drill_fields: [id, vnv_linkedin_campaign.pivot_value_name, vnv_linkedin_campaign.id]
  }
}
