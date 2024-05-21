// Execute queries specified by the laboratory task on the 'Orders' collection

// -- 2) Query all the order data documents

db.Orders.find({});

// -- 3) Query order data documents for all the orders with total sum greater or equal 50000.00

db.Orders.find({'totalSum': {$gte: NumberDecimal('50000.00')}});

// -- 4) Query order data documents for the orders made by the same customer

// -- -- Query order data documents for all orders made by a specific customer (Maksim Shevchenko)

db.Orders.find({'customer':
    {
        name: "Maksim",
        surname: "Shevchenko",
        email: "maksim.shevchenko@gmail.com",
        phone: "+380931234567"
    }
});

// -- -- Query orders data grouped by customers

db.Orders.aggregate([
    {$group: {
        _id: {'customer': '$customer'},
        'orders': {$push: {
            'orderId': '$_id',
            'orderSum': '$totalSum'
        }}
    }}
]);

// -- 5) Query order data documents for all orders which include a specific item
//       ("iPhone 13 Pro Max", id: 'f509d521-b18b-4635-bc48-0754b9e36e4d')

// -- -- Using $elemMatch
db.Orders.find({'items': {$elemMatch: {'itemID': UUID('f509d521-b18b-4635-bc48-0754b9e36e4d')}}});

// -- -- Without $elemMatch
db.Orders.find({'items.itemID': UUID('f509d521-b18b-4635-bc48-0754b9e36e4d')});

// -- 6) Update order data documents for all orders contain a specific item, adding a some other item to each of them
//       (target item: "Dell XPS 15 9500", id: '98759e19-e09c-4d5f-8115-f69d935934ee';
//        new item: "Amazon Fire HD 10 (2022)", id: '2aba356e-d10e-44c4-8c80-a529c7013f85', cost: 1099.00)

db.Orders.updateMany(
    {$and: [
        {'items': {$elemMatch: {'itemId': UUID('98759e19-e09c-4d5f-8115-f69d935934ee')}}},
        {'items': {$not: {$elemMatch: {'itemId': UUID('2aba356e-d10e-44c4-8c80-a529c7013f85')}}}}
    ]},
    {
        $inc: {'totalSum': NumberDecimal('1099.00')},
        $push: {'items': {
            'itemId': UUID('2aba356e-d10e-44c4-8c80-a529c7013f85'),
            'costSum': NumberDecimal('1099.00'),
            'quantity': 1
        }},
    });

// -- 7) Count total quantity of items in a specific order (order #487)

db.Orders.aggregate([
    {$match: {'_id': 491}},
    {$project: {'items': '$items'}}, {$unwind: '$items'},
    {$group: {'_id': '$_id', 'totalItems': {$sum: '$items.quantity'}}}
]);

// -- 8) Query customer and payment receipt data for all the orders with total sum greater or equal 30000.00

db.Orders.aggregate([
    {$match: {'totalSum': {$gte: NumberDecimal('30000.00')}}},
    {$project: {'customer': '$customer', 'receipt': '$payment.receipt'}}
]);

// -- 9) Drop the first item from all the orders made in a specific period of time
//       (for orders with order date in range [2024-04-23, 2024-04-26], if they have ore than one item)

db.Orders.updateMany(
    {'datetime': {$gte: ISODate('2024-04-23'), $lt: ISODate('2024-04-26')}, 'items.1': {$exists: true}},
    [
        {$set: {'totalSum': {$subtract: ['$totalSum', {$first: '$items.costSum'}]}}},
        {$set: {'items': {$slice: ['$items', 1, { "$subtract": [{ "$size": "$items" }, 1]}]}}}
    ]);

// -- 10) Change (hide with asteriks) surnames of customers in all the order data documents

db.Orders.updateMany({}, [
    {$set: {'customer.surname': {$concat: [{$substr: ['$customer.surname', 0, 1]}, "*****"]}}}
]);

// -- 11) Query customer data, total sum and order items (with actual labels instead of id)
//        for all the orders made by the same customers

// -- -- Query orders data grouped by customers

// -- -- -- Using $unwind
db.Orders.aggregate([
    {$unwind: '$items'},
    {$lookup: {
        from: 'Items',
        localField: 'items.itemId',
        foreignField: '_id',
        as: 'items.itemData'
    }},
    {$group: {
        '_id': '$_id',
        'customer': {$first: '$customer'},
        'totalSum': {$first: '$totalSum'},
        'items': {$push: {
            'label': {$first: '$items.itemData.label'},
            'costSum': '$items.costSum',
            'quantity': '$items.quantity'
        }}
    }},
    {$group: {
        _id: {'customer': '$customer'},
        'orders': {$push: {
            'orderId': '$_id',
            'orderSum': '$totalSum',
            'items': '$items'
        }}
    }}
]);

// -- -- -- Using $map and $zip
db.Orders.aggregate([
    {$lookup: {
        from: 'Items',
        localField: 'items.itemId',
        foreignField: '_id',
        as: 'itemsData'
    }},
    {$project: {
        'customer': '$customer',
        'totalSum': '$totalSum',
        'items': {$map: {
            input: {$map: {
                input: {$zip: {inputs: ['$items', '$itemsData']}},
                in: {'orderData': {$first: '$$this'}, 'itemData': {$last: '$$this'}}
            }},
            in: {
                'label': '$$this.itemData.label',
                'costSum': '$$this.orderData.costSum',
                'quantity': '$$this.orderData.quantity'
            }
        }}
    }},
    {$group: {
        _id: {'customer': '$customer'},
        'orders': {$push: {
            'orderId': '$_id',
            'orderSum': '$totalSum',
            'items': '$items'
        }}
    }}
]);
