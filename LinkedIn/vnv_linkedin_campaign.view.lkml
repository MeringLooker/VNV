view: vnv_linkedin_campaign {
  sql_table_name: public.vnv_linkedin_campaign ;;
  drill_fields: [id]

####### Primary Key ########

  dimension: id {
    primary_key: yes
    hidden: yes
    type: string
    sql: ${TABLE}.id ;;
  }

####### All dimensions go below ########

  dimension_group: __senttime {
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
    sql: ${TABLE}.__senttime ;;
  }

  dimension_group: __updatetime {
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
    sql: ${TABLE}.__updatetime ;;
  }

  dimension: publisher {
    label: "Publisher"
    group_label: "Client Dimensions"
    type: string
    sql: "LinkedIn" ;;
  }

  dimension: accountid {
    type: number
    hidden: yes
    value_format_name: id
    sql: ${TABLE}.accountid ;;
  }

  dimension: actionclicks {
    type: number
    hidden: yes
    sql: ${TABLE}.actionclicks ;;
  }

  dimension: adunitclicks {
    type: number
    hidden: yes
    sql: ${TABLE}.adunitclicks ;;
  }

  dimension: cardclicks {
    type: number
    hidden: yes
    sql: ${TABLE}.cardclicks ;;
  }

  dimension: cardimpressions {
    type: number
    hidden: yes
    sql: ${TABLE}.cardimpressions ;;
  }

  dimension: clicks {
    type: number
    hidden: yes
    sql: ${TABLE}.clicks ;;
  }

  dimension: commentlikes {
    type: number
    hidden: yes
    sql: ${TABLE}.commentlikes ;;
  }

  dimension: comments {
    type: number
    hidden: yes
    sql: ${TABLE}.comments ;;
  }

  dimension: companypageclicks {
    type: number
    hidden: yes
    sql: ${TABLE}.companypageclicks ;;
  }

  dimension: conversionvalueinlocalcurrency {
    type: number
    hidden: yes
    sql: ${TABLE}.conversionvalueinlocalcurrency ;;
  }

  dimension: costinlocalcurrency {
    type: number
    hidden: yes
    sql: ${TABLE}.costinlocalcurrency ;;
  }

  dimension: costinusd {
    type: number
    hidden: yes
    sql: ${TABLE}.costinusd ;;
  }

  dimension_group: enddate {
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
    sql: ${TABLE}.enddate ;;
  }

  dimension: externalwebsiteconversions {
    type: number
    hidden: yes
    sql: ${TABLE}.externalwebsiteconversions ;;
  }

  dimension: externalwebsitepostclickconversions {
    type: number
    hidden: yes
    sql: ${TABLE}.externalwebsitepostclickconversions ;;
  }

  dimension: externalwebsitepostviewconversions {
    type: number
    hidden: yes
    sql: ${TABLE}.externalwebsitepostviewconversions ;;
  }

  dimension: follows {
    type: number
    hidden: yes
    sql: ${TABLE}.follows ;;
  }

  dimension: fullscreenplays {
    type: number
    hidden: yes
    sql: ${TABLE}.fullscreenplays ;;
  }

  dimension: impressions {
    type: number
    hidden: yes
    sql: ${TABLE}.impressions ;;
  }

  dimension: landingpageclicks {
    type: number
    hidden: yes
    sql: ${TABLE}.landingpageclicks ;;
  }

  dimension: leadgenerationmailcontactinfoshares {
    type: number
    hidden: yes
    sql: ${TABLE}.leadgenerationmailcontactinfoshares ;;
  }

  dimension: leadgenerationmailinterestedclicks {
    type: number
    hidden: yes
    sql: ${TABLE}.leadgenerationmailinterestedclicks ;;
  }

  dimension: likes {
    type: number
    hidden: yes
    sql: ${TABLE}.likes ;;
  }

  dimension: oneclickleadformopens {
    type: number
    hidden: yes
    sql: ${TABLE}.oneclickleadformopens ;;
  }

  dimension: oneclickleads {
    type: number
    hidden: yes
    sql: ${TABLE}.oneclickleads ;;
  }

  dimension: opens {
    type: number
    hidden: yes
    sql: ${TABLE}.opens ;;
  }

  dimension: otherengagements {
    type: number
    hidden: yes
    sql: ${TABLE}.otherengagements ;;
  }

  dimension: pivot {
    type: string
    hidden: yes
    sql: ${TABLE}.pivot ;;
  }

  dimension: pivot_value_cost_type {
    type: string
    hidden: yes
    sql: ${TABLE}.pivot_value_cost_type ;;
  }

  dimension: pivot_value_creative_selection {
    type: string
    group_label: "LinkedIn Dimensions"
    label: "Creative Rotation Type"
    sql: ${TABLE}.pivot_value_creative_selection ;;
  }

  dimension: campaign_id {
    type: number
    hidden: yes
    sql: ${TABLE}.pivot_value_id ;;
  }

  dimension: campaign_name {
    type: string
    group_label: "LinkedIn Dimensions"
    label: "Campaign Name"
    sql: ${TABLE}.pivot_value_name ;;
  }

  dimension: linkedin_layer {
    label: "LinkedIn Layer"
    group_label: "LinkedIn Dimensions"
    type: string
    sql:
      CASE
        WHEN ${campaign_name} = 'VNV_Groups_Groups' then 'Groups'
        WHEN ${campaign_name} = 'VNV_FY20_GroupMeetings_Skills' then 'Skills'
        WHEN ${campaign_name} = 'VNV_FY20_GroupMeetings_Jobs' then 'Jobs'
        WHEN ${campaign_name} = 'VNV_FY20_GroupMeetings_Groups' then 'Groups'
        WHEN ${campaign_name} = 'FY1819_Groups_Skills' then 'Skills'
        WHEN ${campaign_name} = 'FY1819_Groups_Jobs' then 'Jobs'
        ELSE 'Uncategorized'
        END
        ;;
  }

  dimension: objective {
    type: string
    group_label: "LinkedIn Dimensions"
    label: "LinkedIn Objective"
    sql: ${TABLE}.pivot_value_objective_type ;;
  }

  dimension: optimization_target_type {
    type: string
    group_label: "LinkedIn Dimensions"
    label: "Optimization Type"
    sql: ${TABLE}.pivot_value_optimization_target_type ;;
  }

  dimension: pivot_value_type {
    type: string
    hidden: yes
    sql: ${TABLE}.pivot_value_type ;;
  }

  dimension: pivotvalue {
    type: string
    hidden: yes
    sql: ${TABLE}.pivotvalue ;;
  }

  dimension: reactions {
    type: number
    hidden: yes
    sql: ${TABLE}.reactions ;;
  }

  dimension: sends {
    type: number
    hidden: yes
    sql: ${TABLE}.sends ;;
  }

  dimension: shares {
    type: number
    hidden: yes
    sql: ${TABLE}.shares ;;
  }

  dimension_group: date {
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
    sql: ${TABLE}.startdate ;;
  }

  dimension: fiscal_year {
    label: "Fiscal"
    group_label: "Client Dimensions"
    type: string
    sql:
      CASE
        WHEN ${date_date} BETWEEN '2018-07-01' AND '2019-06-30' THEN 'FY 18/19'
        WHEN ${date_date} BETWEEN '2019-07-01' AND '2020-06-30' THEN 'FY 19/20'
        ELSE 'Uncategorized'
        END;;
  }

  dimension: texturlclicks {
    type: number
    hidden: yes
    sql: ${TABLE}.texturlclicks ;;
  }

  dimension: totalengagements {
    type: number
    hidden: yes
    sql: ${TABLE}.totalengagements ;;
  }

  dimension: videocompletions {
    type: number
    hidden: yes
    sql: ${TABLE}.videocompletions ;;
  }

  dimension: videofirstquartilecompletions {
    type: number
    hidden: yes
    sql: ${TABLE}.videofirstquartilecompletions ;;
  }

  dimension: videomidpointcompletions {
    type: number
    hidden: yes
    sql: ${TABLE}.videomidpointcompletions ;;
  }

  dimension: videostarts {
    type: number
    hidden: yes
    sql: ${TABLE}.videostarts ;;
  }

  dimension: videothirdquartilecompletions {
    type: number
    hidden: yes
    sql: ${TABLE}.videothirdquartilecompletions ;;
  }

  dimension: videoviews {
    type: number
    hidden: yes
    sql: ${TABLE}.videoviews ;;
  }

  dimension: viralcardclicks {
    type: number
    hidden: yes
    sql: ${TABLE}.viralcardclicks ;;
  }

  dimension: viralcardimpressions {
    type: number
    hidden: yes
    sql: ${TABLE}.viralcardimpressions ;;
  }

  dimension: viralclicks {
    type: number
    hidden: yes
    sql: ${TABLE}.viralclicks ;;
  }

  dimension: viralcommentlikes {
    type: number
    hidden: yes
    sql: ${TABLE}.viralcommentlikes ;;
  }

  dimension: viralcomments {
    type: number
    hidden: yes
    sql: ${TABLE}.viralcomments ;;
  }

  dimension: viralcompanypageclicks {
    type: number
    hidden: yes
    sql: ${TABLE}.viralcompanypageclicks ;;
  }

  dimension: viralexternalwebsiteconversions {
    type: number
    hidden: yes
    sql: ${TABLE}.viralexternalwebsiteconversions ;;
  }

  dimension: viralexternalwebsitepostclickconversions {
    type: number
    hidden: yes
    sql: ${TABLE}.viralexternalwebsitepostclickconversions ;;
  }

  dimension: viralexternalwebsitepostviewconversions {
    type: number
    hidden: yes
    sql: ${TABLE}.viralexternalwebsitepostviewconversions ;;
  }

  dimension: viralfollows {
    type: number
    hidden: yes
    sql: ${TABLE}.viralfollows ;;
  }

  dimension: viralfullscreenplays {
    type: number
    hidden: yes
    sql: ${TABLE}.viralfullscreenplays ;;
  }

  dimension: viralimpressions {
    type: number
    hidden: yes
    sql: ${TABLE}.viralimpressions ;;
  }

  dimension: virallandingpageclicks {
    type: number
    hidden: yes
    sql: ${TABLE}.virallandingpageclicks ;;
  }

  dimension: virallikes {
    type: number
    hidden: yes
    sql: ${TABLE}.virallikes ;;
  }

  dimension: viraloneclickleadformopens {
    type: number
    hidden: yes
    sql: ${TABLE}.viraloneclickleadformopens ;;
  }

  dimension: viraloneclickleads {
    type: number
    hidden: yes
    sql: ${TABLE}.viraloneclickleads ;;
  }

  dimension: viralotherengagements {
    type: number
    hidden: yes
    sql: ${TABLE}.viralotherengagements ;;
  }

  dimension: viralreactions {
    type: number
    hidden: yes
    sql: ${TABLE}.viralreactions ;;
  }

  dimension: viralshares {
    type: number
    hidden: yes
    sql: ${TABLE}.viralshares ;;
  }

  dimension: viraltotalengagements {
    type: number
    hidden: yes
    sql: ${TABLE}.viraltotalengagements ;;
  }

  dimension: viralvideocompletions {
    type: number
    hidden: yes
    sql: ${TABLE}.viralvideocompletions ;;
  }

  dimension: viralvideofirstquartilecompletions {
    type: number
    hidden: yes
    sql: ${TABLE}.viralvideofirstquartilecompletions ;;
  }

  dimension: viralvideomidpointcompletions {
    type: number
    hidden: yes
    sql: ${TABLE}.viralvideomidpointcompletions ;;
  }

  dimension: viralvideostarts {
    type: number
    hidden: yes
    sql: ${TABLE}.viralvideostarts ;;
  }

  dimension: viralvideothirdquartilecompletions {
    type: number
    hidden: yes
    sql: ${TABLE}.viralvideothirdquartilecompletions ;;
  }

  dimension: viralvideoviews {
    type: number
    hidden: yes
    sql: ${TABLE}.viralvideoviews ;;
  }

###### All Measures Go Below ######

######### Ad Delivery Measures ########

  measure: total_impressions {
    type: sum
    label: "Impressions"
    sql: ${TABLE}.impressions ;;
  }

  measure: total_clicks {
    type: sum
    label: "Clicks"
    sql: ${TABLE}.clicks ;;
  }

  measure: click_through_rate {
    type: number
    label: "CTR"
    sql: 1.0*${total_clicks}/nullif(${total_impressions}, 0) ;;
    value_format_name: percent_2
  }

  measure: total_spend {
    label: "Media Spend"
    type: sum
    sql: ${TABLE}.costinusd ;;
    value_format_name: usd
  }

  measure: cost_per_click {
    label: "CPC"
    type: number
    sql: ${total_spend}/nullif(${total_clicks}, 0) ;;
    value_format_name: usd
  }

  measure: cost_per_thousand {
    type: number
    label: "CPM"
    sql: ${total_spend}/nullif(${total_impressions}/1000, 0) ;;
    value_format_name: usd
  }

  measure: video_views {
    type: sum
    hidden: yes
    label: "Video Views"
    sql: ${TABLE}.videoviews ;;
  }

####### Joined GA Measures ######

  measure: count {
    hidden: yes
    type: count
  }
}
