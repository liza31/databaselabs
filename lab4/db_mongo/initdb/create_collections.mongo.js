// Explicitly switch to the operational database because of the 'bitnami/mongodb' image issue
db = db.getSiblingDB(process.env["MONGODB_DATABASE"]);


// Create collections

// -- Create 'Items' collection
db.createCollection('Items');

// -- Create 'Orders' collection
db.createCollection('Orders');

// -- Create 'Reviews' capped collection
db.createCollection('Reviews', { capped: true, max: 5, size: 40960 });
