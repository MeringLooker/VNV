view: pdt_foundational_yt {
  derived_table: {
    explore_source: vnv_trueview {
      column: publisher {field: vnv_trueview_view.publisher}
      column: campaign {field: vnv_trueview.vnv_campaign}
      column: date {field: vnv_trueview.day_date}
      column: week {field: vnv_trueview.day_week}
      column: month {field: vnv_trueview.day_month}
      column: quarter {field: vnv_trueview.day_quarter}
      column: total_impressions { field: vnv_trueview.total_impressions }
      column: total_clicks { field: vnv_trueview.total_clicks }
      column: total_views { field: vnv_trueview.total_views }
      column: total_cost { field: vnv_trueview.total_cost }
      column: total_sessions { field: vnv_trueview.total_sessions }
      column: total_session_duration { field: vnv_trueview.ga_total_session_duration }
      filters: {
        field: vnv_trueview.vnv_campaign
        value: "Foundational"
      }
    }
    datagroup_trigger: vnv_foundational_datagroup
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

  dimension: total_views {
    type: number
  }

  dimension: total_completes {
    type: number
  }

  dimension: total_cost {
    type: number
    value_format_name: usd
  }
}
