view: pdt_raise_a_glass_pandora {
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
        value: "Pandora"
      }
    }
    datagroup_trigger: 24hour_cache
    distribution_style: all
  }
}
