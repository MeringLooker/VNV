view: vnv_sem_view {
  sql_table_name: public.vnv_sem_ga_view ;;


 ###### Primary Key #######

  dimension: comp_key {
    type: string
    hidden: yes
    sql: ${TABLE}.comp_key ;;
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

        WHEN ${ad_group} ILIKE 'Wedding Venues%' THEN 'Wedding Venues'
        WHEN ${ad_group} ILIKE 'Wedding Event%' THEN 'Wedding Event'
        WHEN ${ad_group} ILIKE 'Venues%' THEN 'Venues'
        WHEN ${ad_group} ILIKE 'Corporate Event%' THEN 'Corporate Event'


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

###### All Dimensions go Below #######

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

  dimension: bounces {
    type: number
    hidden: yes
    sql: ${TABLE}.bounces ;;
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

  dimension: impressions {
    type: number
    hidden: yes
    sql: ${TABLE}.impressions ;;
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

  dimension: total_conv_value {
    type: number
    hidden: yes
    sql: ${TABLE}.total_conv_value ;;
  }

  dimension: views {
    type: number
    hidden: yes
    sql: 0 ;;
  }

  dimension: completes {
    type: number
    hidden: yes
    sql: 0 ;;
  }

###### All Measures go Below #######

  measure: total_impressions {
    type: sum_distinct
    group_label: "AdWords Reporting"
    sql_distinct_key: ${comp_key} ;;
    sql: ${impressions} ;;
  }

  measure: total_clicks {
    type: sum_distinct
    group_label: "AdWords Reporting"
    sql_distinct_key: ${comp_key} ;;
    sql: ${clicks} ;;
  }

  measure: total_cost {
    type:  sum_distinct
    group_label: "AdWords Reporting"
    sql_distinct_key: ${comp_key} ;;
    sql:${cost}/1000000.00  ;;
    value_format_name: usd
  }

  measure: total_conversions {
    type: sum_distinct
    group_label: "AdWords Reporting"
    sql_distinct_key: ${comp_key} ;;
    sql: ${conversions} ;;
  }

  measure: click_through_rate  {
    label: "CTR"
    group_label: "AdWords Reporting"
    type: number
    sql: ${total_clicks}/nullif(${total_impressions}, 0) ;;
    value_format_name: percent_2
  }

  measure: cost_per_click {
    label: "CPC"
    group_label: "AdWords Reporting"
    type: number
    sql: ${total_cost}/nullif(${total_clicks}, 0) ;;
    value_format_name: usd
  }

  measure: cost_per_thousand  {
    label: "CPM"
    group_label: "AdWords Reporting"
    type: number
    sql: ${total_cost}/nullif(${total_impressions}/1000, 0) ;;
    value_format_name: usd
  }

  measure: total_conversion_rate  {
    label: "CVR"
    group_label: "AdWords Reporting"
    type: number
    sql: ${total_conversions}/nullif(${total_clicks}, 0) ;;
    value_format_name: percent_2
  }

  measure: cost_per_conversion {
    label: "CPA"
    group_label: "AdWords Reporting"
    type: number
    sql: ${total_cost}/nullif(${total_conversions} ,0);;
    value_format_name: usd
  }

  measure: total_views {
    type: sum_distinct
    hidden: yes
    sql_distinct_key: ${comp_key} ;;
    sql: ${views} ;;
  }

  measure: total_completes {
    type: sum_distinct
    hidden: yes
    sql_distinct_key: ${comp_key} ;;
    sql: ${completes} ;;
  }

  measure: total_sessions {
    group_label: "GA Reporting"
    type: sum_distinct
    label: "Sessions"
    sql_distinct_key: ${comp_key} ;;
    sql: ${sessions} ;;
  }

  measure: cost_per_session {
    group_label: "GA Reporting"
    type: number
    label: "CPS"
    sql: ${total_cost}/nullif(${total_sessions}, 0) ;;
    value_format_name: usd
  }

  measure: total_session_duration {
    hidden: yes
    type: sum_distinct
    label: "Total Session Duration"
    sql_distinct_key: ${comp_key};;
    sql: ${sessionduration};;
  }

  measure: avg_time_on_site {
    group_label: "GA Reporting"
    label: "Avg. TOS"
    type: number
    sql:  (${total_session_duration}/nullif(${total_sessions}, 0))::float/86400  ;;
    value_format: "m:ss"
  }

  measure: total_pageviews {
    group_label: "GA Reporting"
    type: sum_distinct
    label: "Pageviews"
    sql_distinct_key: ${comp_key} ;;
    sql: ${pageviews} ;;
  }

  measure: pages_per_session {
    group_label: "GA Reporting"
    type: number
    label: "Pages/Session"
    sql: ${total_pageviews}/nullif(${total_sessions}, 0) ;;
    value_format_name: decimal_2
  }

  measure: total_bounces {
    group_label: "GA Reporting"
    type: sum_distinct
    label: "Bounces"
    sql_distinct_key: ${comp_key} ;;
    sql: ${bounces} ;;
  }

  measure: total_bounce_rate  {
    label: "Bounce Rate"
    group_label: "GA Reporting"
    type: number
    sql: ${total_bounces}/nullif(${total_sessions}, 0) ;;
    value_format_name: percent_2
  }

  measure: count {
    type: count
  }
}
