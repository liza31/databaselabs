// Explicitly switch to the operational database because of the 'bitnami/mongodb' image issue
db = typeof process == 'undefined' ? db : db.getSiblingDB(process.env["MONGODB_DATABASE"]);


// Pre-populate 'Reviews' collection

db.Reviews.insertMany([
    {
        datetime: ISODate('2024-04-23T21:13:33'),
        author: {
            name: "Oleg Kovalenko",
            email: "oleg.kovalenko@gmail.com"
        },
        content: "Great service and fast delivery! I'm very satisfied with my purchase."
    },
    {
        datetime: ISODate('2024-04-24T17:17:21'),
        author: {
            name: "Irina Petrenko",
            email: "irina.petrenko@gmail.com"
        },
        content: "The delivery was quick and the item arrived in perfect condition. Thank you!"
    },
    {
        datetime: ISODate('2024-04-24T20:24:47'),
        author: {
            name: "Alina Bondarenko",
            email: "alina.bondarenko@gmail.com"
        },
        content: "I had a great shopping experience. The customer service was very helpful."
    },
    {
        datetime: ISODate('2024-05-27T18:45:31'),
        author: {
            name: "Natalia Ivanova",
            email: "natalia.ivanova@ukr.net"
        },
        content: "Everything was perfect. I will definitely shop here again!"
    }
]);
