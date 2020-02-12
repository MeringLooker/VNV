view: vnv_us_trueview {
  sql_table_name: public.vnv_us_trueview ;;
  drill_fields: [id]

#### Primary Key ####

  dimension: id {
    primary_key: yes
    type: string
    hidden: yes
    sql: ${TABLE}.id ;;
  }

  dimension: quartiles_join_id {
    type: string
    hidden: yes
    sql: ${ad_group_id}||'_'||${day_date} ;;
  }

#   dimension: trueview_join_id {
#     type: string
#     hidden: yes
#     sql: ${sdt_trueview_quartiles.trueview_join} ;;
#   }

  #### Dimensions Added to this Table Via LookML ####

  dimension: fiscal_year {
    label: "Fiscal Year"
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

  dimension: advertising_channel {
    type: string
    hidden: yes
    label: "Channel"
    group_label: "TrueView Dimensions"
    sql: 'Video'
      ;;
  }

  dimension: publisher {
    type: string
    hidden: yes
    sql: 'YouTube' ;;
  }

  dimension: vnv_market {
    type: string
    hidden: yes
    sql: 'United States' ;;
  }

  dimension: vnv_campaign {
    label: "Campaign Name"
    type: string
    group_label: "Client Dimensions"
    sql:
      CASE
        WHEN ${campaign} = 'FY20_VNV_Foundational_TrueView' then 'Foundational'
        ELSE 'Uncategorized'
        END;;
  }


  dimension: formatted_device {
    type: string
    label: "Device Type"
    group_label: "TrueView Dimensions"
    sql:
      CASE
        WHEN ${device} ILIKE 'mobile%' then 'Mobile'
        WHEN ${device} ILIKE 'computers%' then 'Computer'
        WHEN ${device} ILIKE 'tablet%' then 'Tablet'
        WHEN ${device} ILIKE '%streaming%' then 'Streaming Device'
        WHEN ${device} ILIKE 'other%' then 'Other'
        ELSE 'Uncategorized'
          END
        ;;
  }

  #### Dimensions go below ####

  dimension: account {
    type: string
    group_label: "TrueView Dimensions"
    sql: ${TABLE}.account ;;
  }

  dimension: ad_group {
    type: string
    group_label: "TrueView Dimensions"
    sql: ${TABLE}."ad group" ;;
  }

  dimension: ad_group_id {
    type: number
    hidden: yes
    sql: ${TABLE}."ad group id" ;;
  }

  dimension: ad_group_state {
    type: string
    hidden: yes
    sql: ${TABLE}."ad group state" ;;
  }

  dimension: ad_type {
    type: string
    group_label: "TrueView Dimensions"
    sql: ${TABLE}."ad type" ;;
  }

  dimension: all_conv_ {
    type: number
    hidden: yes
    sql: ${TABLE}."all conv." ;;
  }

  dimension: all_conv__rate {
    type: string
    hidden: yes
    sql: ${TABLE}."all conv. rate" ;;
  }

  dimension: all_conv__value {
    type: number
    hidden: yes
    sql: ${TABLE}."all conv. value" ;;
  }

  dimension: avg__cost {
    type: number
    hidden: yes
    sql: ${TABLE}."avg. cost" ;;
  }

  dimension: avg__cpc {
    type: number
    hidden: yes
    sql: ${TABLE}."avg. cpc" ;;
  }

  dimension: avg__cpm {
    type: number
    hidden: yes
    sql: ${TABLE}."avg. cpm" ;;
  }

  dimension: avg__cpv {
    type: number
    hidden: yes
    sql: ${TABLE}."avg. cpv" ;;
  }

  dimension: avg__position {
    type: number
    hidden: yes
    sql: ${TABLE}."avg. position" ;;
  }

  dimension: campaign {
    type: string
    group_label: "TrueView Dimensions"
    sql: ${TABLE}.campaign ;;
  }

  dimension: campaign_id {
    type: number
    hidden: yes
    sql: ${TABLE}."campaign id" ;;
  }

  dimension: campaign_state {
    type: string
    hidden: yes
    sql: ${TABLE}."campaign state" ;;
  }

  dimension: city {
    type: string
    hidden: yes
    sql: ${TABLE}.city ;;
  }

  dimension: clicks {
    type: number
    hidden: yes
    sql: ${TABLE}.clicks ;;
  }

  dimension: client_name {
    type: string
    hidden: yes
    sql: ${TABLE}."client name" ;;
  }

  dimension: conv__rate {
    type: string
    hidden: yes
    sql: ${TABLE}."conv. rate" ;;
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

  dimension: cost__all_conv_ {
    type: number
    hidden: yes
    sql: ${TABLE}."cost / all conv." ;;
  }

  dimension: cost__conv_ {
    type: number
    hidden: yes
    sql: ${TABLE}."cost / conv." ;;
  }

  dimension: countryterritory {
    type: number
    hidden: yes
    sql: ${TABLE}."country/territory" ;;
  }

  dimension: crossdevice_conv_ {
    type: string
    hidden: yes
    sql: ${TABLE}."cross-device conv." ;;
  }

  dimension: ctr {
    type: string
    hidden: yes
    sql: ${TABLE}.ctr ;;
  }

  dimension: currency {
    type: string
    hidden: yes
    sql: ${TABLE}.currency ;;
  }

  dimension: customer_id {
    type: number
    hidden: yes
    sql: ${TABLE}."customer id" ;;
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
    hidden: yes
    sql: ${TABLE}.device ;;
  }

  dimension: impressions {
    type: number
    hidden: yes
    sql: ${TABLE}.impressions ;;
  }

  dimension: interaction_rate {
    type: string
    hidden: yes
    sql: ${TABLE}."interaction rate" ;;
  }

  dimension: interaction_types {
    type: string
    hidden: yes
    sql: ${TABLE}."interaction types" ;;
  }

  dimension: interactions {
    type: number
    hidden: yes
    sql: ${TABLE}.interactions ;;
  }

  dimension: is_targetable {
    type: string
    hidden: yes
    sql: ${TABLE}."is targetable" ;;
  }

  dimension: location_type {
    type: string
    hidden: yes
    sql: ${TABLE}."location type" ;;
  }

  dimension: metro_area {
    type: string
    hidden: yes
    sql: ${TABLE}."metro area" ;;
  }

  dimension: most_specific_location {
    type: string
    hidden: yes
    sql: ${TABLE}."most specific location" ;;
  }

  dimension: network {
    type: string
    group_label: "TrueView Dimensions"
    sql: ${TABLE}.network ;;
  }

  dimension: network_with_search_partners {
    type: string
    hidden: yes
    sql: ${TABLE}."network (with search partners)" ;;
  }

  dimension: region {
    type: string
    hidden: yes
    sql: ${TABLE}.region ;;
  }

  dimension: reportname {
    type: string
    hidden: yes
    sql: ${TABLE}.reportname ;;
  }

  dimension: time_zone {
    type: string
    hidden: yes
    sql: ${TABLE}."time zone" ;;
  }

  dimension: total_conv__value {
    type: number
    hidden: yes
    sql: ${TABLE}."total conv. value" ;;
  }

  dimension: value__all_conv_ {
    type: number
    hidden: yes
    sql: ${TABLE}."value / all conv." ;;
  }

  dimension: value__conv_ {
    type: number
    hidden: yes
    sql: ${TABLE}."value / conv." ;;
  }

  dimension: views {
    type: number
    hidden: yes
    sql: ${TABLE}.views ;;
  }

  dimension: viewthrough_conv_ {
    type: number
    hidden: yes
    sql: ${TABLE}."view-through conv." ;;
  }

  dimension: sessions {
    type: number
    hidden: yes
    sql: '0' ;;
  }

  dimension: session_duration {
    type: number
    hidden: yes
    sql: '0' ;;
  }

###### All measures go below ######

  measure: total_cost {
    type: sum_distinct
    sql_distinct_key: ${id} ;;
    sql: (${TABLE}.cost/1000000.00) ;;
    value_format_name: usd
  }

  measure: total_impressions {
    type: sum_distinct
    sql_distinct_key: ${id} ;;
    sql: ${impressions} ;;
  }

  measure: total_clicks {
    type: sum_distinct
    sql_distinct_key: ${id} ;;
    sql: ${clicks} ;;
  }

  measure: click_through_rate {
    type: number
    sql: 1.0*${total_clicks}/nullif(${total_impressions}, 0);;
    value_format_name: percent_0
  }

  measure: total_views {
    type: sum_distinct
    sql_distinct_key: ${id} ;;
    sql: ${views} ;;
  }

  measure: view_rate {
    type: number
    sql: 1.0*${total_views}/nullif(${total_impressions}, 0);;
    value_format_name: percent_0
  }

  measure: cost_per_thousand {
    type: number
    sql: ${total_cost}/nullif((${total_impressions}/1000),0) ;;
    value_format_name: usd
  }

  measure: cost_per_view {
    type: number
    sql: ${total_cost}/nullif(${total_views},0) ;;
    value_format_name: usd
  }

  measure: total_sessions {
    type: sum_distinct
    hidden: yes
    sql_distinct_key: ${id} ;;
    sql: ${sessions} ;;
  }

  measure: total_session_duration {
    type: sum_distinct
    hidden: yes
    sql_distinct_key: ${id} ;;
    sql: ${session_duration} ;;
  }

#   measure: count {
#     type: count
#     drill_fields: [id, client_name, reportname]
#   }
}
