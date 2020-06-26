view: vnv_pinterest_ga_view {
  sql_table_name: public.vnv_pinterest_ga_view ;;

  ### Primary Key ###

  dimension: ga_join_id {
    type: string
    hidden: yes
    primary_key: yes
    sql: ${TABLE}.ga_join_id ;;
  }

#### Dimensions Added to this table via LookML ####

  dimension: publisher {
    type: string
    group_label: "Pinterest Dimensions"
    sql: 'Pinterest' ;;
  }

  dimension: fiscal_year {
    type:  string
    group_label: "Date Periods"
    sql:
      CASE
      WHEN ${date_date} BETWEEN '2013-07-01' AND '2014-06-30' THEN 'FY 13/14'
      WHEN ${date_date} BETWEEN '2014-07-01' AND '2015-06-30' THEN 'FY 14/15'
      WHEN ${date_date} BETWEEN '2015-07-01' AND '2016-06-30' THEN 'FY 15/16'
      WHEN ${date_date} BETWEEN '2016-07-01' AND '2017-06-30' THEN 'FY 16/17'
      WHEN ${date_date} BETWEEN '2017-07-01' AND '2018-06-30' THEN 'FY 17/18'
      WHEN ${date_date} BETWEEN '2018-07-01' AND '2019-06-30' THEN 'FY 18/19'
      WHEN ${date_date} BETWEEN '2019-07-01' AND '2020-06-30' THEN 'FY 19/20'
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
       when ${campaign_name} ilike '%FY20_VNV%' then 'Foundational'

       ELSE 'Uncategorized'
       END;;
  }

  dimension: vnv_placement {
    label: "Placement Name"
    group_label: "Client Dimensions"
    type: string
    sql:
      CASE
      when ${campaign_name} ilike '%VideoPins%' then 'Video Pins'
      when ${promoted_pin_name} ilike '%StandardPin%' then 'Standard Pins'
      when ${promoted_pin_name} ilike '%CarouselPin%' then 'Carousel Pins'


      ELSE 'Uncategorized'
       END;;
  }

  dimension: creative_name {
    group_label: "Client Dimensions"
    type: string
    sql:
      CASE
        WHEN ${promoted_pin_name} ilike '%videopins_theweekend' then 'The Weekend (:15)'
        WHEN ${promoted_pin_name} ilike '%videopins_stunningharmony' then 'Stunning Harmony (:15)'
        WHEN ${promoted_pin_name} ilike '%videopins_nextsip' then 'Next Sip (:15)'

        WHEN ${promoted_pin_name} ilike '%standardpin_winepersonality' then 'Wine Personality'
        WHEN ${promoted_pin_name} ilike '%standardpin_topten' then 'Top Ten Things To Do'
        WHEN ${promoted_pin_name} ilike '%standardpin_romanticbbs' then 'Romantic B&B''s'
        WHEN ${promoted_pin_name} ilike '%standardpin_roadtripping' then 'Road Tripping'
        WHEN ${promoted_pin_name} ilike '%standardpin_prettiestspas' then 'Prettiest Spas'
        WHEN ${promoted_pin_name} ilike '%standardpin_outdoorexcursions' then 'Outdoor Excursions'
        WHEN ${promoted_pin_name} ilike '%carouselpin%' then 'Carousel Pin'

        ELSE ${promoted_pin_name}
        END;;
  }


  ### Dimensions Native to Table go Below ###

  dimension: ad_group_id {
    type: string
    group_label: "Pinterest IDs"
    sql: ${TABLE}.ad_group_id ;;
  }

  dimension: ad_group_name {
    type: string
    group_label: "Pinterest Dimensions"
    sql: ${TABLE}.ad_group_name ;;
  }

  dimension: bounces {
    type: number
    hidden: yes
    sql: ${TABLE}.bounces ;;
  }

  dimension: campaign_id {
    type: string
    group_label: "Pinterest IDs"
    sql: ${TABLE}.campaign_id ;;
  }

  dimension: campaign_name {
    type: string
    group_label: "Pinterest Dimensions"
    sql: ${TABLE}.campaign_name ;;
  }

  dimension: campaign_objective {
    type: string
    group_label: "Pinterest Dimensions"
    sql: ${TABLE}.campaign_objective ;;
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

  dimension_group: date {
    type: time
    label: ""
    group_label: "Date Periods"
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

  dimension: earned_clicks {
    type: number
    hidden: yes
    sql: ${TABLE}.earned_clicks ;;
  }

  dimension: earned_impressions {
    type: number
    hidden: yes
    sql: ${TABLE}.earned_impressions ;;
  }

  dimension: earned_saves {
    type: number
    hidden: yes
    sql: ${TABLE}.earned_saves ;;
  }

  dimension: earned_video_views {
    type: number
    hidden: yes
    sql: ${TABLE}.earned_video_views ;;
  }

  dimension: earned_views_at_100 {
    type: number
    hidden: yes
    sql: ${TABLE}.earned_views_at_100 ;;
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

  dimension: paid_clicks {
    type: number
    hidden: yes
    sql: ${TABLE}.paid_clicks ;;
  }

  dimension: paid_impressions {
    type: number
    hidden: yes
    sql: ${TABLE}.paid_impressions ;;
  }

  dimension: paid_saves {
    type: number
    hidden: yes
    sql: ${TABLE}.paid_saves ;;
  }

  dimension: paid_video_views {
    type: number
    hidden: yes
    sql: ${TABLE}.paid_video_views ;;
  }

  dimension: paid_views_at_100 {
    type: number
    hidden: yes
    sql: ${TABLE}.paid_views_at_100 ;;
  }

  dimension: partner_referral {
    type: number
    hidden: yes
    sql: ${TABLE}.partner_referral ;;
  }

  dimension: pin_description {
    type: string
    group_label: "Pinterest Dimensions"
    sql: ${TABLE}.pin_description ;;
  }

  dimension: pin_id {
    type: string
    group_label: "Pinterest IDs"
    sql: ${TABLE}.pin_id ;;
  }

  dimension: promoted_pin_id {
    type: string
    group_label: "Pinterest IDs"
    sql: ${TABLE}.promoted_pin_id ;;
  }

  dimension: promoted_pin_name {
    type: string
    group_label: "Pinterest Dimensions"
    sql: ${TABLE}.promoted_pin_name ;;
  }

  dimension: saves {
    type: number
    hidden: yes
    sql: ${TABLE}.saves ;;
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

  dimension: video_starts {
    type: number
    hidden: yes
    sql: ${TABLE}.video_starts ;;
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

  dimension: views_at_100 {
    type: number
    hidden: yes
    sql: ${TABLE}.views_at_100 ;;
  }

  dimension: views_at_25 {
    type: number
    hidden: yes
    sql: ${TABLE}.views_at_25 ;;
  }

  dimension: views_at_50 {
    type: number
    hidden: yes
    sql: ${TABLE}.views_at_50 ;;
  }

  dimension: views_at_75 {
    type: number
    hidden: yes
    sql: ${TABLE}.views_at_75 ;;
  }

  dimension: views_at_95 {
    type: number
    hidden: yes
    sql: ${TABLE}.views_at_95 ;;
  }

#### All Measures go Below ###

  measure: total_spend {
    type: sum_distinct
    group_label: "Total Delivery"
    sql_distinct_key: ${ga_join_id} ;;
    sql: ${cost} ;;
    value_format_name: usd
  }

  measure: total_impressions {
    type: sum_distinct
    group_label: "Total Delivery"
    sql_distinct_key: ${ga_join_id} ;;
    sql: ${impressions} ;;
  }

  measure: total_clicks {
    type: sum_distinct
    group_label: "Total Delivery"
    sql_distinct_key: ${ga_join_id} ;;
    sql: ${clicks} ;;
  }

  measure: click_through_rate  {
    label: "CTR"
    type: number
    group_label: "Total Delivery"
    sql: ${total_clicks}/nullif(${total_impressions}, 0) ;;
    value_format_name: percent_2
  }

  measure: cost_per_click {
    label: "CPC"
    type: number
    group_label: "Total Delivery"
    sql: ${total_spend}/nullif(${total_clicks}, 0) ;;
    value_format_name: usd
  }

  measure: cost_per_thousand  {
    label: "CPM"
    type: number
    group_label: "Total Delivery"
    sql: ${total_spend}/nullif(${total_impressions}/1000, 0) ;;
    value_format_name: usd
  }

  measure: total_conversions {
    type: sum_distinct
    group_label: "Total Delivery"
    sql_distinct_key: ${ga_join_id} ;;
    sql: ${conversions} ;;
  }

  measure: total_saves {
    group_label: "Total Delivery"
    type: sum_distinct
    sql_distinct_key: ${ga_join_id} ;;
    sql: ${saves} ;;
  }

  measure: total_video_starts {
    type: sum_distinct
    group_label: "Total Video Metrics"
    sql_distinct_key: ${ga_join_id} ;;
    sql: ${video_starts} ;;
  }

  measure: total_video_views {
    type: sum_distinct
    group_label: "Total Video Metrics"
    sql_distinct_key: ${ga_join_id} ;;
    sql: ${video_views} ;;
  }

  measure: total_view_rate  {
    label: "View Rate"
    type: number
    group_label: "Total Video Metrics"
    sql: ${total_video_views}/nullif(${total_impressions}, 0) ;;
    value_format_name: percent_2
  }

  measure: total_completion_rate  {
    label: "VCR"
    type: number
    group_label: "Total Video Metrics"
    sql: ${total_views_at_100}/nullif(${total_impressions}, 0) ;;
    value_format_name: percent_2
  }

  measure: total_views_at_100 {
    type: sum_distinct
    group_label: "Total Video Metrics"
    sql_distinct_key: ${ga_join_id} ;;
    sql: ${views_at_100} ;;
  }

  measure: total_views_fndl {
    type: sum_distinct
    hidden: yes
    group_label: "Total Video Metrics"
    sql_distinct_key: ${ga_join_id} ;;
    sql: ${views_at_100} ;;
  }

  measure: total_views_at_25 {
    type: sum_distinct
    group_label: "Total Video Metrics"
    sql_distinct_key: ${ga_join_id} ;;
    sql: ${views_at_25} ;;
  }

  measure: total_views_at_50 {
    type: sum_distinct
    group_label: "Total Video Metrics"
    sql_distinct_key: ${ga_join_id} ;;
    sql: ${views_at_50} ;;
  }

  measure: total_views_at_75 {
    type: sum_distinct
    group_label: "Total Video Metrics"
    sql_distinct_key: ${ga_join_id} ;;
    sql: ${views_at_75} ;;
  }

  measure: total_views_at_95 {
    type: sum_distinct
    group_label: "Total Video Metrics"
    sql_distinct_key: ${ga_join_id} ;;
    sql: ${views_at_95} ;;
  }

  ### Paid Measures ###

  measure: total_paid_impressions {
    type: sum_distinct
    group_label: "Paid Metrics"
    sql_distinct_key: ${ga_join_id} ;;
    sql: ${paid_impressions} ;;
  }

  measure: total_paid_clicks {
    type: sum_distinct
    group_label: "Paid Metrics"
    sql_distinct_key: ${ga_join_id} ;;
    sql: ${paid_clicks} ;;
  }

  measure: paid_ctr  {
    label: "Paid CTR"
    type: number
    group_label: "Paid Metrics"
    sql: ${total_paid_clicks}/nullif(${total_paid_impressions}, 0) ;;
    value_format_name: percent_2
  }

  measure: total_paid_saves {
    type: sum_distinct
    group_label: "Paid Metrics"
    sql_distinct_key: ${ga_join_id} ;;
    sql: ${paid_saves} ;;
  }

  measure: total_paid_views_at_100 {
    type: sum_distinct
    group_label: "Paid Metrics"
    sql_distinct_key: ${ga_join_id} ;;
    sql: ${paid_views_at_100} ;;
  }

  measure: total_paid_video_views {
    type: sum_distinct
    group_label: "Paid Metrics"
    sql_distinct_key: ${ga_join_id} ;;
    sql: ${paid_video_views} ;;
  }

  measure: paid_cpc {
    label: "Paid CPC"
    type: number
    group_label: "Paid Metrics"
    sql: ${total_spend}/nullif(${total_paid_clicks}, 0) ;;
    value_format_name: usd
  }

  measure: paid_cpm  {
    label: "Paid CPM"
    type: number
    group_label: "Paid Metrics"
    sql: ${total_spend}/nullif(${total_paid_impressions}/1000, 0) ;;
    value_format_name: usd
  }

  measure: total_paid_view_rate  {
    type: number
    group_label: "Paid Metrics"
    sql: ${total_paid_video_views}/nullif(${total_paid_impressions}, 0) ;;
    value_format_name: percent_2
  }

  measure: total_paid_completion_rate  {
    label: "Paid VCR"
    type: number
    group_label: "Paid Metrics"
    sql: ${total_earned_video_views}/nullif(${total_paid_impressions}, 0) ;;
    value_format_name: percent_2
  }

  ### Earned Measures ###

  measure: total_earned_impressions {
    type: sum_distinct
    group_label: "Earned Metrics"
    sql_distinct_key: ${ga_join_id} ;;
    sql: ${earned_impressions} ;;
  }

  measure: total_earned_clicks {
    type: sum_distinct
    group_label: "Earned Metrics"
    sql_distinct_key: ${ga_join_id} ;;
    sql: ${earned_clicks} ;;
  }

  measure: earned_ctr  {
    label: "Earned CTR"
    type: number
    group_label: "Earned Metrics"
    sql: ${total_earned_clicks}/nullif(${total_earned_impressions}, 0) ;;
    value_format_name: percent_2
  }

  measure: total_earned_saves {
    type: sum_distinct
    group_label: "Earned Metrics"
    sql_distinct_key: ${ga_join_id} ;;
    sql: ${earned_saves} ;;
  }

  measure: total_earned_views_at_100 {
    type: sum_distinct
    group_label: "Earned Metrics"
    sql_distinct_key: ${ga_join_id} ;;
    sql: ${earned_views_at_100} ;;
  }

  measure: total_earned_video_views {
    type: sum_distinct
    group_label: "Earned Metrics"
    sql_distinct_key: ${ga_join_id} ;;
    sql: ${earned_video_views} ;;
  }

  measure: total_earned_view_rate  {
    type: number
    group_label: "Earned Metrics"
    sql: ${total_earned_video_views}/nullif(${total_earned_impressions}, 0) ;;
    value_format_name: percent_2
  }

  measure: total_earned_completion_rate  {
    label: "Earned VCR"
    type: number
    group_label: "Earned Metrics"
    sql: ${total_earned_video_views}/nullif(${total_earned_impressions}, 0) ;;
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

}
