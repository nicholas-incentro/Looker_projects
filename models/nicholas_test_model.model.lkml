# Define the database connection to be used for this model.
connection: "nicholas_looker_training"

# include all the views
include: "/views/**/orders.view"
include: "/views/**/accounts.view"
include: "/views/**/web_events.view"


# Datagroups define a caching policy for an Explore. To learn more,
# use the Quick Help panel on the right to see documentation.

 explore: orders {
   join:accounts {
     relationship: many_to_one
     sql_on: ${orders.account_id} = ${accounts.id} ;;
   }

   join: web_events {
     relationship: many_to_one
     sql_on: ${web_events.account_id}.}.id} = ${accounts.id}} ;;
   }
}


datagroup: nicholas_test_model_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: nicholas_test_model_default_datagroup
