view: pdt_impact_afar_social {
  derived_table: {
    explore_source: vnv_afar_fy20_social {
      column: publisher { field: vnv_afar_fy20_social.publisher}
      column: campaign { field: vnv_afar_fy20_social.vnv_campaign}
      column: placement { field: vnv_afar_fy20_social.vnv_placement}
      column: ad_size { field: vnv_afar_fy20_social.ad_size}
      column: creative_name { field: vnv_afar_fy20_social.creative_name}
      column: date { field: vnv_afar_fy20_social.date_date}
      column: week { field: vnv_afar_fy20_social.date_week}
      column: month { field: vnv_afar_fy20_social.date_month}
      column: quarter { field: vnv_afar_fy20_social.date_quarter}
      column: total_impressions { field: vnv_afar_fy20_social.total_impressions}
      column: total_clicks { field: vnv_afar_fy20_social.total_clicks}
      column: total_views { field: vnv_afar_fy20_social.total_views}
      column: total_completes { field: vnv_afar_fy20_social.total_completes}
      column: total_cost { field: vnv_afar_fy20_social.total_spend}
      column: total_sessions { field: vnv_afar_fy20_social.total_sessions}
      column: total_session_duration { field: vnv_afar_fy20_social.total_session_duration}
    }
    datagroup_trigger: 24hour_cache
    distribution_style: all
  }
}
