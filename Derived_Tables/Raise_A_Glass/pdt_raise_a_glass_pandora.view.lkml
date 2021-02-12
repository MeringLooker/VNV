view: pdt_raise_a_glass_pandora {
  derived_table: {
    explore_source: vnv_dcm {
      column: campaign {field: vnv_dcm_ga_view.vnv_campaign}
      column: publisher {field: vnv_dcm_ga_view.publisher}
      column: placement {field: vnv_dcm_ga_view.vnv_placement}
      column: creative {field: vnv_dcm_ga_view.creative_name}
      column: ad_size {field: vnv_dcm_ga_view.ad_size}
      column: date {field: vnv_dcm_ga_view.date_date}
      column: total_impressions {field: vnv_dcm_ga_view.total_impressions}
      column: total_clicks {field: vnv_dcm_ga_view.total_clicks}
      column: total_views {field: vnv_dcm_ga_view.total_views}
      column: total_completes {field: vnv_dcm_ga_view.total_completes}
      column: total_cost {field: vnv_dcm_ga_view.total_media_cost}
      column: total_sessions {field: vnv_dcm_ga_view.total_sessions}
      column: total_session_duration {field: vnv_dcm_ga_view.total_session_duration}
      filters: {
        field: vnv_dcm_ga_view.vnv_campaign
        value: "FY21 Raise A Glass"
      }
      filters: {
        field: vnv_dcm_ga_view.publisher
        value: "Pandora"
      }
      filters: {
        field: vnv_dcm_ga_view.ad
        value: "-(not set)"
      }
      filters: {
        field: vnv_dcm_ga_view.date_date
        value: "2020/09/07 to 2020/11/01"
      }
    }
    datagroup_trigger: vnv_default_datagroup
    distribution_style: all
  }
}
