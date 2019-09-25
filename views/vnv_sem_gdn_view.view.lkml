view: vnv_sem_gdn_view {
  sql_table_name: public.vnv_sem_gdn_view ;;
  drill_fields: [id]

  dimension: id {
    hidden: yes
    primary_key: yes
    type: string
    sql: ${TABLE}.id ;;
  }

  dimension_group: __senttime {
    hidden: yes
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
    hidden: yes
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

  dimension: account {
    type: string
    sql: ${TABLE}.account ;;
  }

  dimension: advertising_channel {
    type: string
    label: "Channel"
    sql:
      CASE
        WHEN ${account} ILIKE '%GDN' THEN 'Display'
        WHEN ${account} ILIKE '%SEM' THEN 'Search'
        ELSE 'Uncategorized'
        END
    ;;
  }

  dimension: vnv_objective {
    type: string
    label: "VNV Objective"
    sql:
      CASE
        WHEN ${account} ILIKE '%foundational%' THEN 'Foundational'
        WHEN ${account} ILIKE '%group%' THEN 'Group'
        ELSE 'Uncategorized'
        END;;
  }

  dimension: search_campaign {
    type: string
    label: "Search Campaign"
    sql:
      CASE
        WHEN ${campaign} ILIKE '%wine%' THEN 'Wine'
        WHEN ${campaign} ILIKE '%brand%' THEN 'Brand'
        WHEN ${campaign} ILIKE '%wellness%' THEN 'Wellness'
        WHEN ${campaign} ILIKE '%travel%' THEN 'Travel'
        WHEN ${campaign} ILIKE '%stay%' THEN 'Stay'
        WHEN ${campaign} ILIKE '%family%' THEN 'Family'
        WHEN ${campaign} ILIKE '%events%' THEN 'Events'
        WHEN ${campaign} ILIKE '%dining%' THEN 'Dining'
        WHEN ${campaign} ILIKE '%attractions%' THEN 'Attractions'
        WHEN ${campaign} ILIKE '%art%' THEN 'Art'
        else 'Uncategorized'
        END;;
  }

  dimension: ad_group {
    type: string
    sql: ${TABLE}."ad group" ;;
  }

  dimension: ad_group_id {
    hidden: yes
    type: number
    sql: ${TABLE}."ad group id" ;;
  }

  dimension: ad_group_state {
    hidden: yes
    type: string
    sql: ${TABLE}."ad group state" ;;
  }

  dimension: avg__position {
    hidden: yes
    type: number
    sql: ${TABLE}."avg. position" ;;
  }

  dimension: campaign {
    type: string
    sql: ${TABLE}.campaign ;;
  }

  dimension: campaign_id {
    hidden: yes
    type: number
    sql: ${TABLE}."campaign id" ;;
  }

  dimension: campaign_state {
    hidden: yes
    type: string
    sql: ${TABLE}."campaign state" ;;
  }

  dimension: clicks {
    hidden: yes
    type: number
    sql: ${TABLE}.clicks ;;
  }

  dimension: comp_key {
    hidden: yes
    type: string
    sql: ${TABLE}.comp_key ;;
  }

  dimension: conversions {
    hidden: yes
    type: number
    sql: ${TABLE}.conversions ;;
  }

  dimension: cost {
    hidden: yes
    type: number
    sql: ${TABLE}.cost ;;
  }

  dimension_group: day {
    label: "Date"
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
    sql: ${TABLE}.day ;;
  }

  dimension: device {
    hidden: yes
    type: string
    sql: ${TABLE}.device ;;
  }

  dimension: device_formatted {
    label: "Device"
    type: string
    sql: ${TABLE}.device_formatted ;;
  }

  dimension: impressions {
    hidden: yes
    type: number
    sql: ${TABLE}.impressions ;;
  }

  dimension: reportname {
    hidden: yes
    type: string
    sql: ${TABLE}.reportname ;;
  }

  dimension: search_impr__share {
    hidden: yes
    type: string
    sql: ${TABLE}."search impr. share" ;;
  }

  dimension: search_lost_is_rank {
    hidden: yes
    type: string
    sql: ${TABLE}."search lost is (rank)" ;;
  }

  dimension: total_conv__value {
    hidden: yes
    type: number
    sql: ${TABLE}."total conv. value" ;;
  }

  measure: count {
    type: count
    drill_fields: [id, reportname]
  }

  measure: total_impressions {
    label: "Impressions"
    type: sum
    sql: ${impressions} ;;
  }

  measure: total_clicks {
    label: "Clicks"
    type: sum
    sql: ${clicks} ;;
  }

  measure: total_cost {
    label: "Cost"
    type:  sum
    sql: ${cost}/1000000.00 ;;
    value_format_name: usd
  }

  measure: total_conversions {
    label: "Conversions"
    type:  sum
    sql: ${conversions} ;;
  }

  measure: click_through_rate {
    label: "CTR"
    type: number
    description: "Clickthrough Rate"
    sql: 1.0*${total_clicks}/nullif(${total_impressions}, 0) ;;
    value_format_name: percent_2
  }

  measure: cost_per_click {
    label: "CPC"
    type: number
    description: "Cost per click"
    sql: ${total_cost}/nullif(${total_clicks}, 0) ;;
    value_format_name: usd
  }

  measure: cost_per_thousand {
    label: "CPM"
    type: number
    description: "Cost per Thousand Impressions"
    sql: 1.0*${total_cost}/nullif(${total_impressions}/1000, 0) ;;
    value_format_name: usd
  }

  measure: total_sessions {
    label: "Sessions"
    type: sum
    sql: ${vnv_ga_adwords_view.sessions} ;;
  }

  measure: cost_per_session {
    label: "CPS"
    type: number
    description: "Cost per Session"
    sql: 1.0*${total_cost}/nullif(${vnv_ga_adwords_view.total_sessions}, 0) ;;
    value_format_name: usd
  }

  measure: cost_per_conversion {
    label: "CPA"
    type: number
    description: "Cost per Conversion"
    sql: 1.0*${total_cost}/nullif(${total_conversions}, 0) ;;
    value_format_name: usd
  }

  measure: total_conversion_rate {
    label: "CVR"
    type: number
    description: "Conversion Rate"
    sql: 1.0*${total_conversions}/nullif(${total_clicks}, 0) ;;
    value_format_name: percent_2
  }

}
