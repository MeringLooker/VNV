connection: "mc_panoply"

include: "/TrueView/**/*.view"
include: "/Google_Analytics/**/*.view"

explore: vnv_trueview_extended {
  extends: [vnv_trueview]
  hidden: no
}
