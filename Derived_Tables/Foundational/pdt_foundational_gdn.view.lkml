view: pdt_foundational_gdn {
  derived_table: {
    explore_source: vnv_gdn {
      column: campaign { field: vnv_gdn_ga_view.vnv_campaign }
      column: publisher { field: vnv_gdn_ga_view.publisher }
      column: placement { field: vnv_gdn_ga_view.vnv_placement }
      column: creative_name { field: vnv_gdn_ga_view.creative_name }
      column: date { field: vnv_gdn_ga_view.day_date }
      column: week { field: vnv_gdn_ga_view.day_week }
      column: month { field: vnv_gdn_ga_view.day_month }
      column: quarter { field: vnv_gdn_ga_view.day_quarter }
      column: total_impressions { field: vnv_gdn_ga_view.total_impressions }
      column: total_clicks { field: vnv_gdn_ga_view.total_clicks }
      column: total_views { field: vnv_gdn_ga_view.total_views }
      column: total_completes { field: vnv_gdn_ga_view.total_completes }
      column: total_cost { field: vnv_gdn_ga_view.total_cost }
      column: total_sessions { field: vnv_gdn_ga_view.total_sessions }
      column: total_session_duration { field: vnv_gdn_ga_view.total_session_duration }
      column: total_partner_referrals { field: vnv_gdn_ga_view.total_partner_referral }
      filters: {
        field: vnv_gdn_ga_view.vnv_campaign
        value: "Foundational"
      }
    }
    datagroup_trigger: 24hour_cache
    distribution_style: all
  }
}
