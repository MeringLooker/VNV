view: pdt_group_linkedin {
  derived_table: {
    explore_source: vnv_linkedin {
      column: campaign {field: vnv_linkedin_campaign.vnv_campaign}
      column: publisher {field: vnv_linkedin_campaign.publisher}
      column: placement {field: vnv_linkedin_campaign.vnv_placement}
      column: creative_name {field: vnv_linkedin_campaign.creative_name}
      column: date {field: vnv_linkedin_campaign.date_date}
      column: week {field: vnv_linkedin_campaign.date_week}
      column: month {field: vnv_linkedin_campaign.date_month}
      column: quarter {field: vnv_linkedin_campaign.date_quarter}
      column: total_impressions {field: vnv_linkedin_campaign.total_impressions}
      column: total_clicks {field: vnv_linkedin_campaign.total_clicks}
      column: total_views {field: vnv_linkedin_campaign.total_views}
      column: total_completes {field: vnv_linkedin_campaign.total_completes}
      column: total_cost {field: vnv_linkedin_campaign.total_spend}
      column: total_sessions {field: vnv_linkedin_campaign.total_sessions}
      column: total_session_duration {field: vnv_linkedin_campaign.total_session_duration}
      column: total_partner_referrals {field: vnv_linkedin_campaign.total_partner_referral}
      filters: {
        field: vnv_linkedin_campaign.vnv_campaign
        value: "Group"
      }
    }
    datagroup_trigger: 24hour_cache
    distribution_style: all
  }
}
