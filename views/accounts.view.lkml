# The name of this view in Looker is "Accounts"
view: accounts {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `looker_training.accounts`
    ;;
  drill_fields: [id]
  # This primary key is the unique key for this table in the underlying database.
  # You need to define a primary key in a view in order to join to other views.

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Lat" in Explore.

  dimension: lat {
    type: number
    sql: ${TABLE}.lat ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_lat {
    type: sum
    sql: ${lat} ;;
  }

  measure: average_lat {
    type: average
    sql: ${lat} ;;
  }

  dimension: long {
    type: number
    sql: ${TABLE}.long ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: primary_poc {
    type: string
    sql: ${TABLE}.primary_poc ;;
  }

  dimension: sales_rep_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.sales_rep_id ;;
  }

  dimension: website {
    type: string
    sql: ${TABLE}.website ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
      id,
      name,
      sales_reps.name,
      sales_reps.id,
      orders.count,
      web_events.count
    ]
  }
}
