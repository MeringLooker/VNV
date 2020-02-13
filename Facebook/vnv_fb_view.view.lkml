view: vnv_fb_view {
  sql_table_name: public.vnv_fb_view ;;
  drill_fields: [id]

###### Primary Key #######

  dimension: id {
    primary_key: yes
    hidden: yes
    type: string
    sql: ${TABLE}.id ;;
  }

####### Join ID ########

  dimension: comp_key {
    hidden: yes
    type: string
    sql: ${TABLE}.comp_key ;;
  }

##### Dimensions added to this table via LookML #####

  dimension: publisher {
    type: string
    hidden: yes
    sql: 'Facebook' ;;
  }

  dimension: advertising_channel {
    type: string
    hidden: yes
    sql: 'Social' ;;
  }

  dimension: vnv_market {
    type: string
    hidden: yes
    sql: 'United States' ;;
  }

  dimension: ad_type {
    type: string
    group_label: "Facebook Dimensions"
    sql:
     CASE
       when ${ad_name} ilike '%SingleImage%' then 'Single Image'
       when ${ad_name} ilike '%Carousel%' then 'Carousel'
       when ${ad_name} ilike '%Video%' then 'Video'
       when ${ad_name} ilike '%Stories%' then 'Story'
       when ${ad_name} ilike '%Canvas%' then 'Canvas'
       ELSE 'Uncategorized'
      END;;
  }

  dimension: fiscal_year {
    label: "Fiscal"
    group_label: "Client Dimensions"
    type: string
    sql:
      CASE
        WHEN ${date_start_date} BETWEEN '2015-07-01' AND '2016-06-30' THEN 'FY 15/16'
        WHEN ${date_start_date} BETWEEN '2016-07-01' AND '2017-06-30' THEN 'FY 16/17'
        WHEN ${date_start_date} BETWEEN '2017-07-01' AND '2018-06-30' THEN 'FY 17/18'
        WHEN ${date_start_date} BETWEEN '2018-07-01' AND '2019-06-30' THEN 'FY 18/19'
        WHEN ${date_start_date} BETWEEN '2019-07-01' AND '2020-06-30' THEN 'FY 19/20'
        ELSE 'Uncategorized'
        END
        ;;
  }

  dimension: vnv_campaign {
    label: "Campaign Name"
    group_label: "Client Dimensions"
    type: string
    sql:
      CASE
       when ${campaign_name} ilike '%_Objective3_%' then 'Impact'
       when ${campaign_name} ilike '%FY20_VNV_Conversions%' then 'Foundational'
       when ${campaign_name} ilike '%FY20_VNV_Video%' then 'Foundational'
       ELSE 'Uncategorized'
       END;;
    drill_fields: [campaign_name]
  }

  dimension: facebook_layer {
    label: "Campaign Layer"
    group_label: "Client Dimensions"
    type: string
    sql:
      CASE
       when ${campaign_name} ilike '%_VideoViews' then 'Video Views'
       when ${campaign_name} ilike '%_InstagramStories' then 'Instagram Stories'
       when ${campaign_name} ilike '%_TrafficDriving' then 'Traffic Driving'
       ELSE 'Uncategorized'
       END;;
    drill_fields: [campaign_name]
  }

  dimension: creative_name {
    group_label: "Client Dimensions"
    type: string
    sql:
      CASE
        WHEN ${ad_name} ilike '%legendary' then 'Legendary'
        WHEN ${ad_name} ilike '%lodging' then 'Lodging'
        WHEN ${ad_name} ilike '%thingstodo' then 'Things To Do'
        WHEN ${ad_name} ilike '%wellness' then 'Wellness'
        WHEN ${ad_name} ilike '%gobeyond' then 'Go Beyond'
        WHEN ${ad_name} ilike '%onevalley' then 'One Valley'
        WHEN ${ad_name} ilike '%weekends' then 'Weekends'
        WHEN ${ad_name} ilike '%art' then 'Art'
        WHEN ${ad_name} ilike '%beer' then 'Beer'
        WHEN ${ad_name} ilike '%events' then 'Events'
        WHEN ${ad_name} ilike '%aerial' then 'Aerial'
        WHEN ${ad_name} ilike '%picnictables' then 'Picnic Tables'
        WHEN ${ad_name} ilike '%tablescape' then 'Tablescape'
        WHEN ${ad_name} ilike '%stunningharmony' then 'Stunning Harmony'
        WHEN ${ad_name} ilike '%theweekend' then 'The Weekend'
        WHEN ${ad_name} ilike '%nextsip' then 'Next Sip'
        WHEN ${ad_name} ilike '%winepour' then 'Wine Pour'
        ELSE ${ad_name}
        END;;
  }


####### All dimensions go below ######

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
    hidden: yes
    sql: ${TABLE}.account_name ;;
  }

  dimension: ad_id {
    group_label: "Facebook IDs"
    type: number
    sql: ${TABLE}.ad_id ;;
  }

  dimension: ad_name {
    type: string
    group_label: "Facebook Dimensions"
    sql: ${TABLE}.ad_name ;;
  }

  dimension: adset_id {
    group_label: "Facebook IDs"
    type: number
    sql: ${TABLE}.adset_id ;;
  }

  dimension: adset_name {
    type: string
    label: "Ad Set Name"
    group_label: "Facebook Dimensions"
    sql: ${TABLE}.adset_name ;;
  }

  dimension: buying_type {
    hidden: yes
    type: string
    sql: ${TABLE}.buying_type ;;
  }

  dimension: campaign_id {
    group_label: "Facebook IDs"
    type: number
    sql: ${TABLE}.campaign_id ;;
  }

  dimension: campaign_name {
    type: string
    group_label: "Facebook Dimensions"
    sql: ${TABLE}.campaign_name ;;
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
    hidden: yes
    group_label: "Facebook Dimensions"
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
    group_label: "Facebook Dimensions"
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
    type: sum_distinct
    sql_distinct_key: ${id} ;;
    label: "Impressions"
    group_label: "Facebook Reporting"
    sql: ${impressions} ;;
  }

  measure: total_clicks {
    type: sum_distinct
    sql_distinct_key: ${id} ;;
    label: "Clicks"
    group_label: "Facebook Reporting"
    sql: ${inline_link_clicks} ;;
  }

  measure: click_through_rate {
    type: number
    label: "CTR"
    group_label: "Facebook Reporting"
    sql: 1.0*${total_clicks}/nullif(${total_impressions}, 0) ;;
    value_format_name: percent_2
  }

  measure: total_spend {
    type: sum_distinct
    sql_distinct_key: ${id} ;;
    label: "Media Spend"
    group_label: "Facebook Reporting"
    sql: ${spend};;
    value_format_name: usd
  }

  measure: cost_per_click {
    type: number
    label: "CPC"
    group_label: "Facebook Reporting"
    sql: ${total_spend}/nullif(${total_clicks}, 0) ;;
    value_format_name: usd
  }

  measure: cost_per_thousand {
    type: number
    label: "CPM"
    group_label: "Facebook Reporting"
    sql: ${total_spend}/nullif(${total_impressions}/1000, 0) ;;
    value_format_name: usd
  }

#### Joined FB Action Measures #####

  measure: video_views {
    type: sum_distinct
    sql_distinct_key: ${facebookads__visit_napa_valley_actions.id};;
    label: ":03 Video Views"
    group_label: "Video Reporting"
    sql:
      CASE
      WHEN ${facebookads__visit_napa_valley_actions.action_type} = 'video_view' THEN ${facebookads__visit_napa_valley_actions.value}
      else null
      END;;
  }

  measure: video_completes {
    type: sum_distinct
    label: "Views to 100%"
    group_label: "Video Quartiles"
    sql_distinct_key: ${facebookads__visit_napa_valley_video_p100_watched_actions.id};;
    sql: ${facebookads__visit_napa_valley_video_p100_watched_actions.value} ;;
  }

  measure: video_completion_rate {
    type: number
    label: "Vid. Completion Rate"
    group_label: "Video Quartiles"
    sql: 1.0*${video_completes}/nullif(${total_impressions}, 0) ;;
    value_format_name: percent_2
  }

  measure: view_rate {
    type: number
    group_label: "Video Reporting"
    label: ":03 View Rate"
    sql: 1.0*${video_views}/nullif(${total_impressions}, 0) ;;
    value_format_name: percent_2
  }

  measure: cost_per_03sec_view {
    type: number
    group_label: "Video Reporting"
    label: "CPV :03"
    sql: ${video_views}/nullif(${total_spend}, 0);;
    value_format_name: usd
  }

  measure: view_to_25_percent {
    type: sum_distinct
    label: "Views to 25%"
    group_label: "Video Quartiles"
    sql_distinct_key: ${facebookads__visit_napa_valley_video_p25_watched_actions.id};;
    sql: ${facebookads__visit_napa_valley_video_p25_watched_actions.value} ;;
  }

  measure: view_to_50_percent {
    type: sum_distinct
    label: "Views to 50%"
    group_label: "Video Quartiles"
    sql_distinct_key: ${facebookads__visit_napa_valley_video_p50_watched_actions.id};;
    sql: ${facebookads__visit_napa_valley_video_p50_watched_actions.value} ;;
  }

  measure: view_to_75_percent {
    type: sum_distinct
    label: "Views to 75%"
    group_label: "Video Quartiles"
    sql_distinct_key: ${facebookads__visit_napa_valley_video_p75_watched_actions.id};;
    sql: ${facebookads__visit_napa_valley_video_p75_watched_actions.value} ;;
  }

  measure: view_to_25_rate {
    type: number
    label: "View to 25% Rate"
    group_label: "Video Quartiles"
    sql: 1.0*${video_completes}/nullif(${total_impressions}, 0) ;;
    value_format_name: percent_2
  }

  measure: view_to_50_rate {
    type: number
    label: "View to 50% Rate"
    group_label: "Video Quartiles"
    sql: 1.0*${video_completes}/nullif(${total_impressions}, 0) ;;
    value_format_name: percent_2
  }

  measure: view_to_75_rate {
    type: number
    label: "View to 75% Rate"
    group_label: "Video Quartiles"
    sql: 1.0*${video_completes}/nullif(${total_impressions}, 0) ;;
    value_format_name: percent_2
  }

  ####### Joined GA Measures #######

  measure: ga_sessions {
    type: sum_distinct
    label: "Sessions"
    group_label: "GA Reporting"
    sql_distinct_key: ${vnv_ga_onsite.id};;
    sql: ${vnv_ga_onsite.sessions};;
  }

  measure: cost_per_session {
    type: number
    label: "CPS"
    group_label: "GA Reporting"
    sql: ${total_spend}/nullif(${ga_sessions}, 0) ;;
    value_format_name: usd
  }

  measure: ga_total_session_duration {
    hidden: yes
    type: sum_distinct
    group_label: "GA Reporting"
    label: "Total Session Duration"
    sql_distinct_key: ${vnv_ga_onsite.id};;
    sql: ${vnv_ga_onsite.sessionduration};;
  }

  measure: avg_time_on_site {
    label: "Avg. TOS"
    group_label: "GA Reporting"
    type: number
    sql: (${vnv_ga_onsite.total_session_duration}/nullif(${vnv_ga_onsite.total_sessions}, 0))::float/86400 ;;
    value_format: "m:ss"
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
    group_label: "GA Reporting"
    label: "% New Users"
    type: number
    sql: 1.0*${ga_new_users}/nullif(${ga_total_users}, 0) ;;
    value_format_name: percent_0
  }

  measure: ga_total_pageviews {
    group_label: "GA Reporting"
    label: "Pageviews"
    type: sum
    sql_distinct_key: ${vnv_ga_onsite.id};;
    sql: ${vnv_ga_onsite.pageviews} ;;
  }

  measure: pages_per_session {
    group_label: "GA Reporting"
    label: "Pgs/Session"
    type: number
    sql: ${ga_total_pageviews}/nullif(${ga_sessions}, 0) ;;
    value_format: "#.0"
  }

#   measure: ga_partner_referral_goals {
#     group_label: "GA Reporting"
#     label: "Partner Referrals"
#     type: sum_distinct
#     sql_distinct_key: ${vnv_ga_onsite.id};;
#     sql: ${vnv_ga_onsite.goal5completions} ;;
#   }
#
#   measure: partner_referral_rate {
#     group_label: "GA Reporting"
#     label: "Partner Referral Rate"
#     type: number
#     sql: 1.0*${vnv_ga_onsite.partner_referrals}/nullif(${vnv_ga_onsite.total_sessions}, 0) ;;
#     value_format_name: percent_2
#   }


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
