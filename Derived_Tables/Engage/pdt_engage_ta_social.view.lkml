view: pdt_engage_ta_social {
  derived_table: {
    explore_source: vnv_fy20_engage_tripadvisor_social {
      column: publisher { field: vnv_fy20_engage_tripadvisor_social.publisher}
      column: campaign { field: vnv_fy20_engage_tripadvisor_social.campaign}
      column: placement { field: vnv_fy20_engage_tripadvisor_social.placement}
      column: ad_size { field: vnv_fy20_engage_tripadvisor_social.ad_size}
      column: creative_name { field: vnv_fy20_engage_tripadvisor_social.creative_name}
      column: date { field: vnv_fy20_engage_tripadvisor_social.date_date}
      column: week { field: vnv_fy20_engage_tripadvisor_social.date_week}
      column: month { field: vnv_fy20_engage_tripadvisor_social.date_month}
      column: quarter { field: vnv_fy20_engage_tripadvisor_social.date_quarter}
      column: total_impressions { field: vnv_fy20_engage_tripadvisor_social.total_impressions}
      column: total_clicks { field: vnv_fy20_engage_tripadvisor_social.total_clicks}
      column: total_cost { field: vnv_fy20_engage_tripadvisor_social.total_media_cost}
      column: total_sessions { field: vnv_fy20_engage_tripadvisor_social.total_sessions}
      column: total_session_duration { field: vnv_fy20_engage_tripadvisor_social.total_session_duration}
    }
    datagroup_trigger: vnv_default_datagroup
    distribution_style: all
  }
}
