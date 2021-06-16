view: vnv_linkedin_ga_agg_view {
  sql_table_name: public.vnv_linkedin_ga_agg_view ;;

  ## Primary Key ##

  dimension: ga_join_id {
    hidden: yes
    primary_key: yes
    type: string
    sql: ${TABLE}.ga_join_id ;;
  }

  ## Dimensions Added to Table via LookML ##

  dimension: publisher {
    type: string
    group_label: "Client Dimensions"
    sql: 'LinkedIn' ;;
  }

  # dimension: advertising_channel {
  #   type: string
  #   hidden: yes
  #   sql: 'Social' ;;
  # }

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
        WHEN ${date_date} BETWEEN '2015-07-01' AND '2016-06-30' THEN 'FY 15/16'
        WHEN ${date_date} BETWEEN '2016-07-01' AND '2017-06-30' THEN 'FY 16/17'
        WHEN ${date_date} BETWEEN '2017-07-01' AND '2018-06-30' THEN 'FY 17/18'
        WHEN ${date_date} BETWEEN '2018-07-01' AND '2019-06-30' THEN 'FY 18/19'
        WHEN ${date_date} BETWEEN '2019-07-01' AND '2020-06-30' THEN 'FY 19/20'
        WHEN ${date_date} BETWEEN '2020-07-01' AND '2021-06-30' THEN 'FY 20/21'
        WHEN ${date_date} BETWEEN '2021-07-01' AND '2022-06-30' THEN 'FY 21/22'
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
       when ${campaign_name} ilike 'VNV_FY21_GroupMeetings%' then 'FY21 Group'
       ELSE 'Uncategorized'
       END;;
  }

  dimension: vnv_placement {
    label: "Placement Name"
    group_label: "Client Dimensions"
    type: string
    sql:
      CASE
      when ${campaign_name} ilike 'VNV_FY21_GroupMeetings_VideoViews%' then 'Group Meetings - Video'
      when ${campaign_name} ilike 'VNV_FY21_GroupMeetings_Skills%' then 'Group Meetings - Skills'
      when ${campaign_name} ilike 'VNV_FY21_GroupMeetings_Jobs%' then 'Group Meetings - Jobs'
      when ${campaign_name} ilike 'VNV_FY21_GroupMeetings_Groups%' then 'Group Meetings - Groups'
      when ${campaign_name} ilike 'VNV_FY21_GroupMeetings_CombinedAudience%' then 'Group Meetings - Combined Audience'
      ELSE 'Uncategorized'
       END;;
  }

  dimension: vnv_creative_name {
    group_label: "Client Dimensions"
    label: "Creative Name"
    type: string
    sql:
      CASe
        when ${campaign_name} ilike 'VNV_FY21_GroupMeetings_VideoViews' then 'Group Meetings (1:15)'
        when ${creative_id} ilike '121180426' then 'Meet. Connect. Unwind.'
        when ${creative_id} ilike '121180396' then 'Crush that meeting.'
        when ${creative_id} ilike '120568486' then 'Crush that meeting.'
        when ${creative_id} ilike '121180416' then 'Crush That Meeting'
        when ${creative_id} ilike '120276926' then 'Crush That Meeting'
        when ${creative_id} ilike '120568456' then 'Crush That Meeting'
        when ${creative_id} ilike '121180406' then 'Better meetings are back.'
        when ${creative_id} ilike '120568516' then 'Better meetings are back.'
        when ${creative_name} ilike '%SinlgeImage_Version9' then 'Sponsored Content v9'
        when ${creative_name} ilike '%SinlgeImage_Version1' then 'Sponsored Content v1'
        when ${creative_name} ilike '%SinlgeImage_Version2' then 'Sponsored Content v2'
        when ${creative_name} ilike '%Version3' then 'Sponsored Content v3'
        when ${creative_name} ilike '%Version4' then 'Sponsored Content v4'
        when ${creative_name} ilike '%Version5' then 'Sponsored Content v5'
        when ${creative_name} ilike '%SinlgeImage_Version6' then 'Sponsored Content v6'
        when ${creative_name} ilike '%SinlgeImage_Version7' then 'Sponsored Content v7'
        when ${creative_name} ilike '%SinlgeImage_Version8' then 'Sponsored Content v8'
        when ${creative_name} ilike '%SinlgeImage_Version11' then 'Sponsored Content v11'
        when ${creative_name} ilike '%SinlgeImage_Version10' then 'Sponsored Content v10'


        ELSE 'Uncategorized'
        END;;
  }

  dimension: ad_size {
    type: string
    group_label: "LinkedIn Dimensions"
    label: "Ad Size"
    sql:
      CASE
        when ${campaign_name} ilike '%VideoViews' then 'Video'
        when ${campaign_name} ilike '%SingleImage' then 'Single Image'
        when ${campaign_name} ilike '%TextAd' then 'Text Ad'
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
      WHEN ${campaign_name} ilike '%phase2%' then 'Phase 2'
      WHEN ${campaign_name} ilike '%phase3%' then 'Phase 3'
      WHEN ${campaign_name} ilike '%phase4%' then 'Phase 4'
      else 'Uncategorized'
      end
  ;;
  }

  ## Dimensions Native to Table Below ##

  dimension: bounces {
    type: number
    hidden: yes
    sql: ${TABLE}.bounces ;;
  }

  dimension: campaign_id {
    type: string
    group_label: "LinkedIn IDs"
    sql: ${TABLE}.campaign_id ;;
  }

  dimension: campaign_name {
    type: string
    group_label: "LinkedIn Dimensions"
    sql: ${TABLE}.campaign_name ;;
  }

  dimension: clicks {
    type: number
    hidden: yes
    sql: ${TABLE}.clicks ;;
  }

  dimension: concierge_form_submissions {
    type: number
    hidden: yes
    sql: ${TABLE}.concierge_form_submissions ;;
  }

  dimension: cost {
    type: number
    hidden: yes
    sql: ${TABLE}.cost ;;
  }

  dimension: creative_id {
    type: number
    group_label: "LinkedIn IDs"
    sql: ${TABLE}.creative_id ;;
  }

  dimension: creative_name {
    type: string
    group_label: "LinkedIn Dimensions"
    sql: ${TABLE}.creative_name ;;
  }

  dimension_group: date {
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
    sql: ${TABLE}.date ;;
  }

  dimension: enewsletter_sign_up {
    type: number
    hidden: yes
    sql: ${TABLE}.enewsletter_sign_up ;;
  }

  dimension: guide_hard_copy_sign_up {
    type: number
    hidden: yes
    sql: ${TABLE}.guide_hard_copy_sign_up ;;
  }

  dimension: impressions {
    type: number
    hidden: yes
    sql: ${TABLE}.impressions ;;
  }

  dimension: newusers {
    type: number
    hidden: yes
    sql: ${TABLE}.newusers ;;
  }

  dimension: pageviews {
    type: number
    hidden: yes
    sql: ${TABLE}.pageviews ;;
  }

  dimension: partner_referral {
    type: number
    hidden: yes
    sql: ${TABLE}.partner_referral ;;
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

  dimension: tos_above_45s {
    type: number
    hidden: yes
    sql: ${TABLE}.tos_above_45s ;;
  }

  dimension: users {
    type: number
    hidden: yes
    sql: ${TABLE}.users ;;
  }

  dimension: video_completions {
    type: number
    hidden: yes
    sql: ${TABLE}.video_completions ;;
  }

  dimension: video_views {
    type: number
    hidden: yes
    sql: ${TABLE}.video_views ;;
  }

  dimension: view_guide_online {
    type: number
    hidden: yes
    sql: ${TABLE}.view_guide_online ;;
  }

  ## Measures Below ##

###### All Measures go Below #######

  measure: total_impressions {
    type: sum_distinct
    group_label: "LinkedIn Reporting"
    sql_distinct_key: ${ga_join_id} ;;
    sql: ${impressions} ;;
  }

  measure: total_clicks {
    type: sum_distinct
    group_label: "LinkedIn Reporting"
    sql_distinct_key: ${ga_join_id} ;;
    sql: ${clicks} ;;
  }

  measure: total_cost {
    type:  sum_distinct
    group_label: "LinkedIn Reporting"
    sql_distinct_key: ${ga_join_id} ;;
    sql: ${cost} ;;
    value_format_name: usd
  }

  measure: click_through_rate  {
    label: "CTR"
    group_label: "LinkedIn Reporting"
    type: number
    sql: ${total_clicks}/nullif(${total_impressions}, 0) ;;
    value_format_name: percent_2
  }

  measure: cost_per_click {
    label: "CPC"
    group_label: "LinkedIn Reporting"
    type: number
    sql: ${total_cost}/nullif(${total_clicks}, 0) ;;
    value_format_name: usd
  }

  measure: cost_per_thousand  {
    label: "CPM"
    group_label: "LinkedIn Reporting"
    type: number
    sql: ${total_cost}/nullif(${total_impressions}/1000, 0) ;;
    value_format_name: usd
  }

  measure: total_views {
    type: sum_distinct
    label: "Video Views"
    group_label: "LinkedIn Reporting"
    sql_distinct_key: ${ga_join_id} ;;
    sql: ${video_views} ;;
  }

  measure: total_completes {
    type: sum_distinct
    label: "Video Completions"
    group_label: "LinkedIn Reporting"
    sql_distinct_key: ${ga_join_id} ;;
    sql: ${video_completions} ;;
  }

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
    sql: ${total_cost}/nullif(${total_sessions}, 0) ;;
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
  }
}
