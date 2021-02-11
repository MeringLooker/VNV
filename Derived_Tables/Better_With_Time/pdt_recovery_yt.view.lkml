view: pdt_better_with_time_yt {
  derived_table: {
    explore_source: vnv_yt {
      column: campaign {field: vnv_yt_ga_view.vnv_campaign}
      column: publisher {field: vnv_yt_ga_view.publisher}
      column: placement {field: vnv_yt_ga_view.vnv_placement}
      column: creative {field: vnv_yt_ga_view.creative_name}
      column: date {field: vnv_yt_ga_view.day_date}
      column: week {field: vnv_yt_ga_view.day_week}
      column: month {field: vnv_yt_ga_view.day_month}
      column: quarter {field: vnv_yt_ga_view.day_quarter}
      column: total_impressions { field: vnv_yt_ga_view.total_impressions }
      column: total_clicks { field: vnv_yt_ga_view.total_clicks }
      column: total_views { field: vnv_yt_ga_view.total_views }
      column: total_cost { field: vnv_yt_ga_view.total_cost }
      column: total_sessions { field: vnv_yt_ga_view.total_sessions }
      column: total_session_duration { field: vnv_yt_ga_view.total_session_duration }
      filters: {
        field: vnv_yt_ga_view.vnv_campaign
        value: "FY21 Better With Time"
      }
    }
    datagroup_trigger: vnv_default_datagroup
    distribution_style: all
  }
}
