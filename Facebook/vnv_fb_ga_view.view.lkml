view: vnv_fb_ga_view {
  sql_table_name: public.vnv_fb_ga_view ;;


###### Primary Key #######


  dimension: ga_join_id {
    type: string
    primary_key: yes
    hidden: yes
    sql: ${TABLE}.ga_join_id ;;
  }


##### Dimensions added to this table via LookML #####

  dimension: publisher {
    type: string
    group_label: "Client Dimensions"
    sql:
      case
      when ${campaign_name} ilike '%_InstagramStories' then 'Instagram'
      else 'Facebook'
      end;;
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

#   dimension: ad_type {
#     type: string
#     group_label: "Facebook Dimensions"
#     sql:
#      CASE
#        when ${ad_name} ilike '%SingleImage%' then 'Single Image'
#        when ${ad_name} ilike '%Carousel%' then 'Carousel'
#        when ${ad_name} ilike '%Video%' then 'Video'
#        when ${ad_name} ilike '%Stories%' then 'Story'
#        when ${ad_name} ilike '%Canvas%' then 'Canvas'
#        ELSE 'Uncategorized'
#       END;;
#   }

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
       when ${campaign_name} ilike 'FY20_VNV_Objective5%' then 'Local'
       when ${campaign_name} ilike 'FY20_VNV_COVID19Recovery%' then 'Recovery'
       ELSE 'Uncategorized'
       END;;
  }

  dimension: vnv_placement {
    label: "Placement Name"
    group_label: "Client Dimensions"
    type: string
    sql:
      CASE
      when ${campaign_name} ilike '%_VideoViews' then 'Video Views'
      when ${campaign_name} ilike '%_InstagramStories' then 'Instagram Stories'
      when ${ad_name} ilike 'FY20_VNV_Conversions_TrafficDriving_Carousel%' then 'Traffic Driving - Carousel'
      when ${ad_name} ilike 'FY20_VNV_Conversions_TrafficDriving_SingleImage%' then 'Traffic Driving - Single Image'
      when ${campaign_name} ilike 'FY20_VNV_Objective5_Awareness%' then 'Awareness - Single Image'
      when ${ad_name} ilike 'FY20_VNV_Objective5_StoreTraffic_Local%' then 'Store Traffic - Single Image'
      when ${ad_name} = 'FY20_VNV_Objective5_StoreTraffic_Carousel' then 'Store Traffic - Carousel'
      when ${campaign_name} = 'FY20_VNV_Objective3_Awareness' then 'Video Views'
      when ${adset_name} ilike 'FY20_VNV_Objective3_Conversion_VideoRTG%' then 'Traffic Driving - Video Retargeting'
      when ${adset_name} ilike 'FY20_VNV_Objective3_Conversion_RTGWebVisitors%' then 'Traffic Driving - Web Visitor Retargeting'
      when ${adset_name} ilike 'Objective3_SuperAffluent_VideoRTG%' then 'Traffic Driving - Video Retargeting'
      when ${adset_name} ilike 'Objective3_SuperAffluent_RTGWebVisitors%' then 'Traffic Driving - Web Visitor Retargeting'
      when ${campaign_name} = 'FY20_VNV_COVID19Recovery_Phase2_Conversions' then 'Traffic Driving - Single Image'
      ELSE 'Uncategorized'
       END;;
  }

  dimension: creative {
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
        WHEN ${ad_name} ilike '%singleimage_firerecovery' then 'Fire Recovery'
        WHEN ${ad_name} ilike '%singleimage_cabseason' then 'Cab Season'
        WHEN ${ad_name} ilike '%carousel_cabseason' then 'Cab Season'

        WHEN ${ad_name} ilike '%BreathtakingViews' then 'Breathtaking Views'
        WHEN ${ad_name} ilike '%BetterWithTime' then 'Better With Time'
        WHEN ${ad_name} ilike '%RaisingAGlass' then 'Raising A Glass'
        WHEN ${ad_name} ilike '%FullStomach' then 'Full Stomach'
        WHEN ${ad_name} ilike '%Relaxation' then 'Relaxation'
        WHEN ${ad_name} ilike '%BeingTogether' then 'Being Together'
        WHEN ${ad_name} ilike '%Patience' then 'Patience'



        ELSE ${ad_name}
        END;;
  }


####### All dimensions go below ######


  dimension: account_id {
    type: number
    group_label: "Facebook IDs"
    sql: ${TABLE}.account_id ;;
  }

  dimension: account_name {
    type: string
    group_label: "Facebook Dimensions"
    sql: ${TABLE}.account_name ;;
  }

  dimension: ad_id {
    type: number
    group_label: "Facebook IDs"
    sql: ${TABLE}.ad_id ;;
  }

  dimension: ad_name {
    type: string
    group_label: "Facebook Dimensions"
    sql: ${TABLE}.ad_name ;;
  }

  dimension: adset_id {
    type: number
    group_label: "Facebook IDs"
    sql: ${TABLE}.adset_id ;;
  }

  dimension: adset_name {
    type: string
    group_label: "Facebook Dimensions"
    label: "Ad Set Name"
    sql: ${TABLE}.adset_name ;;
  }

  dimension: bounces {
    type: number
    hidden: yes
    sql: ${TABLE}.bounces ;;
  }

  dimension: buying_type {
    type: string
    group_label: "Facebook Dimensions"
    sql: ${TABLE}.buying_type ;;
  }

  dimension: campaign_id {
    type: number
    group_label: "Facebook IDs"
    sql: ${TABLE}.campaign_id ;;
  }

  dimension: campaign_name {
    type: string
    group_label: "Facebook Dimensions"
    sql: ${TABLE}.campaign_name ;;
  }

  dimension: clicks {
    type: number
    hidden: yes
    sql: ${TABLE}.clicks ;;
  }

  dimension: country {
    type: string
    hidden: yes
    map_layer_name: countries
    sql: ${TABLE}.country ;;
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
    type: time
    hidden: yes
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

  dimension: newusers {
    type: number
    hidden: yes
    sql: ${TABLE}.newusers ;;
  }

  dimension: objective {
    type: string
    group_label: "Facebook Dimensions"
    sql: ${TABLE}.objective ;;
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

  dimension: spend {
    type: number
    hidden: yes
    sql: ${TABLE}.spend ;;
  }

  dimension: thruplays {
    type: number
    hidden: yes
    sql: ${TABLE}.thruplays ;;
  }

  dimension: users {
    type: number
    hidden: yes
    sql: ${TABLE}.users ;;
  }

  dimension: views_to_100 {
    type: number
    hidden: yes
    sql: ${TABLE}.views_to_100 ;;
  }

  dimension: views_to_25 {
    type: number
    hidden: yes
    sql: ${TABLE}.views_to_25 ;;
  }

  dimension: views_to_50 {
    type: number
    hidden: yes
    sql: ${TABLE}.views_to_50 ;;
  }

  dimension: views_to_75 {
    type: number
    hidden: yes
    sql: ${TABLE}.views_to_75 ;;
  }

  dimension: views_to_95 {
    type: number
    hidden: yes
    sql: ${TABLE}.views_to_95 ;;
  }

  dimension: view_guide_online {
    type: number
    hidden: yes
    sql: ${TABLE}.view_guide_online ;;
  }

  dimension: enewsletter_sign_up {
    type: number
    hidden: yes
    sql: ${TABLE}.enewsletter_sign_up ;;
  }

  dimension: partner_referral {
    type: number
    hidden: yes
    sql: ${TABLE}.partner_referral ;;
  }

  dimension: guide_hard_copy_sign_up {
    type: number
    hidden: yes
    sql: ${TABLE}.guide_hard_copy_sign_up ;;
  }

  dimension: concierge_form_submissions {
    type: number
    hidden: yes
    sql: ${TABLE}.concierge_form_submissions ;;
  }

  dimension: tos_above_45s {
    type: number
    hidden: yes
    sql: ${TABLE}.tos_above_45s ;;
  }

  ####### Meausures go below ######

  measure: total_impressions {
    type: sum
    label: "Impressions"
    group_label: "Facebook Reporting"
    sql: ${impressions} ;;
  }

  measure: total_clicks {
    type: sum
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
    type: sum
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

#   measure: video_views {
#     type: sum_distinct
#     sql_distinct_key: ${facebookads__visit_napa_valley_actions.id};;
#     label: ":03 Video Views"
#     group_label: "Video Reporting"
#     sql:
#       CASE
#       WHEN ${facebookads__visit_napa_valley_actions.action_type} = 'video_view' THEN ${facebookads__visit_napa_valley_actions.value}
#       else null
#       END;;
#   }

#### Video Measures #####

  measure: video_impressions {
    type: sum
    sql:
        case
        when ${views_to_25} > 0 then ${impressions}
        else null
        end;;
    hidden: yes
  }

  measure: video_spend {
    type: sum
    sql:
        case
        when ${views_to_25} > 0 then ${impressions}
        else null
        end;;
    hidden: yes
  }

  measure: total_views_to_25 {
    type: sum
    label: "Views to 25%"
    group_label: "Facebook Video Reporting"
    sql: ${views_to_25};;
  }

  measure: view_to_25_rate {
    type: number
    label: "% Viewed to 25%"
    group_label: "Facebook Video Reporting"
    sql: 1.0*${total_views_to_25}/nullif(${video_impressions}, 0) ;;
    value_format_name: percent_2
  }

  measure: total_views_to_50 {
    type: sum
    label: "Views to 50%"
    group_label: "Facebook Video Reporting"
    sql: ${views_to_50};;
  }

  measure: view_to_50_rate {
    type: number
    label: "% Viewed to 50%"
    group_label: "Facebook Video Reporting"
    sql: 1.0*${total_views_to_50}/nullif(${video_impressions}, 0) ;;
    value_format_name: percent_2
  }

  measure: total_views_to_75 {
    type: sum
    label: "Views to 75%"
    group_label: "Facebook Video Reporting"
  }

  measure: view_to_75_rate {
    type: number
    label: "% Viewed to 75%"
    group_label: "Facebook Video Reporting"
    sql: 1.0*${total_views_to_75}/nullif(${video_impressions}, 0) ;;
    value_format_name: percent_2
  }

  measure: total_views_to_95 {
    type: sum
    label: "Views to 95%"
    group_label: "Facebook Video Reporting"
  }

  measure: view_to_95_rate {
    type: number
    label: "% Viewed to 95%"
    group_label: "Facebook Video Reporting"
    sql: 1.0*${total_views_to_95}/nullif(${video_impressions}, 0) ;;
    value_format_name: percent_2
  }

  measure: total_video_completes {
    type: sum
    label: "Views to 100%"
    group_label: "Facebook Video Reporting"
    sql: ${views_to_100};;
  }

  measure: video_completion_rate {
    type: number
    label: "Completion Rate"
    group_label: "Facebook Video Reporting"
    sql: 1.0*${total_video_completes}/nullif(${video_impressions}, 0) ;;
    value_format_name: percent_2
  }

  measure: cost_per_complete {
    type: number
    label: "CPcV"
    group_label: "Facebook Video Reporting"
    sql: 1.0*${video_spend}/nullif(${total_video_completes}, 0) ;;
    value_format_name: usd
  }

  measure: total_thruplays {
    type: sum
    label: "ThruPlays"
    group_label: "Facebook Video Reporting"
    sql: ${thruplays};;
  }

  measure: thruplay_rate {
    type: number
    label: "ThruPlay Rate"
    group_label: "Facebook Video Reporting"
    sql: 1.0*${total_thruplays}/nullif(${video_impressions}, 0) ;;
    value_format_name: percent_2
  }

  measure: cost_per_thruplay {
    type: number
    label: "Cost/ThruPlay"
    group_label: "Facebook Video Reporting"
    sql: 1.0*${video_spend}/nullif(${total_thruplays}, 0) ;;
    value_format_name: usd
  }

#   measure: view_rate {
#     type: number
#     group_label: "Video Reporting"
#     label: ":03 View Rate"
#     sql: 1.0*${video_views}/nullif(${total_impressions}, 0) ;;
#     value_format_name: percent_2
#   }
#
#   measure: cost_per_03sec_view {
#     type: number
#     group_label: "Video Reporting"
#     label: "CPV :03"
#     sql: ${video_views}/nullif(${total_spend}, 0);;
#     value_format_name: usd
#   }

    ### Google Analytics Metrics ####

  measure: total_sessions {
    group_label: "GA Reporting"
    type: sum_distinct
    label: "Sessions"
    sql_distinct_key: ${ga_join_id} ;;
    sql: ${sessions} ;;
  }

  measure: cost_per_session {
    group_label: "GA Reporting"
    type: number
    label: "CPS"
    sql: ${total_spend}/nullif(${total_sessions}, 0) ;;
    value_format_name: usd
  }

  measure: total_session_duration {
    hidden: yes
    type: sum_distinct
    label: "Total Session Duration"
    sql_distinct_key: ${ga_join_id};;
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
    sql_distinct_key: ${ga_join_id} ;;
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
    sql_distinct_key: ${ga_join_id} ;;
    sql: ${bounces} ;;
  }

  measure: total_bounce_rate  {
    label: "Bounce Rate"
    group_label: "GA Reporting"
    type: number
    sql: ${total_bounces}/nullif(${total_sessions}, 0) ;;
    value_format_name: percent_2
  }

  ### Google Analytics Goals ####

  measure: total_concierge_form_submission {
    group_label: "GA Reporting Goals"
    label: "Concierge Form Submission"
    type: sum
    sql: ${concierge_form_submissions} ;;
  }

  measure: total_enewsletter_sign_up {
    group_label: "GA Reporting Goals"
    label: "E-Newsletter Sign Up"
    type: sum
    sql: ${enewsletter_sign_up} ;;
  }

  measure: total_partner_referral {
    group_label: "GA Reporting Goals"
    label: "Partner Referrals"
    type: sum
    sql: ${partner_referral} ;;
  }

  measure: total_view_guide_online {
    group_label: "GA Reporting Goals"
    label: "View Guide Online"
    type: sum
    sql: ${view_guide_online} ;;
  }

  measure: total_guide_hard_copy_sign_up {
    group_label: "GA Reporting Goals"
    label: "Guide Hard Copy Side Up"
    type: sum
    sql: ${guide_hard_copy_sign_up} ;;
  }

  measure: total_tos_above_45s {
    group_label: "GA Reporting Goals"
    label: "TOS Above 45s"
    type: sum
    sql: ${tos_above_45s} ;;
  }

  measure: count {
    hidden: yes
    type: count
    drill_fields: []
  }
}
