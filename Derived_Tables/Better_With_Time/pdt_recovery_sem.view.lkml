view: pdt_better_with_time_sem {
  derived_table: {
    explore_source: vnv_sem {
      column: campaign {field: vnv_sem_ga_view.bwt_campaign}
      column: publisher {field: vnv_sem_ga_view.publisher}
      column: placement {field: vnv_sem_ga_view.vnv_placement}
      column: creative {field: vnv_sem_ga_view.creative_name}
      column: date {field: vnv_sem_ga_view.day_date}
      column: week {field: vnv_sem_ga_view.day_week}
      column: month {field: vnv_sem_ga_view.day_month}
      column: quarter {field: vnv_sem_ga_view.day_quarter}
      column: total_impressions { field: vnv_sem_ga_view.total_impressions }
      column: total_clicks { field: vnv_sem_ga_view.total_clicks }
      column: total_views { field: vnv_sem_ga_view.total_views }
      column: total_cost { field: vnv_sem_ga_view.total_cost }
      column: total_sessions { field: vnv_sem_ga_view.total_sessions }
      column: total_session_duration { field: vnv_sem_ga_view.total_session_duration }
      filters: {
        field: vnv_sem_ga_view.bwt_campaign
        value: "Better With Time"
      }
      filters: {
        field: vnv_sem_ga_view.total_impressions
        value: ">0"
      }
    }
    datagroup_trigger: 24hour_cache
    distribution_style: all
  }
}
