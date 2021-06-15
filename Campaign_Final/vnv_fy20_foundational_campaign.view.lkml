view: vnv_fy20_foundational_campaign {
  sql_table_name: public.vnv_fy20_foundational_campaign ;;

  ### Primary Key Added ###

  dimension: primary_key {
    type: string
    hidden: yes
    primary_key: yes
    sql: ${campaign}||'_'||${publisher}||'_'||${placement}||'_'||${creative_name}||'_'||${date};;
  }

  #### All dimensions go below ####

  dimension: campaign {
    type: string
#     drill_fields: []
    sql: ${TABLE}.campaign ;;
  }

  dimension: publisher {
    type: string
    drill_fields: [placement]
    sql: ${TABLE}.publisher ;;
  }

  dimension: placement {
    type: string
    drill_fields: []
    sql: ${TABLE}.placement ;;
  }

  dimension: creative_name {
    type: string
    drill_fields: []
    sql: ${TABLE}.creative_name ;;
  }

  # dimension: fiscal_year {
  #   type:  string
  #   group_label: "Date Periods"
  #   sql:
  #     CASE
  #     WHEN ${date} BETWEEN '2017-07-01' AND '2018-06-30' THEN 'FY 17/18'
  #     WHEN ${date} BETWEEN '2018-07-01' AND '2019-06-30' THEN 'FY 18/19'
  #     WHEN ${date} BETWEEN '2019-07-01' AND '2020-06-30' THEN 'FY 19/20'
  #     WHEN ${date} BETWEEN '2020-07-01' AND '2020-06-30' THEN 'FY 20/21'
  #     ELSE 'Uncategorized'
  #     END
  #   ;;
  # }

  dimension: date {
    type: date
    group_label: "Date Periods"
    sql: ${TABLE}.date ;;
  }

  dimension: week {
    type: date_week
    group_label: "Date Periods"
    sql: ${TABLE}.week ;;
  }

  dimension: month {
    type: date_month
    group_label: "Date Periods"
    sql: ${TABLE}.month ;;
  }

  dimension: quarter {
    type: date_quarter
    group_label: "Date Periods"
    sql: ${TABLE}.quarter ;;
  }

  dimension: impressions {
    type: number
    hidden: yes
    sql: ${TABLE}.total_impressions ;;
  }

  dimension: clicks {
    type: number
    hidden: yes
    sql: ${TABLE}.total_clicks ;;
  }

  dimension: views {
    type: number
    hidden: yes
    sql: ${TABLE}.total_views ;;
  }

  dimension: completes {
    type: number
    hidden: yes
    sql: ${TABLE}.total_completes ;;
  }

  dimension: partner_referrals {
    type: number
    hidden: yes
    sql: ${TABLE}.total_partner_referrals ;;
  }

  dimension: cost {
    type: number
    hidden: yes
    sql:  ${TABLE}.total_cost ;;
    value_format_name: usd
  }

  dimension: sessions {
    type: number
    hidden: yes
    sql: ${TABLE}.total_sessions ;;
  }

  dimension: session_duration {
    type: number
    hidden: yes
    sql: ${TABLE}.total_session_duration ;;
  }

### All measures go below ###

  measure: total_impressions {
    type: sum_distinct
    sql_distinct_key: ${primary_key} ;;
    sql: ${impressions} ;;
  }

  measure: total_clicks {
    type: sum_distinct
    sql_distinct_key: ${primary_key} ;;
    sql: ${clicks} ;;
  }

  measure: click_through_rate {
    type: number
    label: "CTR"
    sql: 1.0*${total_clicks}/nullif(${total_impressions}, 0) ;;
    value_format_name: percent_2
  }

  measure: total_views {
    type: sum_distinct
    sql_distinct_key: ${primary_key} ;;
    sql: ${views} ;;
  }

  measure: total_completes {
    type: sum
    label: "Video Completes"
    value_format_name: decimal_0
    sql: ${completes} ;;
  }

  measure: video_impressions {
    type: sum
    hidden: yes
    sql:
      case
        when ${views} > 0 then ${impressions}
        else null
        end
        ;;
  }

  measure: view_rate {
    type: number
    label: "View Rate"
    sql: 1.0*${total_views}/nullif(${video_impressions}, 0) ;;
    value_format_name: percent_2
  }

  measure: completion_rate {
    type: number
    label: "Completion Rate"
    sql: 1.0*${total_completes}/nullif(${video_impressions}, 0) ;;
    value_format_name: percent_2
  }

  measure: total_cost {
    type: sum_distinct
    label: "Gross Cost"
    sql_distinct_key: ${primary_key} ;;
    value_format_name: usd
    sql: (${cost}*1.16747) ;;
  }

  measure: video_cost {
    type: sum_distinct
    sql_distinct_key: ${primary_key} ;;
    hidden: yes
    sql:
      case
        when ${views} > 0 then (${cost}*1.16747)
        else null
        end
        ;;
  }

  measure: cost_per_view {
    type: number
    label: "CPV"
    value_format_name: usd
    sql: ${video_cost}/nullif(${total_views}, 0) ;;
  }

  measure: cost_per_complete {
    type: number
    label: "CPcV"
    value_format_name: usd
    sql: ${video_cost}/nullif(${total_completes}, 0) ;;
  }

  measure: cost_per_thousand {
    type: number
    label: "CPM"
    value_format_name: usd
    sql: ${total_cost}/nullif(${total_impressions}/1000, 0) ;;
  }

  measure: cost_per_click {
    type: number
#     drill_fields: [publisher,layer,week,month,quarter]
    label: "CPC"
    value_format_name: usd
    sql: ${total_cost}/nullif(${total_clicks}, 0) ;;
  }

  measure: total_sessions {
    type: sum_distinct
    sql_distinct_key: ${primary_key} ;;
    sql: ${sessions} ;;
  }

  measure: cost_per_session {
    type: number
    label: "CPS"
    value_format_name: usd
    sql: ${total_cost}/nullif(${total_sessions}, 0) ;;
  }

  measure: total_session_duration {
    type: sum_distinct
    hidden: yes
    sql_distinct_key: ${primary_key} ;;
    sql: ${session_duration} ;;
  }

  measure: avg_session_duration {
    label: "Avg. TOS"
#     drill_fields: [publisher,layer,week,month,quarter]
    type: number
    sql: (${total_session_duration}/nullif(${total_sessions}, 0))::float/86400 ;;
    value_format: "m:ss"
  }

  measure: total_partner_referrals {
    type: sum_distinct
    sql_distinct_key: ${primary_key} ;;
    sql: ${partner_referrals} ;;
  }

  measure: referral_rate {
    type: number
    label: "Referral Rate"
    sql: 1.0*${total_partner_referrals}/nullif(${total_sessions}, 0) ;;
    value_format_name: percent_2
  }

  # measure: count {
  #   type: count
  # }

}
