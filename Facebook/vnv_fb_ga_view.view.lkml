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
       when ${campaign_name} ilike 'FY20_VNV_COVID19Recovery_Phase2%' then 'FY21 Better With Time'
       when ${campaign_name} ilike 'FY20_VNV_COVID19Recovery_Phase3%' then 'FY21 Raise A Glass'
       when ${campaign_name} ilike 'FY21_UpValley%' then 'FY21 Up Valley'
       ELSE 'Uncategorized'
       END;;
  }

  dimension: vnv_placement {
    label: "Placement Name"
    group_label: "Client Dimensions"
    type: string
    sql:
      CASE
      when ${adset_name} ilike 'FY20_VNV_COVID19Recovery_Phase3_Conversions_AspirationalAudience%' then 'Traffic-Driving Single Image - Aspirational Target'
      when ${adset_name} ilike 'FY20_VNV_COVID19Recovery_Phase3_Conversions_LuxuryAudience%' then 'Traffic-Driving Single Image - Luxury Target'
      when ${adset_name} ilike 'FY20_VNV_COVID19Recovery_Phase3_Conversions_LookalikeAudience%' then 'Traffic-Driving Single Image - Site Lookalikes'
      when ${adset_name} ilike 'FY20_VNV_COVID19Recovery_Phase3_Conversions_Retargeting%' then 'Traffic-Driving Single Image - Retargeting'
      when ${adset_name} ilike 'FY20_VNV_COVID19Recovery_Phase3_VideoViews_AspirationalAudience%' then 'Facebook Video - Aspirational Target'
      when ${adset_name} ilike 'FY20_VNV_COVID19Recovery_Phase3_VideoViewsLuxuryAudience%' then 'Facebook Video - Luxury Target'
      when ${adset_name} ilike 'FY20_VNV_COVID19Recovery_Phase3_VideoViews_LookalikeAudience%' then 'Facebook Video - Site Lookalikes'
      when ${adset_name} ilike 'FY20_VNV_COVID19Recovery_Phase3_VideoViews_Retargeting%' then 'Facebook Video - Retargeting'

      when ${campaign_name} ilike '%_InstagramStories' then 'Instagram Stories'
      when ${ad_name} ilike 'FY20_VNV_Conversions_TrafficDriving_Carousel%' then 'Traffic Driving - Carousel'
      when ${ad_name} ilike 'FY20_VNV_Conversions_TrafficDriving_SingleImage%' then 'Traffic Driving - Single Image'
      when ${campaign_name} ilike 'FY20_VNV_Objective5_Awareness%' then 'Awareness - Single Image'
      when ${ad_name} ilike 'FY20_VNV_Objective5_StoreTraffic_Local%' then 'Store Traffic - Single Image'
      when ${ad_name} = 'FY20_VNV_Objective5_StoreTraffic_Carousel' then 'Store Traffic - Carousel'
      when ${campaign_name} = 'FY20_VNV_Objective3_Awareness' then 'Facebook Video'
      when ${adset_name} ilike 'FY20_VNV_Objective3_Conversion_VideoRTG%' then 'Traffic Driving - Video Retargeting'
      when ${adset_name} ilike 'FY20_VNV_Objective3_Conversion_RTGWebVisitors%' then 'Traffic Driving - Web Visitor Retargeting'
      when ${adset_name} ilike 'Objective3_SuperAffluent_VideoRTG%' then 'Traffic Driving - Video Retargeting'
      when ${adset_name} ilike 'Objective3_SuperAffluent_RTGWebVisitors%' then 'Traffic Driving - Web Visitor Retargeting'
      when ${campaign_name} = 'FY20_VNV_COVID19Recovery_Phase2_Conversions' then 'Traffic Driving - Single Image'
      when ${campaign_name} ilike '%storetraffic%' then 'Store Traffic - Single Image'
      ELSE 'Uncategorized'
       END;;
  }

  dimension: creative_name {
    group_label: "Client Dimensions"
    type: string
    sql:
      CASE
        WHEN ${ad_name} ilike 'FY20_VNV_COVID19Recovery_Phase3_Conversions_%_Culinary%'  then  'Culinary Single Image'
        WHEN ${ad_name} ilike 'FY20_VNV_COVID19Recovery_Phase3_VideoViews_%_DiveRightIn%'  then  'Dive Right In (:15)'
        WHEN ${ad_name} ilike 'FY20_VNV_COVID19Recovery_Phase3_Conversions_%_General%' then  'General Single Image'
        WHEN ${ad_name} ilike 'FY20_VNV_COVID19Recovery_Phase3_Conversions_%_OutdoorWellness%' then  'Outdoor Wellness Single Image'
        WHEN ${ad_name} ilike 'FY20_VNV_COVID19Recovery_Phase3_Conversions_%_ResortBookTrip%'  then  'Resort Book Trip Single Image'
        WHEN ${ad_name} ilike 'FY20_VNV_COVID19Recovery_Phase3_Conversions_%_Towns%' then  'Towns Single Image'
        WHEN ${ad_name} ilike 'FY20_VNV_COVID19Recovery_Phase3_Conversions_%_Wineries%'  then  'Wineries Single Image'
        WHEN ${ad_name} ilike 'FY20_VNV_COVID19Recovery_Phase3_VideoViews_%_WorldClass%' then  'World Class (:15)'

        WHEN ${ad_name} ilike 'FY20_VNV_COVID19Recovery_Phase3_Conversions_%_Brand1%'  then  'Brand: Upgrade Your Stay Single Image'
        WHEN ${ad_name} ilike 'FY20_VNV_COVID19Recovery_Phase3_Conversions_%_Brand2%'  then  'Brand: Plan Your Trip Single Image'
        WHEN ${ad_name} ilike 'FY20_VNV_COVID19Recovery_Phase3_Conversions_%_Brand3%'  then  'Brand: Few Clicks Away Single Image'
        WHEN ${ad_name} ilike 'FY20_VNV_COVID19Recovery_Phase3_Conversions_%_Brand4%'  then  'Brand: View Special Offers Single Image'
        WHEN ${ad_name} ilike 'FY20_VNV_COVID19Recovery_Phase3_Conversions_%_Hotel3%'  then  'Hotel: Upgrade Your Stay Single Image'
        WHEN ${ad_name} ilike 'FY20_VNV_COVID19Recovery_Phase3_Conversions_%_Hotel2%'  then  'Hotel: Plan Your Trip Single Image'
        WHEN ${ad_name} ilike 'FY20_VNV_COVID19Recovery_Phase3_Conversions_%_Hotel4%'  then  'Hotel: Few Clicks Away Single Image'
        WHEN ${ad_name} ilike 'FY20_VNV_COVID19Recovery_Phase3_Conversions_%_Hotel1%'  then  'Hotel: View Special Offers Single Image'

        WHEN ${ad_name} ilike '%carousel_legendary' then 'Legendary Carousel'
        WHEN ${ad_name} ilike '%carousel_lodging' then 'Lodging Carousel'
        WHEN ${ad_name} ilike '%carousel_thingstodo' then 'Things To Do Carousel'
        WHEN ${ad_name} ilike '%carousel_wellness' then 'Wellness Carousel'
        WHEN ${ad_name} ilike '%singleimage_gobeyond' then 'Go Beyond Single Image'
        WHEN ${ad_name} ilike '%singleimage_onevalley' then 'One Valley Single Image'
        WHEN ${ad_name} ilike '%singleimage_weekends' then 'Weekends Single Image'
        WHEN ${ad_name} ilike '%stories_art' then 'Art IG Story'
        WHEN ${ad_name} ilike '%stories_beer' then 'Beer IG Story'
        WHEN ${ad_name} ilike '%stories_events' then 'Events IG Story'
        WHEN ${ad_name} ilike '%stories_lodging' then 'Lodging IG Story'
        WHEN ${ad_name} ilike '%singleimage_aerial' then 'Aerial Single Image'
        WHEN ${ad_name} ilike '%singleimage_picnictables' then 'Picnic Tables Single Image'
        WHEN ${ad_name} ilike '%singleimage_tablescape' then 'Tablescape Single Image'
        WHEN ${ad_name} ilike '%stunningharmony' then 'Stunning Harmony (:15)'
        WHEN ${ad_name} ilike '%theweekend' then 'The Weekend (:15)'
        WHEN ${ad_name} ilike '%nextsip' then 'Next Sip (:15)'
        WHEN ${ad_name} ilike '%singleimage_winepour' then 'Wine Pour Single Image'
        WHEN ${ad_name} ilike '%singleimage_firerecovery' then 'Fire Recovery Single Image'
        WHEN ${ad_name} ilike '%singleimage_cabseason' then 'Cab Season Single Image'
        WHEN ${ad_name} ilike '%carousel_cabseason' then 'Cab Season Carousel'

        WHEN ${ad_name} ilike '%singleimage_cabseasonc' then 'Cab Season (C) Single Image'
        WHEN ${ad_name} ilike '%singleimage_cabseasonb' then 'Cab Season (B) Single Image'
        WHEN ${ad_name} ilike '%singleimage_cabseasona' then 'Cab Season (A) Single Image'

        WHEN ${ad_name} ilike '%BreathtakingViews' then 'Breathtaking Views'
        WHEN ${ad_name} ilike '%BetterWithTime' then 'Better With Time'
        WHEN ${ad_name} ilike '%RaisingAGlass' then 'Raising A Glass'
        WHEN ${ad_name} ilike '%FullStomach' then 'Full Stomach'
        WHEN ${ad_name} ilike '%Relaxation' then 'Relaxation'
        WHEN ${ad_name} ilike '%BeingTogether' then 'Being Together'
        WHEN ${ad_name} ilike '%Patience' then 'Patience'

        WHEN ${ad_name} ilike '%Terroir1' then 'Terroir v1 Single Image'
        WHEN ${ad_name} ilike '%Terroir2' then 'Terroir v2 Single Image'
        WHEN ${ad_name} ilike '%Local1' then 'Local v1 Single Image'
        WHEN ${ad_name} ilike '%Local2' then 'Local v2 Single Image'
        WHEN ${ad_name} ilike '%Local3' then 'Local v3 Single Image'
        WHEN ${ad_name} ilike '%StoreTraffic_Carousel' then 'Local Carousel'

        when ${ad_name} = 'FY20_Objective3_VideoRTG_SingleImage' then 'Dynamic Creative Single Image'
        when ${ad_name} = 'FY20_Objective3_RTGWebVisitors_SingleImage' then 'Dynamic Creative Single Image'

        when ${ad_name} = 'FY20_VNV_Objective3_Conversion_VideoRTG_DynamicCreative' then 'Dynamic Creative Single Image'
        when ${ad_name} = 'FY20_VNV_Objective3_Conversion_RTGWebVisitors_DynamicCreative' then 'Dynamic Creative Single Image'

        when ${ad_name} = 'FY20_Objective3_RTGWebVisitors_Legendary' then 'Legendary Carousel'

        when ${ad_name} = 'Objective3_Awareness_DynamicVideo' then 'Dynamic Video (:15)'
        when ${ad_name} = 'FY20_VNV_Objective3_Awareness' then 'Dynamic Video (:15)'

        ELSE 'Uncategorized'
        END;;
  }

  dimension: ad_size {
    type: string
    group_label: "Facebook Dimensions"
    label: "Ad Size"
    sql:
      CASE
        when ${adset_name} ilike 'FY20_VNV_COVID19Recovery_Phase3_Conversions%' then 'Single Image'
        when ${adset_name} ilike 'FY20_VNV_COVID19Recovery_Phase3_VideoViews%' then 'Video'
        when ${ad_name} ilike '%Carousel%' then 'Carousel'
        when ${ad_name} ilike '%SingleImage%' then 'Landscape Image'
        when ${ad_name} = 'FY20_Objective3_RTGWebVisitors_Legendary' then 'Carousel'
        when ${ad_name} = 'FY20_VNV_Objective3_Conversion_VideoRTG_DynamicCreative' then 'Landscape Image'
        when ${ad_name} = 'FY20_VNV_Objective3_Conversion_RTGWebVisitors_DynamicCreative' then 'Landscape Image'
        when ${ad_name} = 'Objective3_Awareness_DynamicVideo' then 'Landscape Video'
        when ${ad_name} = 'FY20_VNV_Objective3_Awareness' then 'Landscape Video'

        ELSE 'Uncategorized'
        END
        ;;
  }

dimension: phase {
  type: string
  group_label: "Client Dimensions"
  label: "Phase"
  sql:
    CASE
      WHEN ${campaign_name} ilike '%phase2%'the 'Phase 2'
      WHEN ${campaign_name} ilike '%phase3%'the 'Phase 3'
  ;;
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
    type: sum_distinct
    sql_distinct_key: ${ga_join_id} ;;
    label: "Impressions"
    group_label: "Facebook Reporting"
    sql: ${impressions} ;;
  }

  measure: total_clicks {
    type: sum_distinct
    sql_distinct_key: ${ga_join_id} ;;
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
    sql_distinct_key: ${ga_join_id} ;;
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
    type: sum_distinct
    sql_distinct_key: ${ga_join_id} ;;
    sql:
        case
        when ${views_to_25} > 0 then ${impressions}
        else null
        end;;
    hidden: yes
  }

  measure: video_spend {
    type: sum_distinct
    sql_distinct_key: ${ga_join_id} ;;
    sql:
        case
        when ${views_to_25} > 0 then ${impressions}
        else null
        end;;
    hidden: yes
  }

  measure: total_views_to_25 {
    type: sum_distinct
    sql_distinct_key: ${ga_join_id} ;;
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
    type: sum_distinct
    sql_distinct_key: ${ga_join_id} ;;
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
    type: sum_distinct
    sql_distinct_key: ${ga_join_id} ;;
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
    type: sum_distinct
    sql_distinct_key: ${ga_join_id} ;;
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
    type: sum_distinct
    sql_distinct_key: ${ga_join_id} ;;
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
    type: sum_distinct
    sql_distinct_key: ${ga_join_id} ;;
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
    type: sum_distinct
    sql_distinct_key: ${ga_join_id} ;;
    sql: ${concierge_form_submissions} ;;
  }

  measure: total_enewsletter_sign_up {
    group_label: "GA Reporting Goals"
    label: "E-Newsletter Sign Up"
    type: sum_distinct
    sql_distinct_key: ${ga_join_id} ;;
    sql: ${enewsletter_sign_up} ;;
  }

  measure: total_partner_referral {
    group_label: "GA Reporting Goals"
    label: "Partner Referrals"
    type: sum_distinct
    sql_distinct_key: ${ga_join_id} ;;
    sql: ${partner_referral} ;;
  }

  measure: total_view_guide_online {
    group_label: "GA Reporting Goals"
    label: "View Guide Online"
    type: sum_distinct
    sql_distinct_key: ${ga_join_id} ;;
    sql: ${view_guide_online} ;;
  }

  measure: total_guide_hard_copy_sign_up {
    group_label: "GA Reporting Goals"
    label: "Guide Hard Copy Side Up"
    type: sum_distinct
    sql_distinct_key: ${ga_join_id} ;;
    sql: ${guide_hard_copy_sign_up} ;;
  }

  measure: total_tos_above_45s {
    group_label: "GA Reporting Goals"
    label: "TOS Above 45s"
    type: sum_distinct
    sql_distinct_key: ${ga_join_id} ;;
    sql: ${tos_above_45s} ;;
  }

  measure: count {
    hidden: yes
    type: count
    drill_fields: []
  }
}
