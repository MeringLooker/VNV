view: vnv_fb_view {
  sql_table_name: public.vnv_fb_view ;;
  drill_fields: [id]


####### Join ID ########

  dimension: comp_key {
    hidden: yes
    type: string
    sql: ${TABLE}.comp_key ;;
  }


####### All dimensions go below ######

  dimension: id {
    primary_key: yes
    hidden: yes
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

  dimension: account_id {
    hidden: yes
    type: number
    sql: ${TABLE}.account_id ;;
  }

  dimension: account_name {
    type: string
    sql: ${TABLE}.account_name ;;
  }

  dimension: ad_id {
    hidden: yes
    type: number
    sql: ${TABLE}.ad_id ;;
  }

  dimension: ad_name {
    type: string
    sql: ${TABLE}.ad_name ;;
  }

  dimension: ad_type {
    type: string
    sql:
     CASE
       when ${ad_name} ilike '%SingleImage%' then 'Single Image'
       when ${ad_name} ilike '%Carousel%' then 'Carousel'
       when ${ad_name} ilike '%Video%' then 'Video'
       when ${ad_name} ilike '%Stories%' then 'Story'
       when ${ad_name} ilike '%Canvas%' then 'Canvas'
       ELSE 'Uncategorized'
      END;;
      drill_fields: [ad_name]
  }

  dimension: adset_id {
    hidden: yes
    type: number
    sql: ${TABLE}.adset_id ;;
  }

  dimension: adset_name {
    type: string
    sql: ${TABLE}.adset_name ;;
  }

  dimension: buying_type {
    hidden: yes
    type: string
    sql: ${TABLE}.buying_type ;;
  }

  dimension: campaign_id {
    hidden: yes
    type: number
    sql: ${TABLE}.campaign_id ;;
  }

  dimension: campaign_name {
    type: string
    sql: ${TABLE}.campaign_name ;;
  }

  dimension: fiscal_year {
    label: "Fiscal"
    group_label: "Client"
    type: string
    sql:
      CASE
       when ${campaign_name} ilike '%FY18%' then 'FY 17/18'
       when ${campaign_name} ilike '%FY19%' then 'FY 18/19'
       when ${campaign_name} ilike '%FY20%' then 'FY 19/20'
       ELSE 'Uncategorized'
      END;;
      drill_fields: [campaign_name]
  }

  dimension: vnv_layer {
    label: "VNV Layer"
    group_label: "Client"
    type: string
    sql:
      CASE
       when ${campaign_name} ilike '%_Objective3_%' then 'Impact'
       when ${campaign_name} ilike '%FY20_VNV_Conversions%' or '%FY20_VNV_Video%' then 'FY 18/19'
       ELSE ${campaign_name}
        ELSE 'Uncategorized'
      END;;
      drill_fields: [campaign_name]
  }

  dimension: facebook_layer {
    label: "Facebook Layer"
    type: string
    sql:
      CASE
       when ${campaign_name} ilike '%_VideoViews' then 'Video Views'
       when ${campaign_name} ilike '%_InstagramStories' then 'Instagram Stories'
       when ${campaign_name} ilike '%_TrafficDriving' then 'Traffic Driving'
       ELSE ${campaign_name}
        ELSE 'Uncategorized'
      END;;
    drill_fields: [campaign_name]
  }

  dimension: clicks {
    hidden: yes
    type: number
    sql: ${TABLE}.clicks ;;
  }

  dimension: cost_per_inline_post_engagement {
    hidden: yes
    type: number
    sql: ${TABLE}.cost_per_inline_post_engagement ;;
  }

  dimension: cost_per_unique_click {
    type: number
    hidden: yes
    sql: ${TABLE}.cost_per_unique_click ;;
  }

  dimension: country {
    type: string
    map_layer_name: countries
    sql: ${TABLE}.country ;;
  }

  dimension: cpm {
    type: number
    hidden: yes
    sql: ${TABLE}.cpm ;;
  }

  dimension: cpp {
    type: number
    hidden: yes
    sql: ${TABLE}.cpp ;;
  }

  dimension: ctr {
    type: number
    hidden: yes
    sql: ${TABLE}.ctr ;;
  }

  dimension_group: date_start {
    label: "Time Period"
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
    sql: ${TABLE}.date_start ;;
  }

  dimension_group: date_stop {
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
    sql: ${TABLE}.date_stop ;;
  }

  dimension: frequency {
    type: number
    hidden: yes
    sql: ${TABLE}.frequency ;;
  }

  dimension: impressions {
    type: number
    hidden: yes
    sql: ${TABLE}.impressions ;;
  }

  dimension: inline_link_clicks {
    type: number
    hidden: yes
    sql: ${TABLE}.inline_link_clicks ;;
  }

  dimension: inline_post_engagement {
    type: number
    hidden: yes
    sql: ${TABLE}.inline_post_engagement ;;
  }

  dimension: objective {
    type: string
    label: "FB Objective"
    sql: ${TABLE}.objective ;;
  }

  dimension: reach {
    type: number
    hidden: yes
    sql: ${TABLE}.reach ;;
  }

  dimension: spend {
    type: number
    hidden: yes
    sql: ${TABLE}.spend ;;
  }

  dimension: unique_clicks {
    type: number
    hidden: yes
    sql: ${TABLE}.unique_clicks ;;
  }

  dimension: unique_ctr {
    type: number
    hidden: yes
    sql: ${TABLE}.unique_ctr ;;
  }

####### Meausures go below ######

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  measure: total_impressions {
    type: sum
    label: "Impressions"
    sql: ${impressions} ;;
    drill_fields: [detail*]
  }

  measure: total_clicks {
    type: sum
    label: "Link Clicks"
    sql: ${inline_link_clicks} ;;
    drill_fields: [detail*]
  }

  measure: total_spend {
    type: sum
    label: "Media Spend"
    sql: ${spend};;
    value_format_name: usd
  }

  measure: click_through_rate {
    type: number
    label: "CTR"
    sql: 1.0*${total_clicks}/nullif(${total_impressions}, 0) ;;
    value_format_name: percent_2
    drill_fields: [detail*]
  }

  measure: cost_per_click {
    type: number
    label: "CPC"
    sql: ${total_spend}/nullif(${total_clicks}, 0) ;;
    value_format_name: usd
  }

  measure: cost_per_thousand {
    type: number
    label: "CPM"
    sql: ${total_spend}/nullif(${total_impressions}/1000, 0) ;;
    value_format_name: usd
  }

#### Joined FB Action Measures #####

  measure: video_completes {
    type: sum
    label: "Views to 100%"
    sql: ${facebookads__visit_napa_valley_video_p100_watched_actions.value} ;;
  }

  measure: video_completion_rate {
    type: number
    label: "Vid. Completion Rate"
    sql: 1.0*${video_completes}/nullif(${total_impressions}, 0) ;;
    value_format_name: percent_2
  }

  ####### Joined GA Measures #######

  measure: ga_sessions {
    type: sum_distinct
    label: "Sessions"
    group_label: "GA Reporting"
    sql_distinct_key: ${vnv_mc_ga_view.id};;
    sql: ${vnv_mc_ga_view.sessions};;
  }

  measure: cost_per_session {
    type: number
    label: "CPS"
    group_label: "GA Reporting"
    sql: ${total_spend}/nullif(${ga_sessions}, 0) ;;
    value_format_name: usd
  }

  measure: click_to_session_ratio {
    type: number
    label: "CTS"
    group_label: "GA Reporting"
    description: "Percent of clicks that result in a session."
    sql: 1.0*${ga_sessions}/nullif(${total_clicks}, 0) ;;
    value_format_name: percent_0
    drill_fields: [detail*]
  }

  measure: ga_total_session_duration {
    hidden: yes
    type: sum
    group_label: "GA Reporting"
    label: "Total Session Duration"
    sql_distinct_key: ${vnv_mc_ga_view.id};;
    sql: ${vnv_mc_ga_view.sessionduration};;
  }

  measure: avg_time_on_site {
    label: "Avg. TOS - Unformatted"
    hidden: yes
    group_label: "GA Reporting"
    type: number
    sql: ${vnv_mc_ga_view.total_session_duration}/nullif(${vnv_mc_ga_view.total_sessions}, 0);;
    value_format: "0.##"
  }

  measure: formatted_tos {
    label: "Avg. TOS"
    type: number
    group_label: "GA Reporting"
    sql:  ${avg_time_on_site}::float/86400 ;;
    value_format: "m:ss"
  }

  measure: ga_total_users {
    type: sum
    group_label: "GA Reporting"
    label: "Users"
    sql_distinct_key: ${vnv_mc_ga_view.id};;
    sql: ${vnv_mc_ga_view.users};;
  }

  measure: ga_new_users {
    type: sum
    group_label: "GA Reporting"
    label: "New Users"
    sql_distinct_key: ${vnv_mc_ga_view.id};;
    sql: ${vnv_mc_ga_view.newusers};;
  }

  measure: percent_new_users {
    group_label: "GA Reporting"
    label: "% New Users"
    type: number
    sql: 1.0*${ga_new_users}/nullif(${ga_total_users}, 0) ;;
    value_format_name: percent_0
  }

  measure: total_pageviews {
    group_label: "GA Reporting"
    label: "Pageviews"
    type: sum
    sql: ${vnv_mc_ga_view.pageviews} ;;
  }

  measure: pages_per_session {
    group_label: "GA Reporting"
    label: "Pgs/Session"
    type: number
    sql: ${total_pageviews}/nullif(${ga_sessions}, 0) ;;
    value_format: "#.0"
  }

  measure: ga_partner_referral_goals {
    group_label: "GA Reporting"
    label: "Partner Referrals"
    type: sum
    sql: ${vnv_mc_ga_view.goal5completions} ;;
  }

  measure: partner_referral_rate {
    group_label: "GA Reporting"
    label: "Partner Referral Rate"
    type: number
    sql: 1.0*${vnv_mc_ga_view.partner_referrals}/nullif(${vnv_mc_ga_view.total_sessions}, 0) ;;
    value_format_name: percent_2
  }


  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
      id,
      adset_name,
      campaign_name,
      ad_name,
      account_name,
      facebookads__mc_visit_san_diego_action_values.count,
      facebookads__mc_visit_san_diego_actions.count,
      facebookads__mc_visit_san_diego_cost_per_action_type.count,
      facebookads__mc_visit_san_diego_video_avg_percent_watched_actions.count,
      facebookads__mc_visit_san_diego_video_p100_watched_actions.count,
      facebookads__mc_visit_san_diego_video_p25_watched_actions.count,
      facebookads__mc_visit_san_diego_video_p50_watched_actions.count,
      facebookads__mc_visit_san_diego_video_p75_watched_actions.count,
      facebookads__mc_visit_san_diego_video_p95_watched_actions.count
    ]
  }
}