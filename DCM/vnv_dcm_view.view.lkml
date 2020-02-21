view: vnv_dcm_view {
  sql_table_name: public.vnv_dcm_view ;;
  drill_fields: [id]

######## PRIMARY KEY ########

  dimension: id {
    primary_key: yes
    hidden: yes
    type: string
    sql: ${TABLE}.id ;;
  }

######## GA Join ID ########

  dimension: comp_key {
    type: string
    hidden: yes
    sql: ${TABLE}.comp_key ;;
  }

  dimension: passback_join { ## placement ID + date ALWAYS
    type: string
    hidden: yes
    sql: ${placement_id}||'_'||${date_date} ;;
  }

  dimension: passback_join_ad { ## Ad ID + date ALWAYS
    type: string
    hidden: yes
    sql: ${ad_id}||'_'||${date_date} ;;
  }

######## Dimensions added to this table via LookML ########

  dimension: fiscal_year {
    type: string
    group_label: "Client Dimensions"
    label: "Fiscal Year"
    sql:
      CASE
        WHEN ${date_date} BETWEEN '2018-07-01' AND '2019-06-30' THEN 'FY 18/19'
        WHEN ${date_date} BETWEEN '2019-07-01' AND '2020-06-30' THEN 'FY 19/20'
        ELSE 'Uncategorized'
        END
        ;;
  }

  dimension: creative_name {
    type: string
    group_label: "Client Dimensions"
    sql:
      CASE
        when ${creative} ILIKE '%theweekend%' then 'The Weekend'
        when ${creative} ILIKE '%thenextsip%' then 'The Next Sip'
        when ${creative} ILIKE '%stunningharmony%' then 'Stunning Harmony'
        when ${creative} ILIKE '%3group%' then 'Group'
        when ${creative} ILIKE '%cabcab%' then 'Cab Cab'
        when ${creative} ILIKE '%group%' then 'Group'
        when ${creative} ILIKE '%refresh%' then 'Refresh'
        when ${creative} ILIKE '%seeforyourself%' then 'See For Yourself'
        ELSE ${creative}
        END;;
  }

  dimension: ad_size {
    type: string
    group_label: "DCM Dimensions"
    label: "Ad Size"
    sql:
      CASE
        when ${creative} ILIKE '%728x90%' then '728x90'
        when ${creative} ILIKE '%300x250%' then '300x250'
        when ${creative} ILIKE '%300x600%' then '300x600'
        when ${creative} ILIKE '%320x50%' then '320x50'
        when ${creative} ILIKE '%160x600%' then '160x600'
        when ${creative} ILIKE '%970x250%' then '970x250'
        when ${creative} ILIKE '%300x50%' then '300x50'
        when ${placement} ilike '%\\_728x90' then '728x90'
        when ${placement} ilike '%\\_300x250' then '300x250'
        when ${placement} ilike '%\\_160x600' then '160x600'
        when ${placement} ilike '%\\_468x60' then '468x60'
        when ${placement} ilike '%\\_300x50' then '300x50'
        when ${placement} ilike '%\\_970x90' then '970x90'
        when ${placement} ilike '%\\_1320x742' then '1320x742'

      ELSE 'Uncategorized'
      END;;
  }

  dimension: vnv_campaign {
    type: string
    group_label: "Client Dimensions"
    label: "Campaign Name"
    sql:
      CASE
        WHEN ${campaign} = 'VNV FY20 Objective 4 (Group)' then 'Group'
        WHEN ${campaign} = 'VNV FY20 Objective 2 (Engage)' then 'Engage'
        WHEN ${campaign} = 'VNV FY20 Objective #3 (Impact)' then 'Impact'
        WHEN ${campaign} = 'VNV FY20 Objective 5' then 'Local'
        WHEN ${campaign} = 'VNV FY18/19' AND ${site_dcm} = 'Viant' then 'Group'
        WHEN ${campaign} = 'VNV FY18/19' AND ${site_dcm} = 'Afar Media, LLC 1' then 'Impact'
        WHEN ${campaign} = 'VNV FY18/19' AND ${site_dcm} = 'Sojern' then 'Engage'
        WHEN ${campaign} = 'VNV FY18/19' AND ${site_dcm} = 'Refinery 29 1' then 'Engage'
        WHEN ${campaign} = 'VNV FY18/19' AND ${site_dcm} = 'Architectural Digest' then 'Impact'
        WHEN ${campaign} = 'VNV FY18/19' AND ${site_dcm} = 'Smart Meetings 1' then 'Group'
        ELSE 'Uncategorized'
        END
        ;;
  }

  dimension: vnv_layer {
    type: string
    group_label: "Client Dimensions"
    label: "Campaign Layer"
    sql:
      CASE
        WHEN ${campaign} = 'VNV FY20 Objective 4 (Group)' then 'Group'
        WHEN ${campaign} = 'VNV FY20 Objective 2 (Engage)' then 'Engage'
        WHEN ${campaign} = 'VNV FY20 Objective #3 (Impact)' then 'Impact'
        WHEN ${campaign} = 'VNV FY18/19' AND ${site_dcm} = 'Viant' then 'Group'
        WHEN ${campaign} = 'VNV FY18/19' AND ${site_dcm} = 'Afar Media, LLC 1' then 'Impact'
        WHEN ${campaign} = 'VNV FY18/19' AND ${site_dcm} = 'Sojern' then 'Engage'
        WHEN ${campaign} = 'VNV FY18/19' AND ${site_dcm} = 'Refinery 29 1' then 'Engage'
        WHEN ${campaign} = 'VNV FY18/19' AND ${site_dcm} = 'Architectural Digest' then 'Impact'
        WHEN ${campaign} = 'VNV FY18/19' AND ${site_dcm} = 'Smart Meetings 1' then 'Group'
        ELSE 'Uncategorized'
        END
        ;;
  }

  dimension: publisher {
    type: string
    group_label: "Client Dimensions"
    label: "Publisher"
    sql:
      CASE
        WHEN ${site_dcm} = 'Smart Meetings 1' then 'Smart Meetings'
        WHEN ${site_dcm} = 'Refinery 29 1' then 'Refinery 29'
        WHEN ${site_dcm} ILIKE '%Afar Media%' then 'Afar'
        WHEN ${site_dcm} ILIKE '%Adara%' then 'Adara'
        WHEN ${site_dcm} = 'The Wall Street Journal Online' then 'Wall Street Journal'
        ELSE ${site_dcm}
        END
        ;;
    }

  dimension: vnv_placement {
    type: string
    label: "Placement Name"
    group_label: "Client Dimensions"
    sql:
    CASE
        when ${placement} ilike 'TripAdvisor_OBJ2_Consideration_TAAudience_US_Advertorial1x1' then 'Advertorial'
        when ${placement} ilike '%Consideration\\_CompetitveContent%' then 'Competitive Content Display'
        when ${placement} ilike '%Consideration\\_AudienceExtension%' then 'Audience Extension Display'
        when ${placement} ilike '%Awareness\\_VNVInterestSegments%' then 'Audience Extension Display'
        when ${placement} ilike '%Consideration\\_AdaraAudience\\_US%' then 'Adara Audience Display - Consideration'
        when ${placement} ilike '%Consideration\\_AdaraAudience\\_AddedValue%' then 'Adara Audience Display AV - Consideration'
        when ${placement} ilike '%Awareness\\_AdaraAudience\\_US%' then 'Adara Audience Display - Awareness'
        when ${placement} ilike '%\\_HPTO Package\\_%' then 'HomePage Takeover'
        when ${placement} ilike '%\\Targeted Channel Sponsorship Package\\_%' then 'Targeted Channel Sponsorship'
        when ${placement} ilike '%\\_ROS Desktop/Mobile Web\\_%' then 'ROS Display'

        when ${placement} ilike '%\\_Mansion Global US\\_ROS\\_%' then 'Mansion Global ROS'
        when ${placement} ilike '%\\_Off Duty 50\\_%' then 'Off Duty 50'
        when ${placement} ilike '%\\_Global Bundle Package\\_ROS\\_%' then 'Global ROS'
        when ${placement} ilike '%\\_Global Network\\_RON\\_Added Value%' then 'Global RON'
        when ${placement} ilike '%\\_Run of Lifestyle%' then 'Off Duty Run of Lifestyle'
        when ${placement} ilike '%Content Integration Unit%' then 'Content Integration Unit'
        when ${placement} ilike 'WSJDN_Obj #3_Global Network__Plus Video :06/:15_CA, NY_1x1' then 'Global RON'
        when ${placement_id} = '263898960' then 'Custom Article CTA'

        when ${placement_id} = '263830381' then 'Advertorial Hub Shelf: Napa'
        when ${placement_id} = '263891781' then 'Advertorial Hub Shelf: Calistoga'
        when ${placement_id} = '263832787' then 'Advertorial Hub Shelf: Saint Helena'
        when ${placement_id} = '263894340' then 'Advertorial Hub Shelf: American Canyon'
        when ${placement_id} = '263830384' then 'Advertorial Hub Shelf: Yountville'
        when ${placement_id} = '263897454' then 'Advertorial Hub Shelf: More'
        when ${placement_id} = '264956350' then 'Advertorial Hub Traffic Drivers'
        when ${placement_id} = '263894343' then 'Advertorial Hub Map Header'
        when ${placement_id} = '263512619' then 'Advertorial Hub Book Now'

        when ${placement} ilike 'VNV_OBJ5_Retargeting_SFDMA%' then 'Retargeting Display'
        when ${placement} ilike 'VNV_OBJ5_Aspirational_SFDMA%' then 'Aspirational Display'
        when ${placement} ilike 'VNV_OBJ5_AddedValue_SFDMA%' then 'Added Value Display'

        when ${placement} ilike 'Viant_Retargeting Display%' then 'Retargeting Display'
        when ${placement} ilike 'Viant_Prospecting Display%' then 'Prospecting Display'
        when ${placement} ilike 'Viant_Added Value Display%' then 'Added Value Display'
        when ${placement} ilike 'Viant_Video Retargeting Display%' then 'Video Retargeting Display'
        when ${placement_id} = '250338924' then 'Pre-Roll Video'

        else 'Uncategorized'
        END
        ;;
  }



  dimension: vnv_market {
    type: string
    group_label: "Client Dimensions"
    label: "Market"
    sql: 'United States' ;;
  }

######### All Dimensions Native to Source Table Below #########

  dimension: __report {
    hidden: yes
    type: number
    sql: ${TABLE}.__report ;;
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

  dimension: active_view__measurable_impressions {
    hidden: yes
    type: number
    sql: ${TABLE}."active view: % measurable impressions"  ;;
  }

  dimension: active_view__viewable_impressions {
    type: number
    hidden: yes
    sql: ${TABLE}."active view: % viewable impressions"  ;;
  }

  dimension: active_view_eligible_impressions {
    type: number
    hidden: yes
    sql: ${TABLE}."active view: eligible impressions"  ;;
  }

  dimension: active_view_measurable_impressions {
    hidden: yes
    type: number
    sql: ${TABLE}."active view: measurable impressions" ;;
  }

  dimension: active_view_viewable_impressions {
    type: number
    hidden: yes
    sql: ${TABLE}."active view: viewable impressions" ;;
  }

  dimension: ad {
    type: string
    group_label: "DCM Dimensions"
    sql: ${TABLE}.ad ;;
  }

  dimension: ad_id {
    type: string
    hidden: yes
    sql: ${TABLE}."ad id" ;;
  }

  dimension: advertiser {
    type: string
    hidden: yes
    sql: ${TABLE}.advertiser ;;
  }

  dimension: booked_clicks {
    hidden: yes
    group_label: "Booked Metrics"
    label: "Booked Clicks"
    type: number
    sql: ${TABLE}."booked clicks" ;;
  }

  dimension: booked_impressions {
    type: number
    hidden: yes
    group_label: "Booked Metrics"
    label: "Booked Impressions"
    sql: ${TABLE}."booked impressions" ;;
  }

  dimension: booked_viewable_impressions {
    type: number
    hidden: yes
    group_label: "Booked Metrics"
    label: "Booked Viewable Impressions"
    sql: ${TABLE}."booked viewable impressions" ;;
  }

  dimension: campaign {
    type: string
    group_label: "DCM Dimensions"
    sql: ${TABLE}.campaign ;;
  }

  dimension: campaign_id {
    type: number
    hidden: yes
    sql: ${TABLE}."campaign id" ;;
  }

  dimension: clicks {
    type: number
    hidden: yes
    sql: ${TABLE}.clicks ;;
  }

  dimension: clickthrough_conversions {
    type: number
    hidden: yes
    sql: ${TABLE}."click-through conversions" ;;
  }

  dimension: clickthrough_revenue {
    type: number
    hidden: yes
    sql: ${TABLE}."click-through revenue" ;;
  }

  dimension: creative {
    type: string
    group_label: "DCM Dimensions"
    sql: ${TABLE}.creative ;;
  }

  dimension: creative_id {
    type: string
    hidden: yes
    sql: ${TABLE}."creative id" ;;
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

  dimension: impressions {
    type: number
    hidden: yes
    sql: ${TABLE}.impressions ;;
  }

  dimension: media_cost {
    type: number
    hidden: yes
    sql: ${TABLE}."media cost" ;;
  }

  dimension: placement {
    type: string
    group_label: "DCM Dimensions"
    sql: ${TABLE}.placement ;;
  }

  dimension: placement_id {
    type: number
#     hidden: yes
    sql: ${TABLE}."placement id" ;;
  }

  dimension: advertising_channel {
    type: string
    group_label: "DCM Dimensions"
    label: "Channel"
    sql: ${TABLE}."placement strategy" ;;
  }

  dimension: planned_media_cost {
    type: number
    hidden: yes
    group_label: "Booked Metrics"
    label: "Booked Media Cost"
    value_format_name: usd
    sql: ${TABLE}."planned media cost" ;;
  }

  dimension: platform_type {
    type: string
#     hidden: yes
    sql: ${TABLE}."platform type" ;;
  }

  dimension: site_dcm {
    type: string
    label: "Site"
    group_label: "DCM Dimensions"
    sql: ${TABLE}."site (dcm)" ;;
  }

  dimension: total_conversions {
    type: number
    hidden: yes
    sql: ${TABLE}."total conversions" ;;
  }

  dimension: total_revenue {
    type: number
    hidden: yes
    sql: ${TABLE}."total revenue" ;;
  }

  dimension: viewthrough_conversions {
    type: number
    hidden: yes
    sql: ${TABLE}."view-through conversions" ;;
  }

  dimension: viewthrough_revenue {
    type: number
    hidden: yes
    sql: ${TABLE}."view-through revenue" ;;
  }

######### All measures go below ########

  measure: total_impressions {
    group_label: "3rd Party Measures"
    type: sum_distinct
    label: "Impressions"
    sql_distinct_key: ${id} ;;
    sql: ${impressions} ;;
  }

  measure: total_clicks {
    group_label: "3rd Party Measures"
    type: sum_distinct
    label: "Clicks"
    sql_distinct_key: ${id} ;;
    sql: ${clicks} ;;
  }

  measure: click_through_rate {
    group_label: "3rd Party Measures"
    type: number
    label: "CTR"
    sql: 1.0*${total_clicks}/nullif(${total_impressions}, 0) ;;
    value_format_name: percent_2
  }

  measure: total_active_view_measureable_impressions {
    group_label: "3rd Party Measures"
    type: sum_distinct
    label: "Active View Measureable Impressions"
    sql_distinct_key: ${id} ;;
    sql: ${active_view_measurable_impressions};;
  }

  measure: total_active_view_viewable_impressions {
    group_label: "3rd Party Measures"
    type: sum_distinct
    label: "Active View Viewable Impressions"
    sql_distinct_key: ${id} ;;
    sql: ${active_view_viewable_impressions} ;;
  }

  measure: total_viewability {
    group_label: "3rd Party Measures"
    type: number
    label: "Viewability"
    sql: ${total_active_view_viewable_impressions}/nullif(${total_active_view_measureable_impressions}, 0) ;;
    value_format_name: percent_0
  }

  measure: total_media_cost {
    group_label: "3rd Party Measures"
    type: sum_distinct
    label: "Media Spend"
    sql_distinct_key: ${id} ;;
    sql: ${media_cost} ;;
    value_format_name: usd
  }

  measure: cost_per_click {
    group_label: "3rd Party Measures"
    type: number
    label: "CPC"
    sql: ${total_media_cost}/nullif(${total_clicks}, 0) ;;
    value_format_name: usd
  }

  measure: viewable_click_through_rate {
    group_label: "3rd Party Measures"
    type: number
    label: "Viewable CTR"
    sql: ${total_clicks}/nullif(${total_active_view_viewable_impressions}, 0) ;;
    value_format_name: percent_2
  }

  measure: viewable_cpm {
    group_label: "3rd Party Measures"
    type: number
    label: "Viewable CPM"
    sql: 1.0*${total_media_cost}/nullif(${total_active_view_viewable_impressions}/1000, 0) ;;
    value_format_name: usd
  }

  measure: cost_per_thousand {
    group_label: "3rd Party Measures"
    type: number
    label: "CPM"
    sql: 1.0*${total_clicks}/nullif(${total_impressions}/1000, 0) ;;
    value_format_name: usd
  }

######## Joined measures from GA #######

  measure: ga_sessions {
    group_label: "GA Reporting"
    type: sum_distinct
    label: "Sessions"
    sql_distinct_key: ${vnv_ga_onsite.id};;
    sql: ${vnv_ga_onsite.sessions};;
  }

  measure: cost_per_session {
    group_label: "GA Reporting"
    type: number
    label: "CPS"
    sql: ${total_media_cost}/nullif(${ga_sessions}, 0) ;;
    value_format_name: usd
  }

  measure: ga_total_session_duration {
    hidden: yes
    type: sum
    label: "Total Session Duration"
    sql_distinct_key: ${vnv_ga_onsite.id};;
    sql: ${vnv_ga_onsite.sessionduration};;
  }

  measure: avg_time_on_site {
    group_label: "GA Reporting"
    label: "Avg. TOS"
    type: number
    sql:  (${vnv_ga_onsite.total_session_duration}/nullif(${vnv_ga_onsite.total_sessions}, 0))::float/86400  ;;
    value_format: "m:ss"
  }

  measure: ga_total_users {
    group_label: "GA Reporting"
    label: "Users"
    type: sum
    sql: ${vnv_ga_onsite.users} ;;
  }

  measure: ga_new_users {
    group_label: "GA Reporting"
    label: "New Users"
    type: sum
    sql: ${vnv_ga_onsite.newusers} ;;
  }

  measure: percent_new_users {
    group_label: "GA Reporting"
    label: "% New Users"
    type: number
    sql: ${vnv_ga_onsite.new_users}/nullif(${vnv_ga_onsite.total_users}, 0) ;;
    value_format_name: percent_0
  }

  measure: ga_total_pageviews {
    group_label: "GA Reporting"
    label: "Pageviews"
    type: sum
    sql: ${vnv_ga_onsite.pageviews} ;;
  }

  measure: pages_per_session {
    group_label: "GA Reporting"
    label: "Pgs/Session"
    type: number
    sql: ${vnv_ga_onsite.total_pageviews}/nullif(${vnv_ga_onsite.total_sessions}, 0) ;;
    value_format: "#.0"
  }

  measure: count {
    type: count
    drill_fields: [id]
  }
}

##### Drill Fields go here #####
