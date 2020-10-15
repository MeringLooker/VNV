view: pdt_impact_afar {
  derived_table: {
    explore_source: vnv_dcm {
      column: publisher {field: vnv_dcm_ga_view.publisher}
      column: campaign {field: vnv_dcm_ga_view.vnv_campaign}
      column: placement {field: vnv_dcm_ga_view.vnv_placement}
      column: creative_name {field: vnv_dcm_ga_view.creative_name}
      column: ad_size {field: vnv_dcm_ga_view.ad_size}
      column: date {field: vnv_dcm_ga_view.date_date}
      column: week {field: vnv_dcm_ga_view.date_week}
      column: month {field: vnv_dcm_ga_view.date_month}
      column: quarter {field: vnv_dcm_ga_view.date_quarter}
      column: total_impressions {field: vnv_fy20_impact_dcm_view.total_impressions}
      column: total_clicks {field: vnv_fy20_impact_dcm_view.total_clicks}
      column: total_views {field: vnv_fy20_impact_dcm_view.total_video_views}
      column: total_completes {field: vnv_fy20_impact_dcm_view.total_video_completes}
      column: total_cost {field: vnv_fy20_impact_dcm_view.total_media_cost}
      column: total_sessions {field: vnv_dcm_ga_view.total_sessions}
      column: total_session_duration {field: vnv_dcm_ga_view.total_session_duration}
      filters: {
        field: vnv_dcm_ga_view.campaign
        value: "VNV FY20 Objective #3 (Impact)"
      }
      filters: {
        field: vnv_dcm_ga_view.publisher
        value: "AFAR"
      }
    }
    datagroup_trigger: 24hour_cache
    distribution_style: all
  }
}
