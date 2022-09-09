# The name of this view in Looker is "Revenue Reporting"
view: revenue_reporting {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `looker_training.revenue_reporting`
    ;;
  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Channel Used" in Explore.


  dimension: channel_used {
    type: string
    sql: ${TABLE}.channel_used ;;
  }

  dimension: city {
    type: string
    sql: ${TABLE}.city ;;
  }

  dimension: country {
    type: string
    map_layer_name: countries
    sql: ${TABLE}.country ;;
  }

  dimension: currency_code {
    type: string
    sql: ${TABLE}.currency_code ;;
  }

  dimension: full_visitor_id {
    type: string
    sql: ${TABLE}.full_visitor_id ;;
  }

  dimension: page_title {
    type: string
    sql: ${TABLE}.page_title ;;
  }

  dimension: pageviews {
    type: number
    sql: ${TABLE}.pageviews ;;
  }

  dimension: product_category {
    type: string
    sql: ${TABLE}.product_category ;;
  }

  dimension: product_name {
    type: string
    sql: ${TABLE}.product_name ;;
  }

  dimension: product_price {
    type: number
    sql: ${TABLE}.product_price ;;
  }

  dimension: product_sku {
    type: string
    sql: ${TABLE}.productSKU ;;
  }

  dimension: time {
    type: number
    sql: ${TABLE}.time ;;
  }

  dimension: time_on_site {
    type: number
    sql: ${TABLE}.time_on_site ;;
  }

  dimension: total_transaction_revenue {
    type: number
    sql: ${TABLE}.total_transaction_revenue ;;
  }

  dimension: transactions {
    type: number
    sql: ${TABLE}.transactions ;;
  }

  dimension: visit_id {
    type: number
    sql: ${TABLE}.visit_id ;;
  }

  dimension: is_usd {
    type: yesno
    sql: ${currency_code} = 'USD' ;;
  }

  dimension: country_and_city {
    type: string
    sql: concat(${country}, ",", ${city} ;;
  }

  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: date {
    type: time
    timeframes: [
      time,
      date,
      month,
      year
    ]
    datatype: datetime
    sql: ${TABLE}.date ;;
  }


  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_product_price {
    type: sum
    sql: ${product_price} ;;
  }

  measure: average_product_price {
    type: average
    sql: ${product_price} ;;
  }


  measure: count {
    type: count
    drill_fields: [product_name]
  }



}
