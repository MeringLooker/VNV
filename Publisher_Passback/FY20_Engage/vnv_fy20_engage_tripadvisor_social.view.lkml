view: vnv_fy20_engage_tripadvisor_social {
  sql_table_name: vnv_fy20_engage_tripadvisor_social;;

#### Primary Key ####

  dimension: id {
    type: string
    hidden: yes
    sql: ${TABLE}.id ;;
  }

### Dimensions Added to This Table Via LookML ###

  dimension: campaign {
    type: string
    sql: 'Engage' ;;
  }

  dimension: publisher {
    type: string
    sql: 'TripAdvisor' ;;
  }

  dimension: market {
    type: string
    sql: 'United States' ;;
  }

  dimension: placement {
    type: string
    sql: 'Social Audience Extension' ;;
  }

  dimension: ad_size {
    type: string
    sql: 'Social Post' ;;
  }

  dimension: creative_name {
    type: string
    sql: 'Uncategorized' ;;
  }

### Dimensions Native to This Table ###

  dimension_group: __updatetime {
    type: time
    hidden: yes
    sql: ${TABLE}.__updatetime ;;
  }

  dimension: placement_name {
    type: string
    sql: ${TABLE}.placement_name ;;
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
    sql: ${TABLE}.date ;;
  }

  dimension: impressions {
    type: number
    hidden: yes
    sql: ${TABLE}.impressions ;;
  }

  dimension: clicks {
    type: number
    hidden: yes
    sql: ${TABLE}.clicks ;;
  }

  dimension: engagements {
    type: number
    hidden: yes
    sql: ${TABLE}.engagements ;;
  }

  dimension: cost {
    type: number
    hidden: yes
    sql: ${TABLE}.cost ;;
  }

  dimension: __state {
    type: string
    hidden: yes
    sql: ${TABLE}.__state ;;
  }

  dimension_group: __senttime {
    type: time
    hidden: yes
    sql: ${TABLE}.__senttime ;;
  }

  ### Measure Go Below ###

  measure: total_impressions {
    type: sum_distinct
    label: "Total Impressions"
    sql_distinct_key: ${id} ;;
    sql: ${impressions} ;;
  }

  measure: total_clicks {
    label: "Total Clicks"
    type: sum_distinct
    sql_distinct_key: ${id} ;;
    sql: ${clicks} ;;
  }

  measure: click_through_rate {
    label: "CTR"
    type: number
    value_format_name: percent_2
    sql: ${total_clicks}/nullif(${total_impressions}, 0) ;;
  }

  measure: total_engagements {
    label: "Total Engagements"
    type: sum_distinct
    sql_distinct_key: ${id} ;;
    sql: ${engagements} ;;
  }

  measure: engagement_rate {
    label: "Engagement Rate"
    type: number
    value_format_name: percent_2
    sql: ${total_engagements}/nullif(${total_impressions}, 0) ;;
  }

  measure: total_media_cost {
    label: "Total Media Cost"
    type: sum_distinct
    sql_distinct_key: ${id} ;;
    sql: ${cost} ;;
    value_format_name: usd
  }

  measure: total_views {
    label: "Total Views"
    type: sum
    sql: 0 ;;
  }

  measure: total_completes {
    label: "Total Completes"
    type: sum
    sql: 0 ;;
  }

  measure: total_sessions {
    label: "Total Sessions"
    type: sum
    sql: 0 ;;
  }

  measure: total_session_duration {
    label: "Total Session Duration"
    type: sum
    sql: 0 ;;
  }

}
