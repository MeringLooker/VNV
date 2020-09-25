view: vnv_gdn_ga_view {
  sql_table_name: public.vnv_gdn_ga_view ;;


###### Primary Key #######

  dimension: comp_key {
    type: string
    primary_key: yes
    hidden: yes
    sql: ${TABLE}.ga_join_id ;;
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
    sql: 'Display' ;;
  }

  dimension: publisher {
    type: string
    label: "Publisher"
    group_label: "AdWords Dimensions"
    sql: 'Google Display' ;;
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
        WHEN ${account} = 'VNV Foundational GDN' THEN 'Foundational'
        WHEN ${account} = 'VNV Objective 3 GDN' THEN 'Impact'
        ELSE 'Uncategorized'
        END;;
  }

  dimension: bwt_campaign {
    label: "Campaign Name"
    type: string
    group_label: "Client Dimensions"
    sql:
      CASE
        WHEN ${campaign} ilike '%Phase2%' then 'Better With Time'
        ELSE 'Uncategorized'
        END;;
  }

  dimension: rag_campaign {
    label: "Campaign Name"
    type: string
    group_label: "Client Dimensions"
    sql:
      CASE
        WHEN ${campaign} ilike '%Phase3%' then 'Raise A Glass'
        ELSE 'Uncategorized'
        END;;
  }

  dimension: vnv_placement {
    type: string
    label: "Campaign Placement"
    group_label: "Client Dimensions"
    sql:
      CASE
        WHEN ${campaign_id} = '10867367221' THEN 'Responsive Display'
        WHEN ${campaign_id} = '10868153701' THEN 'Responsive Display'
        WHEN ${campaign_id} = '6555441529' THEN 'Responsive Display'
        WHEN ${campaign_id} = '10459516532' THEN 'Responsive Display'
        WHEN ${campaign_id} = '6555664518' THEN 'Static Display'
        WHEN ${campaign_id} = '6450595900' THEN 'Static Display'

        ELSE 'Uncategorized'
        END;;
  }

  dimension: ad_size {
    type: string
    label: "Ad Size"
    group_label: "AdWords Dimensions"
    sql:
      CASE
        WHEN ${campaign_id} = '6555441529' THEN 'Responsive Display'
        WHEN ${campaign_id} = '10459516532' THEN 'Responsive Display'
        WHEN ${campaign_id} = '6555664518' THEN 'Static Display'
        WHEN ${campaign_id} = '6450595900' THEN 'Static Display'

        ELSE 'Uncategorized'
        END;;
  }

  dimension: vnv_audience {
    type: string
    label: "Audience"
    group_label: "Client Dimensions"
    sql:
      CASE
        WHEN ${ad_group} ilike '%AspirationalAudience%' then 'Travel Buffs'
        WHEN ${ad_group} ilike '%Retargeting%' then 'Retargeting'
        WHEN ${ad_group} ilike '%LuxuryAudience%' then 'Luxury Travel'
        WHEN ${ad_group_id} = '84007501372' then 'Custom Intent'
        WHEN ${ad_group_id} = '78380941643' then 'Custom Intent'
        WHEN ${ad_group_id} = '84007501332' then 'Retargeting - Web Visitors'
        WHEN ${ad_group_id} = '78380941843' then 'Retargeting - Web Visitors'
        WHEN ${ad_group} ilike 'RTGPublisherTraffic%' then 'Retargeting - Publisher Traffic'
        WHEN ${ad_group} ilike 'SuperAffluentLookalikePublisherTraffic%' then 'Lookalike - Publisher Traffic'
        WHEN ${ad_group_id} = '82777330008' then 'Luxury Traveler'

        ELSE 'Uncategorized'
        END;;
  }

  #### Need to map gdn creative

  dimension: creative_name {
    hidden: yes
    type:  string
    group_label: "Client Dimensions"
    sql:
      CASE

        WHEN ${ad_group} =  'FY20_VNV_COVID19Recovery_Phase3_GDN_AspirationalAudience_General1' then  'General 1'
        WHEN ${ad_group} =  'FY20_VNV_COVID19Recovery_Phase3_GDN_AspirationalAudience_General2' then  'General 2'
        WHEN ${ad_group} =  'FY20_VNV_COVID19Recovery_Phase3_GDN_AspirationalAudience_Culinary1'  then  'Culinary 1'
        WHEN ${ad_group} =  'FY20_VNV_COVID19Recovery_Phase3_GDN_AspirationalAudience_Culinary2'  then  'Culinary 2'
        WHEN ${ad_group} =  'FY20_VNV_COVID19Recovery_Phase3_GDN_AspirationalAudience_OutdoorWellness1' then  'Outdoor Wellness 1'
        WHEN ${ad_group} =  'FY20_VNV_COVID19Recovery_Phase3_GDN_AspirationalAudience_OutdoorWellness2' then  'Outdoor Wellness 2'
        WHEN ${ad_group} =  'FY20_VNV_COVID19Recovery_Phase3_GDN_AspirationalAudience_Resort1'  then  'Resorts 1'
        WHEN ${ad_group} =  'FY20_VNV_COVID19Recovery_Phase3_GDN_AspirationalAudience_Resort2'  then  'Resorts 2'
        WHEN ${ad_group} =  'FY20_VNV_COVID19Recovery_Phase3_GDN_AspirationalAudience_Towns1' then  'Towns 1'
        WHEN ${ad_group} =  'FY20_VNV_COVID19Recovery_Phase3_GDN_AspirationalAudience_Towns2' then  'Towns 2'
        WHEN ${ad_group} =  'FY20_VNV_COVID19Recovery_Phase3_GDN_AspirationalAudience_Wineries1'  then  'Wineries 1'
        WHEN ${ad_group} =  'FY20_VNV_COVID19Recovery_Phase3_GDN_AspirationalAudience_Wineries2'  then  'Wineries 2'
        WHEN ${ad_group} =  'FY20_VNV_COVID19Recovery_Phase3_GDN_Retargeting_General1'  then  'General 1'
        WHEN ${ad_group} =  'FY20_VNV_COVID19Recovery_Phase3_GDN_Retargeting_General2'  then  'General 2'
        WHEN ${ad_group} =  'FY20_VNV_COVID19Recovery_Phase3_GDN_Retargeting_Culinary1' then  'Culinary 1'
        WHEN ${ad_group} =  'FY20_VNV_COVID19Recovery_Phase3_GDN_Retargeting_Culinary2' then  'Culinary 2'
        WHEN ${ad_group} =  'FY20_VNV_COVID19Recovery_Phase3_GDN_Retargeting_OutdoorWellness1'  then  'Outdoor Wellness 1'
        WHEN ${ad_group} =  'FY20_VNV_COVID19Recovery_Phase3_GDN_Retargeting_OutdoorWellness2'  then  'Outdoor Wellness 2'
        WHEN ${ad_group} =  'FY20_VNV_COVID19Recovery_Phase3_GDN_Retargeting_Resort1' then  'Resorts 1'
        WHEN ${ad_group} =  'FY20_VNV_COVID19Recovery_Phase3_GDN_Retargeting_Resort2' then  'Resorts 2'
        WHEN ${ad_group} =  'FY20_VNV_COVID19Recovery_Phase3_GDN_Retargeting_Towns1'  then  'Towns 1'
        WHEN ${ad_group} =  'FY20_VNV_COVID19Recovery_Phase3_GDN_Retargeting_Towns2'  then  'Towns 2'
        WHEN ${ad_group} =  'FY20_VNV_COVID19Recovery_Phase3_GDN_Retargeting_Wineries1' then  'Wineries 1'
        WHEN ${ad_group} =  'FY20_VNV_COVID19Recovery_Phase3_GDN_Retargeting_Wineries2' then  'Wineries 2'
        WHEN ${ad_group} =  'FY20_VNV_COVID19Recovery_Phase3_GDN_LuxuryAudience_General1' then  'General 1'
        WHEN ${ad_group} =  'FY20_VNV_COVID19Recovery_Phase3_GDN_LuxuryAudience_General2' then  'General 2'
        WHEN ${ad_group} =  'FY20_VNV_COVID19Recovery_Phase3_GDN_LuxuryAudience_Culinary1'  then  'Culinary 1'
        WHEN ${ad_group} =  'FY20_VNV_COVID19Recovery_Phase3_GDN_LuxuryAudience_Culinary2'  then  'Culinary 2'
        WHEN ${ad_group} =  'FY20_VNV_COVID19Recovery_Phase3_GDN_LuxuryAudience_OutdoorWellness1' then  'Outdoor Wellness 1'
        WHEN ${ad_group} =  'FY20_VNV_COVID19Recovery_Phase3_GDN_LuxuryAudience_OutdoorWellness2' then  'Outdoor Wellness 2'
        WHEN ${ad_group} =  'FY20_VNV_COVID19Recovery_Phase3_GDN_LuxuryAudience_Resort1'  then  'Resorts 1'
        WHEN ${ad_group} =  'FY20_VNV_COVID19Recovery_Phase3_GDN_LuxuryAudience_Resort2'  then  'Resorts 2'
        WHEN ${ad_group} =  'FY20_VNV_COVID19Recovery_Phase3_GDN_LuxuryAudience_Towns1' then  'Towns 1'
        WHEN ${ad_group} =  'FY20_VNV_COVID19Recovery_Phase3_GDN_LuxuryAudience_Towns2' then  'Towns 2'
        WHEN ${ad_group} =  'FY20_VNV_COVID19Recovery_Phase3_GDN_LuxuryAudience_Wineries1'  then  'Wineries 1'
        WHEN ${ad_group} =  'FY20_VNV_COVID19Recovery_Phase3_GDN_LuxuryAudience_Wineries2'  then  'Wineries 2'

        WHEN ${ad_group} = 'FY20_VNV_COVID19Recovery_Phase2_GDN_BeingTogether' then 'Being Together'
        WHEN ${ad_group} = 'FY20_VNV_COVID19Recovery_Phase2_GDN_Relaxation' then 'Relaxation'
        WHEN ${ad_group} = 'FY20_VNV_COVID19Recovery_Phase2_GDN_BreathtakingViews' then 'Breathtaking Views'
        WHEN ${ad_group} = 'FY20_VNV_COVID19Recovery_Phase2_GDN_FullStomach' then 'Full Stomach'
        WHEN ${ad_group} = 'FY20_VNV_COVID19Recovery_Phase2_GDN_Patience' then 'Patience'
        WHEN ${ad_group} = 'FY20_VNV_COVID19Recovery_Phase2_GDN_RaisingAGlass' then 'Raising A Glass'

        ELSE 'Uncategorized'
        END
    ;;
  }

  # dimension: phase {
  #   type: string
  #   group_label: "Client Dimensions"
  #   label: "Phase"
  #   sql:
  #   CASE
  #     WHEN ${campaign} ilike '%phase2%'the 'Phase 2'
  #     WHEN ${campaign} ilike '%phase3%'the 'Phase 3'
  # ;;
  # }

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

  ### Google Analytics Metrics ####

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

  ### Google Analytics Goals ####

  measure: total_concierge_form_submission {
    group_label: "GA Reporting Goals"
    label: "Concierge Form Submission"
    type: sum_distinct
    sql_distinct_key: ${comp_key} ;;
    sql: ${concierge_form_submissions} ;;
  }

  measure: total_enewsletter_sign_up {
    group_label: "GA Reporting Goals"
    label: "E-Newsletter Sign Up"
    type: sum_distinct
    sql_distinct_key: ${comp_key} ;;
    sql: ${enewsletter_sign_up} ;;
  }

  measure: total_partner_referral {
    group_label: "GA Reporting Goals"
    label: "Partner Referrals"
    type: sum_distinct
    sql_distinct_key: ${comp_key} ;;
    sql: ${partner_referral} ;;
  }

  measure: total_view_guide_online {
    group_label: "GA Reporting Goals"
    label: "View Guide Online"
    type: sum_distinct
    sql_distinct_key: ${comp_key} ;;
    sql: ${view_guide_online} ;;
  }

  measure: total_guide_hard_copy_sign_up {
    group_label: "GA Reporting Goals"
    label: "Guide Hard Copy Side Up"
    type: sum_distinct
    sql_distinct_key: ${comp_key} ;;
    sql: ${guide_hard_copy_sign_up} ;;
  }

  measure: total_tos_above_45s {
    group_label: "GA Reporting Goals"
    label: "TOS Above 45s"
    type: sum_distinct
    sql_distinct_key: ${comp_key} ;;
    sql: ${tos_above_45s} ;;
  }

  measure: count {
    hidden: yes
    type: count
    drill_fields: []
  }
}
