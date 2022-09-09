# Define the database connection to be used for this model.
connection: "nicholas_bigquery_test"

# include all the views
include: "/views/**/product_categories.view"
include: "/views/**/product_list.view"
include: "/views/**/products.view"

# Datagroups define a caching policy for an Explore. To learn more,
# use the Quick Help panel on the right to see documentation.

datagroup: nicholas_test_project_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: nicholas_test_project_default_datagroup

explore: products {
  join: product_categories{
    type:  left_outer
    sql_on: ${products.sku} = ${product_categories.product_sku} ;;
    relationship: one_to_many
  }

  join: product_list {
    type: left_outer
    sql_on: ${products.sku} = ${product_list.product_sku} ;;
    relationship: one_to_many
  }
}
