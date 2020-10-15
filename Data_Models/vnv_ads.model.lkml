connection: "mc_panoply"

include: "/AdWords/*.view"
include: "/DCM/**/*.view"
include: "/Publisher_Passback/**/*.view"
include: "/Facebook/**/*.view"
include: "/Google_Analytics/**/*.view"
include: "/LinkedIn/**/*.view"
include: "/Pinterest/**/*.view"
include: "/TrueView/**/*.view"

## Google Display ##

explore: vnv_gdn_extended {
  hidden: no
  extends: [vnv_gdn]
}

## Google Search ##

explore: vnv_sem_extended {
  hidden: no
  extends: [vnv_sem]
}

## DoubleClick ##

explore: vnv_dcm_extended {
  hidden: no
  extends: [vnv_dcm]
}

## Facebook ##

explore: vnv_fb_extended {
  extends: [vnv_fb]
  hidden: no
}

## Google Analytics ##



## LinkedIn Ads ##

explore: vnv_linkedin_extended  {
  hidden: no
  extends: [vnv_linkedin]
}

## Pinterest Ads ##

explore: vnv_pinterest_extended {
  extends: [vnv_pinterest_ads]
  hidden: no
}

## YouTube Trueview ##

explore: vnv_yt_extended {
  extends: [vnv_yt]
  hidden: no
}
