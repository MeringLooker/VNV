connection: "mc_panoply"

include: "/LinkedIn/**/*.view"
include: "/Google_Analytics/**/*.view"

explore: vnv_linkedin_extended  {
  hidden: no
  extends: [vnv_linkedin]
  label: "LinkedIn"
  group_label: "Visit Napa Valley"
  view_label: "LinkedIn"
}
