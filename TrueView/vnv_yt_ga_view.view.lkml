view: vnv_yt_ga_view {
  sql_table_name: public.vnv_yt_ga_view ;;

#### Primary Key ####

  dimension: ga_join_id {
    type: string
    primary_key: yes
    hidden: yes
    sql: ${TABLE}.ga_join_id  ;;
  }

##### Dimensions added to this table via LookML ######

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

  dimension: ad_size {
    type: string
    hidden: yes
    sql: 'Video' ;;
  }

  dimension: vnv_campaign {
    label: "Campaign Name"
    type: string
    group_label: "Client Dimensions"
    sql:
      CASE
        WHEN ${campaign} ilike '%Phase2%' then 'FY21 Better With Time'
        WHEN ${campaign} ilike '%Phase3%' then 'FY21 Raise A Glass'
        WHEN ${campaign} ilike '%Phase4%' then 'FY21 Raise A Glass'
        WHEN ${account} = 'VNV Foundational TrueView' then 'Foundational'
        ELSE 'Uncategorized'
        END;;
  }

  dimension: vnv_placement {
    label: "Placement Name"
    type: string
    group_label: "Client Dimensions"
    sql:
      CASE
        WHEN ${campaign} = 'FY20_VNV_Foundational_TrueView' then 'YouTube Skipabble Pre-Roll Video'
        WHEN ${campaign} ILIKE 'FY20_VNV_COVID19Recovery%' then 'YouTube Skipabble Pre-Roll Video'
        ELSE 'Uncategorized'
        END;;
  }

  dimension: creative_name {
    type:  string
    group_label: "Client Dimensions"
    sql:
      CASE
        when ${campaign} ilike 'FY20_VNV_Foundational_Trueview' then 'Uncateogrized (Multiple)'
        WHEN ${campaign} = 'FY20_VNV_COVID19Recovery_Phase2_TrueView' then 'Better With Time (:30)'
        WHEN ${ad_group} = 'FY20_VNV_COVID19Recovery_Phase2_TrueView_AspirationalAudience_Poolside' then 'Poolside (:15)'
        WHEN ${ad_group} = 'FY20_VNV_COVID19Recovery_Phase2_TrueView_AspirationalAudience_WindingTrails' then 'Winding Trails (:15)'
        WHEN ${ad_group} = 'FY20_VNV_COVID19Recovery_Phase2_TrueView_LuxuryAudience_Poolside' then 'Poolside (:15)'
        WHEN ${ad_group} = 'FY20_VNV_COVID19Recovery_Phase2_TrueView_LuxuryAudience_WindingTrails' then 'Winding Trails (:15)'

        when ${ad_group} ilike '%WanderingTrails%' then 'Wandering Trails (:15)'
        when ${ad_group} ilike '%RollingHills%' then 'Rolling Hills (:15)'
        when ${ad_group} ilike '%30Video%' then 'Raise A Glass (:30)'

        else 'Uncategorized'
        END
    ;;
  }

  dimension: phase {
    type: string
    group_label: "Client Dimensions"
    label: "Phase"
    sql:
    CASE
      WHEN ${campaign} ilike '%phase2%' then 'Phase 2'
      WHEN ${campaign} ilike '%phase3%' then 'Phase 3'
      else 'Uncategorized'
      end
  ;;
  }

#### All Dimensions go below ####

  dimension: account {
    type: string
    group_label: "Trueview Dimensions"
    sql: ${TABLE}.account ;;
  }

  dimension: ad_group {
    type: string
    group_label: "Trueview Dimensions"
    sql: ${TABLE}."ad group" ;;
  }

  dimension: ad_group_id {
    type: number
    group_label: "Trueview IDs"
    sql: ${TABLE}."ad group id" ;;
  }

  dimension: bounces {
    type: number
    hidden: yes
    sql: ${TABLE}.bounces ;;
  }

  dimension: campaign {
    type: string
    group_label: "Trueview Dimensions"
    sql: ${TABLE}.campaign ;;
  }

  dimension: campaign_id {
    type: number
    group_label: "Trueview IDs"
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

  dimension: users {
    type: number
    hidden: yes
    sql: ${TABLE}.users ;;
  }

  dimension: views {
    type: number
    hidden: yes
    sql: ${TABLE}.views ;;
  }

  dimension: video_completes {
    type: number
    hidden: yes
    sql: ${TABLE}.views_to_q100 ;;
  }

  dimension: views_to_q25 {
    type: number
    hidden: yes
    sql: ${TABLE}.views_to_q25 ;;
  }

  dimension: views_to_q50 {
    type: number
    hidden: yes
    sql: ${TABLE}.views_to_q50 ;;
  }

  dimension: views_to_q75 {
    type: number
    hidden: yes
    sql: ${TABLE}.views_to_q75 ;;
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

#### All Measures Go Below ####

  measure: total_impressions {
    type: sum_distinct
    group_label: "Trueview Reporting"
    sql_distinct_key: ${ga_join_id} ;;
    sql: ${impressions} ;;
  }

  measure: total_clicks {
    type: sum_distinct
    group_label: "Trueview Reporting"
    sql_distinct_key: ${ga_join_id} ;;
    sql: ${clicks} ;;
  }

  measure: total_cost {
    type:  sum_distinct
    group_label: "Trueview Reporting"
    sql_distinct_key: ${ga_join_id} ;;
    sql:${cost}/1000000.00  ;;
    value_format_name: usd
  }

  measure: total_conversions {
    type: sum_distinct
    group_label: "Trueview Reporting"
    sql_distinct_key: ${ga_join_id} ;;
    sql: ${conversions} ;;
  }

  measure: click_through_rate  {
    label: "CTR"
    group_label: "Trueview Reporting"
    type: number
    sql: ${total_clicks}/nullif(${total_impressions}, 0) ;;
    value_format_name: percent_2
  }

  measure: cost_per_click {
    label: "CPC"
    group_label: "Trueview Reporting"
    type: number
    sql: ${total_cost}/nullif(${total_clicks}, 0) ;;
    value_format_name: usd
  }

  measure: cost_per_thousand  {
    label: "CPM"
    group_label: "Trueview Reporting"
    type: number
    sql: ${total_cost}/nullif(${total_impressions}/1000, 0) ;;
    value_format_name: usd
  }

  measure: total_conversion_rate  {
    label: "CVR"
    group_label: "Trueview Reporting"
    type: number
    sql: ${total_conversions}/nullif(${total_clicks}, 0) ;;
    value_format_name: percent_2
  }

  measure: cost_per_conversion {
    label: "CPA"
    group_label: "Trueview Reporting"
    type: number
    sql: ${total_cost}/nullif(${total_conversions} ,0);;
    value_format_name: usd
  }

  measure: total_views {
    type: sum_distinct
    label: "Video Views"
    group_label: "Trueview Reporting"
    sql_distinct_key: ${ga_join_id} ;;
    sql: ${views} ;;
  }

  measure: cost_per_view {
    label: "CPV"
    group_label: "Trueview Reporting"
    type: number
    sql: ${total_cost}/nullif(${total_views}, 0) ;;
    value_format_name: usd
  }

  measure: total_views_to_q25 {
    type: sum_distinct
    group_label: "Trueview Quartile Reporting"
    label: "Views To 25%"
    value_format_name: decimal_0
    hidden: no
    sql_distinct_key: ${ga_join_id} ;;
    sql: ${views_to_q25} ;;
  }

  measure: total_views_to_q50 {
    type: sum_distinct
    group_label: "Trueview Quartile Reporting"
    label: "Views To 50%"
    value_format_name: decimal_0
    hidden: no
    sql_distinct_key: ${ga_join_id} ;;
    sql: ${views_to_q50} ;;
  }

  measure: total_views_to_q75 {
    type: sum_distinct
    group_label: "Trueview Quartile Reporting"
    label: "Views To 75%"
    value_format_name: decimal_0
    hidden: no
    sql_distinct_key: ${ga_join_id} ;;
    sql: ${views_to_q75} ;;
  }

  measure: total_video_completes {
    type: sum_distinct
    value_format_name: decimal_0
    label: "Video Completes"
    group_label: "Trueview Reporting"
    hidden: no
    sql_distinct_key: ${ga_join_id} ;;
    sql: ${video_completes} ;;
  }

  measure: view_at_q25_rate  {
    label: "% Played to 25%"
    group_label: "Trueview Quartile Reporting"
    type: number
    sql: ${total_views_to_q25}/nullif(${total_impressions}, 0) ;;
    value_format_name: percent_2
  }

  measure: view_at_q50_rate  {
    label: "% Played to 50%"
    group_label: "Trueview Quartile Reporting"
    type: number
    sql: ${total_views_to_q50}/nullif(${total_impressions}, 0) ;;
    value_format_name: percent_2
  }

  measure: view_at_q75_rate  {
    label: "% Played to 75%"
    group_label: "Trueview Quartile Reporting"
    type: number
    sql: ${total_views_to_q75}/nullif(${total_impressions}, 0) ;;
    value_format_name: percent_2
  }

  measure: view_rate  {
    label: "View Rate"
    group_label: "Trueview Reporting"
    type: number
    sql: ${total_views}/nullif(${total_impressions}, 0) ;;
    value_format_name: percent_2
  }

  measure: completion_rate  {
    label: "Completion Rate"
    group_label: "Trueview Reporting"
    type: number
    sql: ${total_video_completes}/nullif(${total_impressions}, 0) ;;
    value_format_name: percent_2
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
}
