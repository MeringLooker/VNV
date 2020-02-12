view: vnv_sem_view {
  sql_table_name: public.vnv_sem_view ;;
  drill_fields: [id]

 ###### Primary Key #######

  dimension: id {
    primary_key: yes
    hidden: yes
    type: string
    sql: ${TABLE}.id ;;
  }

###### Join ID #######

  dimension: comp_key {
    type: string
    hidden: yes
    sql: ${TABLE}.comp_key ;;
  }

  dimension: join_id_onsite {
    type: string
    hidden: yes
    sql: ${ad_group_id}||'_'||${day_date} ;;
  }

  dimension: join_id_userInfo {
    type: string
    hidden: yes
    sql: ${ad_group_id}||'_'||${device_formatted}||'_'||${day_date} ;;
  }

  dimension: join_id_pageInfo {
    type: string
    hidden: yes
    sql: ${ad_group_id}||'_'||${device_formatted}||'_'||${day_date} ;;
  }

###### Dimensions added to this table via LookML #######

  dimension: fiscal_year {
    label: "Fiscal Year"
    type: string
    group_label: "Client Dimensions"
    sql:
      CASE
        WHEN ${day_date} BETWEEN '2013-07-01' AND '2014-06-30' THEN 'FY 13/14'
        WHEN ${day_date} BETWEEN '2014-07-01' AND '2015-06-30' THEN 'FY 14/15'
        WHEN ${day_date} BETWEEN '2015-07-01' AND '2016-06-30' THEN 'FY 15/16'
        WHEN ${day_date} BETWEEN '2016-07-01' AND '2017-06-30' THEN 'FY 16/17'
        WHEN ${day_date} BETWEEN '2017-07-01' AND '2018-06-30' THEN 'FY 17/18'
        WHEN ${day_date} BETWEEN '2018-07-01' AND '2019-06-30' THEN 'FY 18/19'
        WHEN ${day_date} BETWEEN '2019-07-01' AND '2020-06-30' THEN 'FY 19/20'
        ELSE 'Uncategorized'
        END
        ;;
  }

  dimension: advertising_channel {
    type: string
    label: "Channel"
    group_label: "AdWords Dimensions"
    sql: 'Search' ;;
  }

  dimension: publisher {
    type: string
    label: "Publisher"
    group_label: "AdWords Dimensions"
    sql: 'Google Search' ;;
  }


  dimension: vnv_market {
    type: string
    label: "Market"
    group_label: "Client Dimensions"
    sql: 'United States' ;;
  }

  dimension: vnv_campaign {
    type: string
    label: "Campaign Name"
    group_label: "Client Dimensions"
    sql:
      CASE
        WHEN ${account} = 'VNV Foundational SEM' THEN 'Foundational'
        WHEN ${account} = 'VNV Group SEM' THEN 'Group'
        ELSE 'Uncategorized'
        END;;
  }

  dimension: vnv_placement {
    type: string
    label: "Campaign Placement"
    group_label: "Client Dimensions"
    sql:
      case
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

  dimension: vnv_audience {
    type: string
    label: "Audience"
    group_label: "Client Dimensions"
    sql:
      CASE
        WHEN ${ad_group_id} '84007501372' then 'Custom Intent'
        WHEN ${ad_group_id} '78380941643' then 'Custom Intent'
        WHEN ${ad_group_id} '84007501332' then 'Retargeting - Web Visitors'
        WHEN ${ad_group_id} '78380941843' then 'Retargeting - Web Visitors'
        WHEN ${ad_group_id} '82777330008' then 'Luxury Traveler'

        ELSE 'Uncategorized'
        END;;
  }

#### Dimensions Native to this table ####

  dimension: account {
    type: string
    group_label: "AdWords Dimensions"
    sql: ${TABLE}.account ;;
  }

  dimension: ad_group {
    type: string
    group_label: "AdWords Dimensions"
    sql: ${TABLE}."ad group" ;;
  }

  dimension: ad_group_id {
    type: number
    group_label: "AdWords IDs"
    sql: ${TABLE}."ad group id" ;;
  }

  dimension: campaign {
    type: string
    group_label: "AdWords Dimensions"
    sql: ${TABLE}.campaign ;;
  }

  dimension: campaign_id {
    type: number
    group_label: "AdWords IDs"
    sql: ${TABLE}."campaign id" ;;
  }

  dimension: clicks {
    type: number
    hidden: yes
    sql: ${TABLE}.clicks ;;
  }

  dimension: conversions {
    type: number
    hidden: yes
    sql: ${TABLE}.conversions ;;
  }

  dimension: cost {
    type: number
    hidden: yes
    sql: ${TABLE}.cost ;;
  }

  dimension_group: day {
    type: time
    group_label: "Date Periods"
    label: ""
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
    type: string
    group_label: "AdWords Dimensions"
    sql: ${TABLE}.device ;;
  }

  dimension: device_formatted {
    type: string
    hidden: yes
    sql: ${TABLE}.device_formatted ;;
  }

  dimension: impressions {
    type: number
    hidden: yes
    sql: ${TABLE}.impressions ;;
  }

  dimension: views {
    type: number
    hidden: yes
    sql: '0';;
  }

  dimension: completes {
    type: number
    hidden: yes
    sql: '0';;
  }

############ All measures go below ############

  measure: total_impressions {
    label: "Impressions"
    group_label: "AdWords Reporting"
    type: sum_distinct
    sql_distinct_key: ${id};;
    sql: ${impressions} ;;
  }

  measure: total_clicks {
    label: "Clicks"
    group_label: "AdWords Reporting"
    type: sum_distinct
    sql_distinct_key: ${id};;
    sql: ${clicks} ;;
  }

  measure: total_cost {
    label: "Cost"
    group_label: "AdWords Reporting"
    type: sum_distinct
    sql_distinct_key: ${id};;
    sql: ${cost}/1000000.00 ;;
    value_format_name: usd
  }

  measure: total_conversions {
    label: "Conversions"
    group_label: "AdWords Reporting"
    type: sum_distinct
    sql_distinct_key: ${id};;
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

  measure: total_views {
    type: sum_distinct
    hidden: yes
    sql_distinct_key: ${id} ;;
    sql: ${views} ;;
  }

  measure: total_completes {
    type: sum_distinct
    hidden: yes
    sql_distinct_key: ${id} ;;
    sql: ${completes} ;;
  }

######## JOINED Measures from GA #########

  measure: total_sessions {
    label: "Sessions"
    group_label: "GA Reporting"
    type: sum_distinct
    sql_distinct_key: ${vnv_ga_onsite.id} ;;
    sql: ${vnv_ga_onsite.sessions} ;;
  }

  measure: ga_total_session_duration {
    hidden: yes
    type: sum_distinct
    label: "Total Session Duration"
    sql_distinct_key: ${vnv_ga_onsite.id};;
    sql: ${vnv_ga_onsite.sessionduration};;
  }

  measure: avg_time_on_site {
    group_label: "GA Reporting"
    label: "Avg. TOS"
    type: number
    sql:  (${vnv_ga_onsite.total_session_duration}/nullif(${vnv_ga_onsite.total_sessions}, 0))::float/86400  ;;
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

  measure: count {
    type: count
  }
}
