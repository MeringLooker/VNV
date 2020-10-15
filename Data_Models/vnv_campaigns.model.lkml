connection: "mc_panoply"

include: "/AdWords/*.view"
include: "/DCM/**/*.view"
include: "/Publisher_Passback/**/*.view"
include: "/Facebook/**/*.view"
include: "/Google_Analytics/**/*.view"
include: "/LinkedIn/**/*.view"
include: "/Pinterest/**/*.view"
include: "/TrueView/**/*.view"
include: "/Derived_Tables/**/*.view"

datagroup: 24hour_cache {
  sql_trigger: SELECT current_date;;
  max_cache_age: "24 hours"
}

## FY21 Raise A Glass ##

explore: pdt_raise_a_glass_campaign {
  label: "FY21 Raise A Glass"
  view_label: "Raise A Glass"
  group_label: "Visit Napa Valley"
  hidden: no
}

## FY21 Better With Time ##

explore: pdt_recovery_campaign {
  hidden: no
  label: "FY21 Better With Time"
  view_label: "Better With Time"
  group_label: "Visit Napa Valley"
}

## FY20/21 Foundational ##

explore: pdt_foundational_campaign {
  label: "FY20/21 Foundational"
  view_label: "Foundational"
  group_label: "Visit Napa Valley"
  hidden: no
}

## FY20 Engage ##

explore: pdt_engage_campaign {
  label: "FY20 Engage"
  view_label: "Engage"
  group_label: "Visit Napa Valley"
  hidden: yes
}

## FY20 Group ##

explore: pdt_group_campaign {
  label: "FY20 Group"
  view_label: "Group"
  group_label: "Visit Napa Valley"
  hidden: yes
}

## FY20 Impact ##

explore: pdt_impact_campaign {
  label: "FY20 Impact"
  view_label: "Impact"
  group_label: "Visit Napa Valley"
  hidden: yes
}

## FY20 Local ##

explore: pdt_local_campaign {
  label: "FY20 Local"
  view_label: "Local"
  group_label: "Visit Napa Valley"
  hidden: yes
}
