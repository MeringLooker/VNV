# view: pdt_impact_afar_email {
#   derived_table: {
#     explore_source: vnv_afar_fy20_email {
#       column: publisher { field: vnv_afar_fy20_email.publisher}
#       column: campaign { field: vnv_afar_fy20_email.vnv_campaign}
#       column: placement { field: vnv_afar_fy20_email.vnv_placement}
#       column: ad_size { field: vnv_afar_fy20_email.ad_size}
#       column: creative_name { field: vnv_afar_fy20_email.creative_name}
#       column: date { field: vnv_afar_fy20_email.date_date}
#       column: week { field: vnv_afar_fy20_email.date_week}
#       column: month { field: vnv_afar_fy20_email.date_month}
#       column: quarter { field: vnv_afar_fy20_email.date_quarter}
#       column: total_impressions { field: vnv_afar_fy20_email.total_impressions}
#       column: total_clicks { field: vnv_afar_fy20_email.total_clicks}
#       column: total_views { field: vnv_afar_fy20_email.total_views}
#       column: total_completes { field: vnv_afar_fy20_email.total_completes}
#       column: total_cost { field: vnv_afar_fy20_email.total_spend}
#       column: total_sessions { field: vnv_afar_fy20_email.total_sessions}
#       column: total_session_duration { field: vnv_afar_fy20_email.total_session_duration}
#     }
#     datagroup_trigger: vnv_default_datagroup
#     distribution_style: all
#   }
# }
