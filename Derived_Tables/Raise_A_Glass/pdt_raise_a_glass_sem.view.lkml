view: pdt_raise_a_glass_sem {
  derived_table: {
    explore_source: vnv_sem {
      column: campaign {field: vnv_sem_ga_view.vnv_campaign}
      column: publisher {field: vnv_sem_ga_view.publisher}
      column: placement {field: vnv_sem_ga_view.vnv_placement}
      column: creative {field: vnv_sem_ga_view.creative_name}
      column: ad_size {field: vnv_sem_ga_view.ad_size}
      column: date {field: vnv_sem_ga_view.day_date}
      column: total_impressions { field: vnv_sem_ga_view.total_impressions }
      column: total_clicks { field: vnv_sem_ga_view.total_clicks }
      column: total_views { field: vnv_sem_ga_view.total_views }
      column: total_completes { field: vnv_sem_ga_view.total_completes }
      column: total_cost { field: vnv_sem_ga_view.total_cost }
      column: total_sessions { field: vnv_sem_ga_view.total_sessions }
      column: total_session_duration { field: vnv_sem_ga_view.total_session_duration }
      filters: {
        field: vnv_sem_ga_view.vnv_campaign
        value: "FY21 Raise A Glass"
      }
      filters: {
        field: vnv_sem_ga_view.total_impressions
        value: ">0"
      }
      filters: {
        field: vnv_sem_ga_view.day_date
        value: "2020/09/01 to 2021/07/01"
      }
    }
    datagroup_trigger: vnv_default_datagroup
    distribution_style: all
  }
}
