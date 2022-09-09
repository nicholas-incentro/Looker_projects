# The name of this view in Looker is "Product List"
view: product_list {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `looker_training.product_list`
    ;;
  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Product SKU" in Explore.

  dimension: product_sku {
    type: string
    sql: ${TABLE}.productSKU ;;
  }

  dimension: v2_product_name {
    type: string
    sql: ${TABLE}.v2ProductName ;;
  }
}
