view: pdt_raise_a_glass_gdn {
  derived_table: {
    explore_source: vnv_gdn {
      column: campaign {field: vnv_gdn_ga_view.vnv_campaign}
      column: publisher {field: vnv_gdn_ga_view.publisher}
      column: placement {field: vnv_gdn_ga_view.vnv_placement}
      column: creative {field: vnv_gdn_ga_view.creative_name}
      column: ad_size {field: vnv_gdn_ga_view.ad_size}
      column: date {field: vnv_gdn_ga_view.day_date}
      column: total_impressions { field: vnv_gdn_ga_view.total_impressions }
      column: total_clicks { field: vnv_gdn_ga_view.total_clicks }
      column: total_views { field: vnv_gdn_ga_view.total_views }
      column: total_completes { field: vnv_gdn_ga_view.total_completes }
      column: total_cost { field: vnv_gdn_ga_view.total_cost }
      column: total_sessions { field: vnv_gdn_ga_view.total_sessions }
      column: total_session_duration { field: vnv_gdn_ga_view.total_session_duration }
      filters: {
        field: vnv_gdn_ga_view.vnv_campaign
        value: "FY21 Raise A Glass"
      }
      filters: {
        field: vnv_gdn_ga_view.day_date
        value: "2020/09/01 to 2021/01/01,2021/01/29 to 2021/07/01"
      }
    }
    datagroup_trigger: vnv_default_datagroup
    distribution_style: all
  }
}
