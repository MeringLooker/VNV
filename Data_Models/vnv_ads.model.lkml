connection: "mc_panoply"

include: "/AdWords/*.view"
include: "/DCM/**/*.view"
include: "/Publisher_Passback/**/*.view"
include: "/Facebook/**/*.view"
include: "/Google_Analytics/**/*.view"
include: "/LinkedIn/**/*.view"
include: "/Pinterest/**/*.view"
include: "/TrueView/**/*.view"

datagroup: vnv_default_datagroup {
  sql_trigger: SELECT current_date;;
  max_cache_age: "24 hours"
}

## Google Display ##

explore: vnv_gdn_extended {
  persist_with: vnv_default_datagroup
  hidden: no
  extends: [vnv_gdn]
}

## Google Search ##

explore: vnv_sem_extended {
  persist_with: vnv_default_datagroup
  hidden: no
  extends: [vnv_sem]
}

## DoubleClick ##

explore: vnv_dcm_extended {
  persist_with: vnv_default_datagroup
  hidden: no
  extends: [vnv_dcm]
}

## Facebook ##

explore: vnv_fb_extended {
  persist_with: vnv_default_datagroup
  extends: [vnv_fb]
  hidden: no
}

## Google Analytics ##



## LinkedIn Ads ##

explore: vnv_linkedin_extended  {
  persist_with: vnv_default_datagroup
  hidden: no
  extends: [vnv_linkedin]
}

## Pinterest Ads ##

explore: vnv_pinterest_extended {
  persist_with: vnv_default_datagroup
  extends: [vnv_pinterest_ads]
  hidden: no
}

## YouTube Trueview ##

explore: vnv_yt_extended {
  persist_with: vnv_default_datagroup
  extends: [vnv_yt]
  hidden: no
}
