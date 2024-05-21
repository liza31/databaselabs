// Delete all the documents from all the collections

// -- Delete all the documents from the 'Reviews' collection
db.Reviews.deleteMany({});

// -- Delete all the documents from the 'Orders' collection
db.Orders.deleteMany({});

// -- Delete all the documents from the 'Items' collection
db.Items.deleteMany({});
