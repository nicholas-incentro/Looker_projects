# The name of this view in Looker is "Orders"
view: orders {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `looker_training.orders`
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
  # This dimension will be called "Account ID" in Explore.

  dimension: account_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.account_id ;;
  }

  dimension: gloss_amt_usd {
    type: number
    sql: ${TABLE}.gloss_amt_usd ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_gloss_amt_usd {
    type: sum
    sql: ${gloss_amt_usd} ;;
  }

  measure: average_gloss_amt_usd {
    type: average
    sql: ${gloss_amt_usd} ;;
  }

  dimension: gloss_qty {
    type: number
    sql: ${TABLE}.gloss_qty ;;
  }

  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: occurred {
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
    sql: ${TABLE}.occurred_at ;;
  }

  dimension: poster_amt_usd {
    type: number
    sql: ${TABLE}.poster_amt_usd ;;
  }

  dimension: poster_qty {
    type: number
    sql: ${TABLE}.poster_qty ;;
  }

  dimension: standard_amt_usd {
    type: number
    sql: ${TABLE}.standard_amt_usd ;;
  }

  dimension: standard_qty {
    type: number
    sql: ${TABLE}.standard_qty ;;
  }

  dimension: total {
    type: number
    sql: ${TABLE}.total ;;
  }

  dimension: total_amt_usd {
    type: number
    sql: ${TABLE}.total_amt_usd ;;
  }

  measure: count {
    type: count
    drill_fields: [id, accounts.name, accounts.id]
  }
}
