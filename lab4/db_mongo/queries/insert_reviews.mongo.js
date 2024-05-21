// Execute operations for the crapped collection behavior demonstration on example of the 'Reviews' collection
// as requested by the laboratory task

// -- Insert new items into the 'Reviews' collection with overfilling

// -- -- Insertion 1 - insert 2 new documents into the 'Reviews' collection

db.Reviews.insertMany([
    {
        datetime: ISODate('2024-05-28T17:59:41'),
        author: {
            name: "Svetlana Polishchuk",
            email: "svetlana.polishchuk@gmail.com"
        },
        content: "I'm very happy with my purchase. Great value for money!"
    },
    {
        datetime: ISODate('2024-04-29T13:36:11'),
        author: {
            name: "Olga Tkachenko",
            email: "olga.tkachenko@ukr.net"
        },
        content: "Fast and reliable service - highly recommended. Glory to Ukraine!"
    }
]);

// -- -- Insertion 2 - insert 2 new documents into the 'Reviews' collection

db.Reviews.insertMany([
    {
        datetime: ISODate('2024-05-01T09:13:56'),
        author: {
            name: "Maksim Shevchenko",
            email: "maksim.shevchenko@gmail.com"
        },
        content: "Excellent product quality and smooth transaction. Highly recommend this store."
    },
    {
        datetime: ISODate('2024-05-04T16:29:19'),
        author: {
            name: "Yuriy Grigorenko",
            email: "yuriy.grigorenko@gmail.com"
        },
        content: "The product quality is good, but I feel the price was a bit too high. Overpriced!"
    }
]);
