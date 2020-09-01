view: pdt_raise_a_glass_campaign {
    derived_table: {
      sql:
      select * from ${pdt_raise_a_glass_gdn.SQL_TABLE_NAME}
      union
      select * from ${pdt_raise_a_glass_fb.SQL_TABLE_NAME}
      union
      select * from ${pdt_raise_a_glass_sem.SQL_TABLE_NAME}
      union
      select * from ${pdt_raise_a_glass_yt.SQL_TABLE_NAME}
       union
      select * from ${pdt_raise_a_glass_clear_channel.SQL_TABLE_NAME}
       union
      select * from ${pdt_raise_a_glass_pandora.SQL_TABLE_NAME}
      ;;
      sql_trigger_value: SELECT FLOOR((EXTRACT(epoch from GETDATE()) - 60*60*1)/(60*60*24)) ;;
      distribution_style: all
    }

    ### Primary Key Added ###

    dimension: primary_key {
      type: string
      hidden: yes
      primary_key: yes
      sql: ${campaign}||'_'||${publisher}||'_'||${placement}||'_'||${creative}||'_'||${date};;
    }

    #### All dimensions go below ####

    dimension: campaign {
      type: string
      hidden: yes
#     drill_fields: []
      sql: ${TABLE}.campaign ;;
    }

    dimension: publisher {
      type: string
      drill_fields: [placement, date, week, month]
      sql: ${TABLE}.publisher ;;
    }

    dimension: placement {
      type: string
      drill_fields: [date,week,month]
      sql: ${TABLE}.placement ;;
    }

    dimension: creative {
      type: string
      drill_fields: [date,week,month]
      sql: ${TABLE}.creative ;;
    }

    dimension: fiscal_year {
      type:  string
      group_label: "Date Periods"
      sql:
      CASE
      WHEN ${date} BETWEEN '2017-07-01' AND '2018-06-30' THEN 'FY 17/18'
      WHEN ${date} BETWEEN '2018-07-01' AND '2019-06-30' THEN 'FY 18/19'
      WHEN ${date} BETWEEN '2019-07-01' AND '2020-06-30' THEN 'FY 19/20'
      ELSE 'Uncategorized'
      END
    ;;
    }

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
      drill_fields: [publisher]
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
#     drill_fields: [publisher,layer,week,month,quarter]
      label: "CTR"
      sql: 1.0*${total_clicks}/nullif(${total_impressions}, 0) ;;
      value_format_name: percent_2
    }

    measure: total_views {
      type: sum_distinct
      sql_distinct_key: ${primary_key} ;;
      sql: ${views} ;;
    }

    measure: total_cost {
      type: sum_distinct
      sql_distinct_key: ${primary_key} ;;
      value_format_name: usd
      sql: ${cost} ;;
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

    measure: video_impressions {
      type: sum_distinct
      hidden: yes
      sql_distinct_key: ${primary_key} ;;
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

    measure: count {
      type: count
    }

  }

#   dimension: lifetime_orders {
#     description: "The total number of orders for each user"
#     type: number
#     sql: ${TABLE}.lifetime_orders ;;
#   }
#
#   dimension_group: most_recent_purchase {
#     description: "The date when each user last ordered"
#     type: time
#     timeframes: [date, week, month, year]
#     sql: ${TABLE}.most_recent_purchase_at ;;
#   }
#
#   measure: total_lifetime_orders {
#     description: "Use this for counting lifetime orders across many users"
#     type: sum
#     sql: ${lifetime_orders} ;;
#   }
# }
