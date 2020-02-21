view: pdt_engage_adara {
  derived_table: {
    explore_source: vnv_dcm {
      column: publisher {field: vnv_dcm_view.publisher}
      column: campaign {field: vnv_dcm_view.vnv_campaign}
      column: placement {field: vnv_dcm_view.vnv_placement}
      column: date {field: vnv_dcm_view.date_date}
      column: week {field: vnv_dcm_view.date_week}
      column: month {field: vnv_dcm_view.date_month}
      column: quarter {field: vnv_dcm_view.date_quarter}
      column: total_impressions {field: vnv_dcm_view.total_impressions}
      column: total_clicks {field: vnv_dcm_view.total_clicks}
      column: total_cost {field: vnv_dcm_view.total_media_cost}
      column: total_sessions {field: vnv_dcm_view.ga_sessions}
      column: total_session_duration {field: vnv_dcm_view.ga_total_session_duration}
      filters: {
        field: vnv_dcm_view.vnv_campaign
        value: "Engage"
      }
      filters: {
        field: vnv_dcm_view.publisher
        value: "Adara"
      }
    }
    datagroup_trigger: vnv_engage_datagroup
    distribution_style: all
  }

  dimension: publisher {
    type: string
  }

  dimension: campaign {
    type: string
  }

  dimension: date {
    type: date
  }

  dimension: week {
    type: date
  }

  dimension: month {
    type: date
  }

  dimension: quarter {
    type: date
  }

  dimension: total_impressions {
    type: number
  }

  dimension: total_clicks {
    type: number
  }

  dimension: total_cost {
    type: number
    value_format_name: usd
  }

  dimension: total_sessions {
    type: number
  }

  dimension: total_session_duration {
    type: number
  }

  measure: sessions {
    type: sum
    sql: ${total_sessions} ;;
  }
}