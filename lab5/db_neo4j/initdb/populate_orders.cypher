/* Populate "Order" entities nodes & corresponding relationships */

MATCH (customer:Customer {userId: 119})
MATCH (product0:Product {prodId: '98759e19-e09c-4d5f-8115-f69d935934ee'})
CREATE (order:Order
         {
           orderId: 483,
           status: "complete",
           datetime: localdatetime('2024-04-22T14:23:11'),
           totalSum: 4340000,
           deliveryMethod: "store",
           deliveryPhone: "+380631234567",
           deliveryPerson: "Oleg Kovalenko",
           deliveryPostOffice: "3",
           paymentMethod: "store",
           paymentReceipt: "A4D5E6F7A9B1"
         }
       ),
       (order)-[:INCLUDES {costSum: 4340000, quantity: 1}]->(product0),
       (customer)-[:MADE]->(order);

MATCH (customer:Customer {userId: 291})
MATCH (product0:Product {prodId: '9e720a91-ea78-4008-b757-8e7ad6e9bba7'})
CREATE (order:Order
         {
           orderId: 484,
           status: "complete",
           datetime: localdatetime('2024-04-22T15:42:19'),
           totalSum: 2499900,
           deliveryMethod: "curier",
           deliveryPhone: "+380971234567",
           deliveryPerson: "Irina Petrenko",
           deliveryAddress: "Saksahanskoho St, 35, Kyiv, Ukraine",
           paymentMethod: "curier",
           paymentReceipt: "C1D2E3F4A5B6"
         }
       ),
       (order)-[:INCLUDES {costSum: 2499900, quantity: 1}]->(product0),
       (customer)-[:MADE]->(order);

MATCH (customer:Customer {userId: 294})
MATCH (product0:Product {prodId: 'f509d521-b18b-4635-bc48-0754b9e36e4d'})
CREATE (order:Order
         {
           orderId: 485,
           status: "complete",
           datetime: localdatetime('2024-04-23T09:10:05'),
           totalSum: 4109900,
           deliveryMethod: "ukrposhta",
           deliveryPhone: "+380931234567",
           deliveryPerson: "Maksim Shevchenko",
           deliveryPostOffice: "02090",
           paymentMethod: "p-o-d",
           paymentReceipt: "B2C3D4E5F6A7"
         }
       ),
       (order)-[:INCLUDES {totalSum: 4109900, quantity: 1}]->(product0),
       (customer)-[:MADE]->(order);

MATCH (customer:Customer {userId: 297})
MATCH (product0:Product {prodId: 'ce8e362b-7d70-4ee8-accf-14e0152c3721'})
CREATE (order:Order
         {
           orderId: 486,
           status: "complete",
           datetime: localdatetime('2024-04-23T10:55:33'),
           totalSum: 5499900,
           deliveryMethod: "novapost",
           deliveryPhone: "+380661234567",
           deliveryPerson: "Alina Bondarenko",
           deliveryPostOffice: "Dnipro, 23",
           paymentMethod: "p-o-d",
           paymentReceipt: "D3E4F5A6B7C8"
         }
       ),
       (order)-[:INCLUDES {costSum: 5499900, quantity: 1}]->(product0),
       (customer)-[:MADE]->(order);

MATCH (customer:Customer {userId: 299})
MATCH (product0:Product {prodId: '5c7cd55d-14e5-40db-9828-fe2c681e1782'})
MATCH (product1:Product {prodId: '5e29b0e0-d88f-4206-bd9c-eb6dc192920c'})
CREATE (order:Order
         {
           orderId: 487,
           status: "complete",
           datetime: localdatetime('2024-04-24T08:30:22'),
           totalSum: 3917800,
           deliveryMethod: "store",
           deliveryPhone: "+380681234567",
           deliveryPerson: "Natalia Ivanova",
           deliveryPostOffice: "2",
           paymentMethod: "store",
           paymentReceipt: "E5F6A7B8C9D1"
         }
       ),
       (order)-[:INCLUDES {costSum: 3059900, quantity: 1}]->(product0),
       (order)-[:INCLUDES {costSum: 857900, quantity: 1}]->(product1),
       (customer)-[:MADE]->(order);

MATCH (customer:Customer {userId: 119})
MATCH (product0:Product {prodId: '2aba356e-d10e-44c4-8c80-a529c7013f85'})
CREATE (order:Order
         {
           orderId: 488,
           status: "complete",
           datetime: localdatetime('2024-04-24T09:45:51'),
           totalSum: 219900,
           deliveryMethod: "novapost",
           deliveryPhone: "+380631234567",
           deliveryPerson: "Oleg Kovalenko",
           deliveryPostOffice: "Lviv, 11",
           paymentMethod: "p-o-d",
           paymentReceipt: "F6A7B8C9D1E2"
         }
       ),
       (order)-[:INCLUDES {costSum: 219900, quantity: 1}]->(product0),
       (customer)-[:MADE]->(order);

MATCH (customer:Customer {userId: 300})
MATCH (product0:Product {prodId: '8f00c00d-c3dc-480a-a8c1-77341aa613ef'})
CREATE (order:Order
         {
           orderId: 489,
           status: "complete",
           datetime: localdatetime('2024-04-25T13:12:09'),
           totalSum: 749900,
           deliveryMethod: "curier",
           deliveryPhone: "+380991234567",
           deliveryPerson: "Svetlana Polishchuk",
           deliveryAddress: "Velyka Vasylkivska St, 25, Kyiv, Ukraine",
           paymentMethod: "curier",
           paymentReceipt: "A7B8C9D1E2F3"
         }
       ),
       (order)-[:INCLUDES {costSum: 749900, quantity: 1}]->(product0),
       (customer)-[:MADE]->(order);

MATCH (customer:Customer {userId: 301})
MATCH (product0:Product {prodId: '632e8927-3c43-42b5-aaf8-0587df28b0b0'})
CREATE (order:Order
         {
           orderId: 490,
           status: "complete",
           datetime: localdatetime('2024-04-25T16:47:14'),
           totalSum: 3999900,
           deliveryMethod: "store",
           deliveryPhone: "+380921234567",
           deliveryPerson: "Viktor Dmitriev",
           deliveryPostOffice: "4",
           paymentMethod: "store",
           paymentReceipt: "B9C1D2E3F4A5"
         }
       ),
       (order)-[:INCLUDES {costSum: 3999900, quantity: 1}]->(product0),
       (customer)-[:MADE]->(order);

MATCH (customer:Customer {userId: 303})
MATCH (product0:Product {prodId: '0415ea20-31cc-40f4-886f-c7581980d13b'})
MATCH (product1:Product {prodId: '9e720a91-ea78-4008-b757-8e7ad6e9bba7'})
MATCH (product2:Product {prodId: '2aba356e-d10e-44c4-8c80-a529c7013f85'})
CREATE (order:Order
         {
           orderId: 491,
           status: "complete",
           datetime: localdatetime('2024-04-26T10:22:35'),
           totalSum: 41917000,
           deliveryMethod: "ukrposhta",
           deliveryPhone: "+380671234567",
           deliveryPerson: "Olga Tkachenko",
           deliveryPostOffice: "03150",
           paymentMethod: "p-o-d",
           paymentReceipt: "C1D2E3F4A5B6"
         }
       ),
       (order)-[:INCLUDES {costSum: 22999000, quantity: 10}]->(product0),
       (order)-[:INCLUDES {costSum: 17599200, quantity: 8}]->(product1),
       (order)-[:INCLUDES {costSum: 1318800, quantity: 12}]->(product2),
       (customer)-[:MADE]->(order);

MATCH (customer:Customer {userId: 291})
MATCH (product0:Product {prodId: 'f771ffbd-66b0-4d19-99f7-974a9d047c87'})
CREATE (order:Order
         {
           orderId: 492,
           status: "complete",
           datetime: localdatetime('2024-04-26T11:48:20'),
           totalSum: 1257000,
           deliveryMethod: "novapost",
           deliveryPhone: "+380971234567",
           deliveryPerson: "Irina Petrenko",
           deliveryPostOffice: "Kyiv, 32",
           paymentMethod: "p-o-d",
           paymentReceipt: "D2E3F4A5B6C7"
         }
       ),
       (order)-[:INCLUDES {costSum: 1257000, quantity: 1}]->(product0),
       (customer)-[:MADE]->(order);

MATCH (customer:Customer {userId: 304})
MATCH (product0:Product {prodId: '09007b6a-bd66-4512-adf4-5af53002e477'})
CREATE (order:Order
         {
           orderId: 493,
           status: "complete",
           datetime: localdatetime('2024-04-27T09:16:41'),
           totalSum: 2399800,
           deliveryMethod: "curier",
           deliveryPhone: "+380961234567",
           deliveryPerson: "Dmitry Sokolov",
           deliveryAddress: "Lesi Ukrainky Blvd, 8, Kyiv, Ukraine",
           paymentMethod: "curier",
           paymentReceipt: "E3F4A5B6C7D8"
         }
       ),
       (order)-[:INCLUDES {costSum: 2399800, quantity: 2}]->(product0),
       (customer)-[:MADE]->(order);

MATCH (customer:Customer {userId: 300})
MATCH (product0:Product {prodId: '1e8a2ccf-2e25-4476-b250-d28721788269'})
MATCH (product1:Product {prodId: 'f1f1e9d2-8865-4879-96a8-3fa98cacc216'})
CREATE (order:Order
         {
           orderId: 494,
           status: "complete",
           datetime: localdatetime('2024-04-27T10:39:05'),
           totalSum: 7299800,
           deliveryMethod: "store",
           deliveryPhone: "+380991234567",
           deliveryPerson: "Svetlana Polishchuk",
           deliveryPostOffice: "1",
           paymentMethod: "store",
           paymentReceipt: "F4A5B6C7D8E9"
         }
       ),
       (order)-[:INCLUDES {costSum: 3799900, quantity: 1}]->(product0),
       (order)-[:INCLUDES {costSum: 3499900, quantity: 1}]->(product1),
       (customer)-[:MADE]->(order);

MATCH (customer:Customer {userId: 297})
MATCH (product0:Product {prodId: 'f1f1e9d2-8865-4879-96a8-3fa98cacc216'})
CREATE (order:Order
         {
           orderId: 495,
           status: "complete",
           datetime: localdatetime('2024-04-28T08:55:17'),
           totalSum: 3499900,
           deliveryMethod: "ukrposhta",
           deliveryPhone: "+380661234567",
           deliveryPerson: "Alina Bondarenko",
           deliveryPostOffice: "49044",
           paymentMethod: "p-o-d",
           paymentReceipt: "A5B6C7D8E9F1"
         }
       ),
       (order)-[:INCLUDES {costSum: 3499900, quantity: 1}]->(product0),
       (customer)-[:MADE]->(order);

MATCH (customer:Customer {userId: 307})
MATCH (product0:Product {prodId: '58d1f9f5-801c-4ee1-a367-c50141685f9f'})
CREATE (order:Order
         {
           orderId: 496,
           status: "complete",
           datetime: localdatetime('2024-04-28T12:14:09'),
           totalSum: 4479900,
           deliveryMethod: "novapost",
           deliveryPhone: "+380731234567",
           deliveryPerson: "Yuriy Grigorenko",
           deliveryPostOffice: "Kharkiv, 9",
           paymentMethod: "p-o-d",
           paymentReceipt: "B6C7D8E9F1A2"
         }
       ),
       (order)-[:INCLUDES {costSum: 4479900, quantity: 1}]->(product0),
       (customer)-[:MADE]->(order);

MATCH (customer:Customer {userId: 301})
MATCH (product0:Product {prodId: 'f509d521-b18b-4635-bc48-0754b9e36e4d'})
CREATE (order:Order
         {
           orderId: 497,
           status: "complete",
           datetime: localdatetime('2024-04-28T14:08:33'),
           totalSum: 4109900,
           deliveryMethod: "curier",
           deliveryPhone: "+380921234567",
           deliveryPerson: "Viktor Dmitriev",
           deliveryAddress: "Vasylkivska St, 40, Kyiv, Ukraine",
           paymentMethod: "curier",
           paymentReceipt: "C7D8E9F1A2B3"
         }),
       (order)-[:INCLUDES {costSum: 4109900, quantity: 1}]->(product0),
       (customer)-[:MADE]->(order);

MATCH (customer:Customer {userId: 294})
MATCH (product0:Product {prodId: 'f771ffbd-66b0-4d19-99f7-974a9d047c87'})
CREATE (order:Order
         {
           orderId: 498,
           status: "complete",
           datetime: localdatetime('2024-04-28T16:55:46'),
           totalSum: 1257000,
           deliveryMethod: "store",
           deliveryPhone: "+380931234567",
           deliveryPerson: "Maksim Shevchenko",
           deliveryPostOffice: "5",
           paymentMethod: "store",
           paymentReceipt: "D8E9F1A2B3C4"
         }
       ),
       (order)-[:INCLUDES {costSum: 1257000, quantity: 1}]->(product0),
       (customer)-[:MADE]->(order);
