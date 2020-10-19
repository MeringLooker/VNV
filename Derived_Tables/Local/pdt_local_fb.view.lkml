view: pdt_local_fb {
  derived_table: {
    explore_source: vnv_fb {
      column: campaign {field: vnv_fb_ga_view.vnv_campaign}
      column: publisher {field: vnv_fb_ga_view.publisher}
      column: placement {field: vnv_fb_ga_view.vnv_placement}
      column: creative_name {field: vnv_fb_ga_view.creative_name}
      column: date {field: vnv_fb_ga_view.date_start_date}
      column: week {field: vnv_fb_ga_view.date_start_week}
      column: month {field: vnv_fb_ga_view.date_start_month}
      column: quarter {field: vnv_fb_ga_view.date_start_quarter}
      column: total_impressions {field: vnv_fb_ga_view.total_impressions}
      column: total_clicks {field: vnv_fb_ga_view.total_clicks}
      column: total_views {field: vnv_fb_ga_view.total_thruplays}
      column: total_completes {field: vnv_fb_ga_view.total_video_completes}
      column: total_cost {field: vnv_fb_ga_view.total_spend}
      column: total_sessions {field: vnv_fb_ga_view.total_sessions}
      column: total_session_duration {field: vnv_fb_ga_view.total_session_duration}
      filters: {
        field: vnv_fb_ga_view.vnv_campaign
        value: "Local"
      }
    }
    datagroup_trigger: vnv_default_datagroup
    distribution_style: all
  }
}
