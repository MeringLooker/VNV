view: pdt_raise_a_glass_clear_channel {
  derived_table: {
    explore_source: vnv_dcm {
      column: campaign {field: vnv_dcm_ga_view.vnv_campaign}
      column: publisher {field: vnv_dcm_ga_view.publisher}
      column: placement {field: vnv_dcm_ga_view.vnv_placement}
      column: creative {field: vnv_dcm_ga_view.creative_name}
      column: date {field: vnv_dcm_ga_view.date_date}
      column: week {field: vnv_dcm_ga_view.date_week}
      column: month {field: vnv_dcm_ga_view.date_month}
      column: quarter {field: vnv_dcm_ga_view.date_quarter}
      column: total_impressions {field: vnv_dcm_ga_view.total_impressions}
      column: total_clicks {field: vnv_dcm_ga_view.total_clicks}
      column: total_views {field: vnv_dcm_ga_view.total_views}
      column: total_cost {field: vnv_dcm_ga_view.total_media_cost}
      column: total_sessions {field: vnv_dcm_ga_view.total_sessions}
      column: total_session_duration {field: vnv_dcm_ga_view.total_session_duration}
      filters: {
        field: vnv_dcm_ga_view.vnv_campaign
        value: "Raise A Glass"
      }
      filters: {
        field: vnv_dcm_ga_view.publisher
        value: "Clear Channel"
      }
    }
    datagroup_trigger: vnv_raise_a_glass
    distribution_style: all
  }
  dimension: campaign {
    type: string
  }

  dimension: publisher {
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

  dimension: total_views {
    type: number
  }

  dimension: total_cost {
    type: number
  }

  dimension: total_sessions {
    type: number
  }

  dimension: total_session_duration {
    type: number
  }
}
