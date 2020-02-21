  view: pdt_group_linkedin {
    derived_table: {
      explore_source: vnv_linkedin {
        column: campaign {field: vnv_linkedin_campaign.vnv_campaign}
        column: publisher {field: vnv_linkedin_campaign.publisher}
        column: placement {field: vnv_linkedin_campaign.vnv_placement}
        column: date {field: vnv_linkedin_campaign.date_date}
        column: week {field: vnv_linkedin_campaign.date_week}
        column: month {field: vnv_linkedin_campaign.date_month}
        column: quarter {field: vnv_linkedin_campaign.date_quarter}
        column: total_impressions {field: vnv_linkedin_campaign.total_impressions}
        column: total_clicks {field: vnv_linkedin_campaign.total_clicks}
        column: total_views {field: vnv_linkedin_campaign.total_views}
        column: total_cost {field: vnv_linkedin_campaign.total_spend}
        column: total_sessions {field: vnv_linkedin_campaign.total_sessions}
        column: total_session_duration {field: vnv_linkedin_campaign.total_session_duration}
        filters: {
          field: vnv_linkedin_campaign.vnv_campaign
          value: "Group"
        }
      }
      datagroup_trigger: vnv_group_datagroup
      distribution_style: all
    }

    dimension: publisher {
      type: string
    }

    dimension: campaign {
      type: string
    }

    dimension: date {
      type: date
    }

    dimension: week {
      type: date
    }

    dimension: month {
      type: date
    }

    dimension: quarter {
      type: date
    }

    dimension: total_impressions {
      type: number
    }

    dimension: total_clicks {
      type: number
    }

    dimension: total_cost {
      type: number
      value_format_name: usd
    }

    dimension: total_sessions {
      type: number
    }

    dimension: total_session_duration {
      type: number
    }
  }
