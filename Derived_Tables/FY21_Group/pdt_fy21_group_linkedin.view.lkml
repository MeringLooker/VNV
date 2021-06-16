view: pdt_fy21_group_linkedin {
  derived_table: {
    explore_source: vnv_linkedin {
      column: campaign { field: vnv_linkedin_ga_agg_view.vnv_campaign }
      column: publisher { field: vnv_linkedin_ga_agg_view.publisher }
      column: placement { field: vnv_linkedin_ga_agg_view.vnv_placement}
      column: creative_name { field: vnv_linkedin_ga_agg_view.vnv_creative_name}
      column: ad_size { field: vnv_linkedin_ga_agg_view.ad_size}
      column: date { field: vnv_linkedin_ga_agg_view.date_date }
      column: total_impressions { field: vnv_linkedin_ga_agg_view.total_impressions }
      column: total_clicks { field: vnv_linkedin_ga_agg_view.total_clicks }
      column: total_views { field: vnv_linkedin_ga_agg_view.total_views }
      column: total_completes { field: vnv_linkedin_ga_agg_view.total_completes }
      column: total_cost { field: vnv_linkedin_ga_agg_view.total_cost }
      column: total_sessions { field: vnv_linkedin_ga_agg_view.total_sessions }
      column: total_session_duration { field: vnv_linkedin_ga_agg_view.total_session_duration }
      column: total_partner_referrals { field: vnv_linkedin_ga_agg_view.total_partner_referral }
      filters: {
        field: vnv_linkedin_ga_agg_view.vnv_campaign
        value: "FY21 Group"
      }
      filters: {
        field: vnv_linkedin_ga_agg_view.total_impressions
        value: ">0"
      }
      filters: {
        field: vnv_linkedin_ga_agg_view.date_date
        value: "2021/05/01 to 2021/07/01"
      }
    }
    datagroup_trigger: vnv_default_datagroup
    distribution_style: all
  }
}
