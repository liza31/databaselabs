// Explicitly switch to the operational database because of the 'bitnami/mongodb' image issue
db = typeof process == 'undefined' ? db : db.getSiblingDB(process.env["MONGODB_DATABASE"]);


// Populate 'Items' collection

db.Orders.insertMany([
    {
        _id: 483,
        status: "complete",
        datetime: ISODate('2024-04-22T14:23:11'),
        totalSum: NumberDecimal('43400.00'),
        customer: {
            name: "Oleg",
            surname: "Kovalenko",
            email: "oleg.kovalenko@gmail.com",
            phone: "+380631234567"
        },
        delivery: {
            method: "store",
            phone: "+380631234567",
            person: "Oleg Kovalenko",
            postOffice: "3"
        },
        payment: {
            method: "store",
            receipt: "A4D5E6F7A9B1"
        },
        items: [
            {
                itemId: UUID('98759e19-e09c-4d5f-8115-f69d935934ee'),
                costSum: NumberDecimal('43400.00'),
                quantity: 1
            },
        ]
    },
    {
        _id: 484,
        status: "complete",
        datetime: ISODate('2024-04-22T15:42:19'),
        totalSum: NumberDecimal('24999.00'),
        customer: {
            name: "Irina",
            surname: "Petrenko",
            email: "irina.petrenko@gmail.com",
            phone: "+380971234567"
        },
        delivery: {
            method: "curier",
            phone: "+380971234567",
            person: "Irina Petrenko",
            address: "Saksahanskoho St, 35, Kyiv, Ukraine"
        },
        payment: {
            method: "curier",
            receipt: "C1D2E3F4A5B6"
        },
        items: [
            {
                itemId: UUID('9e720a91-ea78-4008-b757-8e7ad6e9bba7'),
                costSum: NumberDecimal('24999.00'),
                quantity: 1
            }
        ]
    },
    {
        _id: 485,
        status: "complete",
        datetime: ISODate('2024-04-23T09:10:05'),
        totalSum: NumberDecimal('41099.00'),
        customer: {
            name: "Maksim",
            surname: "Shevchenko",
            email: "maksim.shevchenko@gmail.com",
            phone: "+380931234567"
        },
        delivery: {
            method: "ukrposhta",
            phone: "+380931234567",
            person: "Maksim Shevchenko",
            postOffice: "02090"
        },
        payment: {
            method: "p-o-d",
            receipt: "B2C3D4E5F6A7"
        },
        items: [
            {
                itemID: UUID('f509d521-b18b-4635-bc48-0754b9e36e4d'),
                totalSum: NumberDecimal('41099.00'),
                quantity: 1
            }
        ]
    },
    {
        _id: 486,
        status: "complete",
        datetime: ISODate('2024-04-23T10:55:33'),
        totalSum: NumberDecimal('54999.00'),
        customer: {
            name: "Alina",
            surname: "Bondarenko",
            email: "alina.bondarenko@gmail.com",
            phone: "+380661234567"
        },
        delivery: {
            method: "novapost",
            phone: "+380661234567",
            person: "Alina Bondarenko",
            postOffice: "Dnipro, 23"
        },
        payment: {
            method: "p-o-d",
            receipt: "D3E4F5A6B7C8"
        },
        items: [
            {
                itemId: UUID('ce8e362b-7d70-4ee8-accf-14e0152c3721'),
                costSum: NumberDecimal('54999.00'),
                quantity: 1
            }
        ]
    },
    {
        _id: 487,
        status: "complete",
        datetime: ISODate('2024-04-24T08:30:22'),
        totalSum: NumberDecimal('39178.00'),
        customer: {
            name: "Natalia",
            surname: "Ivanova",
            email: "natalia.ivanova@ukr.net",
            phone: "+380681234567"
        },
        delivery: {
            method: "store",
            phone: "+380681234567",
            person: "Natalia Ivanova",
            postOffice: "2"
        },
        payment: {
            method: "store",
            receipt: "E5F6A7B8C9D1"
        },
        items: [
            {
                itemId: UUID('5c7cd55d-14e5-40db-9828-fe2c681e1782'),
                costSum: NumberDecimal('30599.00'),
                quantity: 1
            },
            {
                itemId: UUID('5e29b0e0-d88f-4206-bd9c-eb6dc192920c'),
                costSum: NumberDecimal('8579.00'),
                quantity: 1
            }
        ]
    },
    {
        _id: 488,
        status: "complete",
        datetime: ISODate('2024-04-24T09:45:51'),
        totalSum: NumberDecimal('2199.00'),
        customer: {
            name: "Oleg",
            surname: "Kovalenko",
            email: "oleg.kovalenko@gmail.com",
            phone: "+380631234567"
        },
        delivery: {
            method: "novapost",
            phone: "+380631234567",
            person: "Oleg Kovalenko",
            postOffice: "Lviv, 11"
        },
        payment: {
            method: "p-o-d",
            receipt: "F6A7B8C9D1E2"
        },
        items: [
            {
                itemId: UUID('2aba356e-d10e-44c4-8c80-a529c7013f85'),
                costSum: NumberDecimal('2199.00'),
                quantity: 1
            }
        ]
    },
    {
        _id: 489,
        status: "complete",
        datetime: ISODate('2024-04-25T13:12:09'),
        totalSum: NumberDecimal('7499.00'),
        customer: {
            name: "Svetlana",
            surname: "Polishchuk",
            email: "svetlana.polishchuk@gmail.com",
            phone: "+380991234567"
        },
        delivery: {
            method: "curier",
            phone: "+380991234567",
            person: "Svetlana Polishchuk",
            address: "Velyka Vasylkivska St, 25, Kyiv, Ukraine"
        },
        payment: {
            method: "curier",
            receipt: "A7B8C9D1E2F3"
        },
        items: [
            {
                itemId: UUID('8f00c00d-c3dc-480a-a8c1-77341aa613ef'),
                costSum: NumberDecimal('7499.00'),
                quantity: 1
            }
        ]
    },
    {
        _id: 490,
        status: "complete",
        datetime: ISODate('2024-04-25T16:47:14'),
        totalSum: NumberDecimal('39999.00'),
        customer: {
            name: "Viktor",
            surname: "Dmitriev",
            email: "viktor.dmitriev@gmail.com",
            phone: "+380921234567"
        },
        delivery: {
            method: "store",
            phone: "+380921234567",
            person: "Viktor Dmitriev",
            postOffice: "4"
        },
        payment: {
            method: "store",
            receipt: "B9C1D2E3F4A5"
        },
        items: [
            {
                itemId: UUID('632e8927-3c43-42b5-aaf8-0587df28b0b0'),
                costSum: NumberDecimal('39999.00'),
                quantity: 1
            }
        ]
    },
    {
        _id: 491,
        status: "complete",
        datetime: ISODate('2024-04-26T10:22:35'),
        totalSum: NumberDecimal('419170.00'),
        customer: {
            name: "Olga",
            surname: "Tkachenko",
            email: "olga.tkachenko@ukr.net",
            phone: "+380671234567"
        },
        delivery: {
            method: "ukrposhta",
            phone: "+380671234567",
            person: "Olga Tkachenko",
            postOffice: "03150"
        },
        payment: {
            method: "p-o-d",
            receipt: "C1D2E3F4A5B6"
        },
        items: [
            {
                itemId: UUID('0415ea20-31cc-40f4-886f-c7581980d13b'),
                costSum: NumberDecimal('229990.00'),
                quantity: 10
            },
            {
                itemId: UUID('9e720a91-ea78-4008-b757-8e7ad6e9bba7'),
                costSum: NumberDecimal('175992.00'),
                quantity: 8
            },
            {
                itemId: UUID('2aba356e-d10e-44c4-8c80-a529c7013f85'),
                costSum: NumberDecimal('13188.00'),
                quantity: 12
            }
        ]
    },
    {
        _id: 492,
        status: "complete",
        datetime: ISODate('2024-04-26T11:48:20'),
        totalSum: NumberDecimal('12570.00'),
        customer: {
            name: "Irina",
            surname: "Petrenko",
            email: "irina.petrenko@gmail.com",
            phone: "+380971234567"
        },
        delivery: {
            method: "novapost",
            phone: "+380971234567",
            person: "Irina Petrenko",
            postOffice: "Kyiv, 32"
        },
        payment: {
            method: "p-o-d",
            receipt: "D2E3F4A5B6C7"
        },
        items: [
            {
                itemId: UUID('f771ffbd-66b0-4d19-99f7-974a9d047c87'),
                costSum: NumberDecimal('12570.00'),
                quantity: 1
            }
        ]
    },
    {
        _id: 493,
        status: "complete",
        datetime: ISODate('2024-04-27T09:16:41'),
        totalSum: NumberDecimal('23998.00'),
        customer: {
            name: "Dmitry",
            surname: "Sokolov",
            email: "dmitry.sokolov@gmail.com",
            phone: "+380961234567"
        },
        delivery: {
            method: "curier",
            phone: "+380961234567",
            person: "Dmitry Sokolov",
            address: "Lesi Ukrainky Blvd, 8, Kyiv, Ukraine"
        },
        payment: {
            method: "curier",
            receipt: "E3F4A5B6C7D8"
        },
        items: [
            {
                itemId: UUID('09007b6a-bd66-4512-adf4-5af53002e477'),
                costSum: NumberDecimal('23998.00'),
                quantity: 2
            }
        ]
    },
    {
        _id: 494,
        status: "complete",
        datetime: ISODate('2024-04-27T10:39:05'),
        totalSum: NumberDecimal('72998.00'),
        customer: {
            name: "Svetlana",
            surname: "Polishchuk",
            email: "svetlana.polishchuk@gmail.com",
            phone: "+380991234567"
        },
        delivery: {
            method: "store",
            phone: "+380991234567",
            person: "Svetlana Polishchuk",
            postOffice: "1"
        },
        payment: {
            method: "store",
            receipt: "F4A5B6C7D8E9"
        },
        items: [
            {
                itemId: UUID('1e8a2ccf-2e25-4476-b250-d28721788269'),
                costSum: NumberDecimal('37999.00'),
                quantity: 1
            },
            {
                itemID: UUID('f1f1e9d2-8865-4879-96a8-3fa98cacc216'),
                costSum: NumberDecimal('34999.00'),
                quantity: 1
            }
        ]
    },
    {
        _id: 495,
        status: "complete",
        datetime: ISODate('2024-04-28T08:55:17'),
        totalSum: NumberDecimal('34999.00'),
        customer: {
            name: "Alina",
            surname: "Bondarenko",
            email: "alina.bondarenko@gmail.com",
            phone: "+380661234567"
        },
        delivery: {
            method: "ukrposhta",
            phone: "+380661234567",
            person: "Alina Bondarenko",
            postOffice: "49044"
        },
        payment: {
            method: "p-o-d",
            receipt: "A5B6C7D8E9F1"
        },
        items: [
            {
                itemId: UUID('f1f1e9d2-8865-4879-96a8-3fa98cacc216'),
                costSum: NumberDecimal('34999.00'),
                quantity: 1
            }
        ]
    },
    {
        _id: 496,
        status: "complete",
        datetime: ISODate('2024-04-28T12:14:09'),
        totalSum: NumberDecimal('44799.00'),
        customer: {
            name: "Yuriy",
            surname: "Grigorenko",
            email: "yuriy.grigorenko@gmail.com",
            phone: "+380731234567"
        },
        delivery: {
            method: "novapost",
            phone: "+380731234567",
            person: "Yuriy Grigorenko",
            postOffice: "Kharkiv, 9"
        },
        payment: {
            method: "p-o-d",
            receipt: "B6C7D8E9F1A2"
        },
        items: [
            {
                itemId: UUID('58d1f9f5-801c-4ee1-a367-c50141685f9f'),
                costSum: NumberDecimal('44799.00'),
                quantity: 1
            }
        ]
    },
    {
        _id: 497,
        status: "complete",
        datetime: ISODate('2024-04-28T14:08:33'),
        totalSum: NumberDecimal('41099.00'),
        customer: {
            name: "Viktor",
            surname: "Dmitriev",
            email: "viktor.dmitriev@gmail.com",
            phone: "+380921234567"
        },
        delivery: {
            method: "curier",
            phone: "+380921234567",
            person: "Viktor Dmitriev",
            address: "Vasylkivska St, 40, Kyiv, Ukraine"
        },
        payment: {
            method: "curier",
            receipt: "C7D8E9F1A2B3"
        },
        items: [
            {
                itemID: UUID('f509d521-b18b-4635-bc48-0754b9e36e4d'),
                totalSum: NumberDecimal('41099.00'),
                quantity: 1
            }
        ]
    },
    {
        _id: 498,
        status: "complete",
        datetime: ISODate('2024-04-28T16:55:46'),
        totalSum: NumberDecimal('12570.00'),
        customer: {
            name: "Maksim",
            surname: "Shevchenko",
            email: "maksim.shevchenko@gmail.com",
            phone: "+380931234567"
        },
        delivery: {
            method: "store",
            phone: "+380931234567",
            person: "Maksim Shevchenko",
            postOffice: "5"
        },
        payment: {
            method: "store",
            receipt: "D8E9F1A2B3C4"
        },
        items: [
            {
                itemId: UUID('f771ffbd-66b0-4d19-99f7-974a9d047c87'),
                costSum: NumberDecimal('12570.00'),
                quantity: 1
            }
        ]
    }
]);
