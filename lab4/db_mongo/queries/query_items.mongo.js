// Execute queries specified by the laboratory task on the 'Items' collection

// -- 2) Query all the item data documents

db.Items.find({});

// -- 3) Count the number of items in the Laptops ("laptops") category

db.Items.countDocuments({'category': "laptops"});

// -- 4) Count the number of distinct categories

db.Items.distinct('category').length;

// -- 5) Query all the distinct producers names

db.Items.distinct('producer');

// -- 6) Query item data documents by different criteria

// -- 6.a) Query item data documents for the items of the Smartwatches ("smartwatches") category
//         with the price in range [0.00, 10000.00] using $and operator

db.Items.find({
    $and: [
        {'category': "smartwatches"},
        {'price': {$gte: NumberDecimal('0.00'), $lte: NumberDecimal('10000.00')}}
    ]
});

// -- 6.b) Query item data documents for the items, which labels contain "iPhone" or "Google Pixel" using $or operator

db.Items.find({
    $or: [
        {'label': /iPhone/i},
        {'label': /Google Pixel/i}
    ]
});

// -- 6.c) Query item data documents for the items, produced by "Samsung" or "Apple" using $in operator

db.Items.find({'producer': {$in: ["Samsung", "Apple"]}});

// -- 7) Update all item data documents, for the items of the Laptops ("laptops") category with OS "Windows 10",
//       reducing their price by 20% and adding new field 'discount'

db.Items.updateMany(
    {'category': "laptops", 'specs.OS': /Windows 10/},
    [
        {$set: {'discount': {'fullPrice': '$price'}}},
        {$set: {'price': {$round: [{$multiply: ['$price', NumberDecimal('0.8')]}, 2]}}}
    ]);

// -- 8) Query all the item data documents, which contain 'specs.protection' field

db.Items.find({'specs.protection': {$exists: true}});

// -- 9) Update all the item data documents, found in the query 8) by increasing its 'price' by 999.99

db.Items.updateMany(
    {'specs.protection': {$exists: true}},
    {$inc: {'price': NumberDecimal('999.99')}}
);
