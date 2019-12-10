view: vnv_sem_gdn_view {
  sql_table_name: public.vnv_sem_gdn_view ;;
  drill_fields: [id]

######### Primary Key ########

  dimension: id {
    hidden: yes
    primary_key: yes
    type: string
    sql: ${TABLE}.id ;;
  }

######### Adwords Join ID #######

  dimension: join_id {
    hidden: yes
    type: string
    sql: ${ad_group_id}||'_'||${day_date} ;;
  }

######### Adwords Comp_Key ID #######

  dimension: comp_key {
    hidden: yes
    type: string
    sql: ${TABLE}.comp_key ;;
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
    group_label: "AdWords Dimensions"
    sql: ${TABLE}.account ;;
  }

  dimension: advertising_channel {
    type: string
    label: "Channel"
    group_label: "AdWords Dimensions"
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
    group_label: "Client Dimensions"
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
    group_label: "Client Dimensions"
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
    group_label: "AdWords Dimensions"
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
    group_label: "AdWords Dimensions"
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
    group_label: "Date Periods"
    label: ""
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

  dimension: fiscal_year {
    label: "Fiscal"
    type: string
    group_label: "Client Dimensions"
    sql:
      CASE
        WHEN ${day_date} BETWEEN '2015-07-01' AND '2016-06-30' THEN 'FY 15/16'
        WHEN ${day_date} BETWEEN '2016-07-01' AND '2017-06-30' THEN 'FY 16/17'
        WHEN ${day_date} BETWEEN '2017-07-01' AND '2018-06-30' THEN 'FY 17/18'
        WHEN ${day_date} BETWEEN '2018-07-01' AND '2019-06-30' THEN 'FY 18/19'
        WHEN ${day_date} BETWEEN '2019-07-01' AND '2020-06-30' THEN 'FY 19/20'
        ELSE 'Uncategorized'
        END
        ;;
  }

  dimension: device {
    hidden: yes
    type: string
    sql: ${TABLE}.device ;;
  }

  dimension: device_formatted {
    label: "Device"
    group_label: "AdWords Dimensions"
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

############ All measures go below ############

  measure: total_impressions {
    label: "Impressions"
    group_label: "AdWords Reporting"
    type: sum_distinct
    sql_distinct_key: ${vnv_sem_gdn_view.id};;
    sql: ${impressions} ;;
  }

  measure: total_clicks {
    label: "Clicks"
    group_label: "AdWords Reporting"
    type: sum_distinct
    sql_distinct_key: ${vnv_sem_gdn_view.id};;
    sql: ${clicks} ;;
  }

  measure: total_cost {
    label: "Cost"
    group_label: "AdWords Reporting"
    type: sum_distinct
    sql_distinct_key: ${vnv_sem_gdn_view.id};;
    sql: ${cost}/1000000.00 ;;
    value_format_name: usd
  }

  measure: total_conversions {
    label: "Conversions"
    group_label: "AdWords Reporting"
    type: sum_distinct
    sql_distinct_key: ${vnv_sem_gdn_view.id};;
    sql: ${conversions} ;;
  }

  measure: click_through_rate {
    label: "CTR"
    group_label: "AdWords Reporting"
    type: number
    description: "Clickthrough Rate"
    sql: 1.0*${total_clicks}/nullif(${total_impressions}, 0) ;;
    value_format_name: percent_2
  }

  measure: cost_per_click {
    label: "CPC"
    group_label: "AdWords Reporting"
    type: number
    description: "Cost per click"
    sql: ${total_cost}/nullif(${total_clicks}, 0) ;;
    value_format_name: usd
  }

  measure: cost_per_thousand {
    label: "CPM"
    group_label: "AdWords Reporting"
    type: number
    description: "Cost per Thousand Impressions"
    sql: 1.0*${total_cost}/nullif(${total_impressions}/1000, 0) ;;
    value_format_name: usd
  }

  measure: total_conversion_rate {
    label: "CVR"
    group_label: "AdWords Reporting"
    type: number
    description: "Conversion Rate"
    sql: 1.0*${total_conversions}/nullif(${total_clicks}, 0) ;;
    value_format_name: percent_2
  }

  measure: cost_per_conversion {
    label: "CPA"
    group_label: "AdWords Reporting"
    type: number
    description: "Cost per Conversion"
    sql: 1.0*${total_cost}/nullif(${total_conversions}, 0) ;;
    value_format_name: usd
  }

######## JOINED Measures from GA #########

  measure: total_sessions {
    label: "Sessions"
    group_label: "GA Reporting"
    type: sum_distinct
    sql_distinct_key: ${vnv_ga_onsite.id} ;;
    sql: ${vnv_ga_onsite.sessions} ;;
  }

  measure: avg_time_on_site {
    label: "Avg. TOS - Unformatted"
    hidden: yes
    type: number
    sql: ${vnv_ga_onsite.total_session_duration}/nullif(${vnv_ga_onsite.total_sessions}, 0);;
    value_format: "0.##"
  }

  measure: formatted_tos {
    label: "Avg. TOS"
    group_label: "GA Reporting"
    type: number
    sql:  ${avg_time_on_site}::float/86400 ;;
    value_format: "m:ss"
  }

  measure: click_to_session {
    type: number
    label: "CTS"
    group_label: "GA Reporting"
    description: "Percent of clicks that result in a session."
    sql: 1.0*${total_sessions}/nullif(${total_clicks}, 0) ;;
    value_format_name: percent_0
  }

  measure: ga_total_users {
    type: sum_distinct
    group_label: "GA Reporting"
    label: "Users"
    sql_distinct_key: ${vnv_ga_onsite.id};;
    sql: ${vnv_ga_onsite.users};;
  }

  measure: ga_new_users {
    type: sum_distinct
    group_label: "GA Reporting"
    label: "New Users"
    sql_distinct_key: ${vnv_ga_onsite.id};;
    sql: ${vnv_ga_onsite.newusers};;
  }

  measure: percent_new_users {
    label: "% New Users"
    group_label: "GA Reporting"
    type: number
    sql: ${vnv_ga_onsite.new_users}/nullif(${vnv_ga_onsite.total_users}, 0) ;;
    value_format_name: percent_0
}

  measure: cost_per_session {
    label: "CPS"
    group_label: "GA Reporting"
    type: number
    description: "Cost per Session"
    sql: 1.0*${total_cost}/nullif(${vnv_ga_onsite.total_sessions}, 0) ;;
    value_format_name: usd
  }

  measure: ga_total_pageviews {
    group_label: "GA Reporting"
    label: "Pageviews"
    type: sum_distinct
    sql_distinct_key: ${vnv_ga_onsite.id};;
    sql: ${vnv_ga_onsite.pageviews} ;;
  }

  measure: pages_per_session {
    group_label: "GA Reporting"
    label: "Pgs/Session"
    type: number
    sql: ${ga_total_pageviews}/nullif(${total_sessions}, 0) ;;
    value_format: "#.0"
  }

}
