# The name of this view in Looker is "Products"
view: products {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `looker_training.products`
    ;;
  drill_fields: [name]
  # This primary key is the unique key for this table in the underlying database.
  # You need to define a primary key in a view in order to join to other views.

  dimension: name {
    primary_key: yes
    type: string
    sql: ${TABLE}.name ;;
  }

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Ordered Quantity" in Explore.

  dimension: ordered_quantity {
    type: number
    sql: ${TABLE}.orderedQuantity ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_ordered_quantity {
    type: sum
    sql: ${ordered_quantity} ;;
  }

  measure: average_ordered_quantity {
    type: average
    sql: ${ordered_quantity} ;;
  }

  dimension: restocking_lead_time {
    type: number
    sql: ${TABLE}.restockingLeadTime ;;
  }

  dimension: sentiment_magnitude {
    type: number
    sql: ${TABLE}.sentimentMagnitude ;;
  }

  dimension: sentiment_score {
    type: number
    sql: ${TABLE}.sentimentScore ;;
  }

  dimension: sku {
    type: string
    sql: ${TABLE}.SKU ;;
  }

  dimension: stock_level {
    type: number
    sql: ${TABLE}.stockLevel ;;
  }

  measure: count {
    type: count
    drill_fields: [name]
  }
}
