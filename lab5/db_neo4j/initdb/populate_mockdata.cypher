CALL apoc.cypher.runFiles([
    "populate_categories.cypher",
    "populate_brands.cypher",
    "populate_items.cypher",
    "populate_customers.cypher",
    "populate_views.cypher",
    "populate_orders.cypher"
  ])
