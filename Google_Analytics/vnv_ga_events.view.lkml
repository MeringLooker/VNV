view: vnv_ga_events {
  sql_table_name: public.vnv_ga_events ;;
  drill_fields: [id]

 ######## Primary Key ########

  dimension: id {
    primary_key: yes
    hidden: yes
    type: string
    sql: ${TABLE}.id ;;
  }

######### Join Id ##########

  dimension: join_id {
    hidden: yes
    type: string
    sql: ${keyword}||'_'||${date_date} ;;
  }


####### AdWords Join ID #######

  dimension: adwords_join_id {
    hidden: yes
    type: string
    sql: ${adwordsadgroupid}||'_'||${date_date} ;;
  }

####### All Dimensions go Below #######

  dimension: __sampled {
    type: yesno
    hidden: yes
    sql: ${TABLE}.__sampled ;;
  }

  dimension_group: __senttime {
    type: time
    hidden: yes
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.__senttime ;;
  }

  dimension_group: __updatetime {
    type: time
    hidden: yes
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.__updatetime ;;
  }

  dimension: adwordsadgroupid {
    type: number
    hidden: yes
    value_format_name: id
    sql: ${TABLE}.adwordsadgroupid ;;
  }

  dimension_group: date {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.date ;;
  }

  dimension: eventaction {
    type: string
    label: "Event Action"
    sql: ${TABLE}.eventaction ;;
  }

  dimension: eventcategory {
    type: string
    label: "Event Category"
    sql: ${TABLE}.eventcategory ;;
  }

  dimension: eventlabel {
    type: string
    label: "Event Label"
    sql: ${TABLE}.eventlabel ;;
  }

  dimension: keyword {
    type: string
    hidden: yes
    sql: ${TABLE}.keyword ;;
  }

  dimension: sourcemedium {
    type: string
    label: "Source / Medium"
    sql: ${TABLE}.sourcemedium ;;
  }

  dimension: totalevents {
    type: number
    hidden: yes
    sql: ${TABLE}.totalevents ;;
  }

  dimension: uniqueevents {
    type: number
    hidden: yes
    sql: ${TABLE}.uniqueevents ;;
  }

######### All measures go below #########

  measure: total_events {
    label: "Events"
    type: sum_distinct
    sql_distinct_key: ${TABLE}.id ;;
    sql: ${TABLE}.totalevents ;;
  }

  measure: total_unique_events {
    label: "Unique Events"
    type: sum_distinct
    sql_distinct_key: ${TABLE}.id ;;
    sql: ${TABLE}.uniqueevents ;;
  }

  measure: count {
    type: count
    hidden: yes
    drill_fields: [id]
  }
}
