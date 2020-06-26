view: pdt_foundational_sem {
  derived_table: {
    explore_source: vnv_sem {
      column: campaign { field: vnv_sem_ga_view.vnv_campaign }
      column: publisher { field: vnv_sem_ga_view.publisher }
      column: placement { field: vnv_sem_ga_view.vnv_placement}
      column: date { field: vnv_sem_ga_view.day_date }
      column: week { field: vnv_sem_ga_view.day_week }
      column: month { field: vnv_sem_ga_view.day_month }
      column: quarter { field: vnv_sem_ga_view.day_quarter }
      column: total_impressions { field: vnv_sem_ga_view.total_impressions }
      column: total_clicks { field: vnv_sem_ga_view.total_clicks }
      column: total_views { field: vnv_sem_ga_view.total_views }
      column: total_cost { field: vnv_sem_ga_view.total_cost }
      column: total_sessions { field: vnv_sem_ga_view.total_sessions }
      column: total_session_duration { field: vnv_sem_ga_view.total_session_duration }
      column: total_concierge_form_submission {field: vnv_sem_ga_view.total_concierge_form_submission}
      column: total_enewsletter_sign_up {field: vnv_sem_ga_view.total_enewsletter_sign_up}
      column: total_partner_referral {field: vnv_sem_ga_view.total_partner_referral}
      column: total_view_guide_online {field: vnv_sem_ga_view.total_view_guide_online}
      column: total_guide_hard_copy_sign_up {field: vnv_sem_ga_view.total_guide_hard_copy_sign_up}
      column: total_tos_above_45s {field: vnv_sem_ga_view.total_tos_above_45s}
      filters: {
        field: vnv_sem_ga_view.vnv_campaign
        value: "Foundational"
      }
    }
    datagroup_trigger: vnv_foundational_datagroup
    distribution_style: all
  }

  dimension: campaign {
    type: string
  }

  dimension: publisher {
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

  dimension: impressions {
    type: number
  }

  dimension: total_clicks {
    type: number
  }

  dimension: total_views {
    type: number
  }

  dimension: total_cost {
    type: number
  }

  dimension: total_sessions {
    type: number
  }

  dimension: total_session_duration {
    type: number
  }
}
