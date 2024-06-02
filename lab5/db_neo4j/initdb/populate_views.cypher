/* Populate "User =1=> viewed -N-> Product" relationships */

MATCH (user:User {userId: 119})
MATCH (product:Product {prodId: 'ce8e362b-7d70-4ee8-accf-14e0152c3721'})
MERGE (user)-[viewRecord:VIEWED]->(product)
SET viewRecord.datetime = localdatetime('2024-03-21T19:18:20');

MATCH (user:User {userId: 119})
MATCH (product:Product {prodId: '98759e19-e09c-4d5f-8115-f69d935934ee'})
MERGE (user)-[viewRecord:VIEWED]->(product)
SET viewRecord.datetime = localdatetime('2024-04-22T14:08:34');

MATCH (user:User {userId: 291})
MATCH (product:Product {prodId: '1e8a2ccf-2e25-4476-b250-d28721788269'})
MERGE (user)-[viewRecord:VIEWED]->(product)
SET viewRecord.datetime = localdatetime('2024-04-22T15:24:03');

MATCH (user:User {userId: 291})
MATCH (product:Product {prodId: '2aba356e-d10e-44c4-8c80-a529c7013f85'})
MERGE (user)-[viewRecord:VIEWED]->(product)
SET viewRecord.datetime = localdatetime('2024-04-22T15:26:11');

MATCH (user:User {userId: 291})
MATCH (product:Product {prodId: '9e720a91-ea78-4008-b757-8e7ad6e9bba7'})
MERGE (user)-[viewRecord:VIEWED]->(product)
SET viewRecord.datetime = localdatetime('2024-04-22T15:27:45');

MATCH (user:User {userId: 294})
MATCH (product:Product {prodId: 'f509d521-b18b-4635-bc48-0754b9e36e4d'})
MERGE (user)-[viewRecord:VIEWED]->(product)
SET viewRecord.datetime = localdatetime('2024-04-23T08:55:41');

MATCH (user:User {userId: 297})
MATCH (product:Product {prodId: '98759e19-e09c-4d5f-8115-f69d935934ee'})
MERGE (user)-[viewRecord:VIEWED]->(product)
SET viewRecord.datetime = localdatetime('2024-04-23T10:01:28');

MATCH (user:User {userId: 297})
MATCH (product:Product {prodId: 'ce8e362b-7d70-4ee8-accf-14e0152c3721'})
MERGE (user)-[viewRecord:VIEWED]->(product)
SET viewRecord.datetime = localdatetime('2024-04-23T10:40:57');

MATCH (user:User {userId: 299})
MATCH (product:Product {prodId: 'f1f1e9d2-8865-4879-96a8-3fa98cacc216'})
MERGE (user)-[viewRecord:VIEWED]->(product)
SET viewRecord.datetime = localdatetime('2024-04-24T06:43:11');

MATCH (user:User {userId: 299})
MATCH (product:Product {prodId: '8f00c00d-c3dc-480a-a8c1-77341aa613ef'})
MERGE (user)-[viewRecord:VIEWED]->(product)
SET viewRecord.datetime = localdatetime('2024-04-24T07:26:49');

MATCH (user:User {userId: 119})
MATCH (product:Product {prodId: '1e8a2ccf-2e25-4476-b250-d28721788269'})
MERGE (user)-[viewRecord:VIEWED]->(product)
SET viewRecord.datetime = localdatetime('2024-04-24T08:08:19');

MATCH (user:User {userId: 119})
MATCH (product:Product {prodId: '9e720a91-ea78-4008-b757-8e7ad6e9bba7'})
MERGE (user)-[viewRecord:VIEWED]->(product)
SET viewRecord.datetime = localdatetime('2024-04-24T08:11:09');

MATCH (user:User {userId: 299})
MATCH (product:Product {prodId: '5c7cd55d-14e5-40db-9828-fe2c681e1782'})
MERGE (user)-[viewRecord:VIEWED]->(product)
SET viewRecord.datetime = localdatetime('2024-04-24T08:15:07');

MATCH (user:User {userId: 299})
MATCH (product:Product {prodId: '5e29b0e0-d88f-4206-bd9c-eb6dc192920c'})
MERGE (user)-[viewRecord:VIEWED]->(product)
SET viewRecord.datetime = localdatetime('2024-04-24T08:17:29');

MATCH (user:User {userId: 119})
MATCH (product:Product {prodId: '2aba356e-d10e-44c4-8c80-a529c7013f85'})
MERGE (user)-[viewRecord:VIEWED]->(product)
SET viewRecord.datetime = localdatetime('2024-04-24T09:30:21');

MATCH (user:User {userId: 300})
MATCH (product:Product {prodId: '5e29b0e0-d88f-4206-bd9c-eb6dc192920c'})
MERGE (user)-[viewRecord:VIEWED]->(product)
SET viewRecord.datetime = localdatetime('2024-04-24T21:26:12');

MATCH (user:User {userId: 300})
MATCH (product:Product {prodId: '8f00c00d-c3dc-480a-a8c1-77341aa613ef'})
MERGE (user)-[viewRecord:VIEWED]->(product)
SET viewRecord.datetime = localdatetime('2024-04-25T12:57:38');

MATCH (user:User {userId: 301})
MATCH (product:Product {prodId: '632e8927-3c43-42b5-aaf8-0587df28b0b0'})
MERGE (user)-[viewRecord:VIEWED]->(product)
SET viewRecord.datetime = localdatetime('2024-04-25T16:32:43');

MATCH (user:User {userId: 303})
MATCH (product:Product {prodId: '0415ea20-31cc-40f4-886f-c7581980d13b'})
MERGE (user)-[viewRecord:VIEWED]->(product)
SET viewRecord.datetime = localdatetime('2024-04-26T10:07:45');

MATCH (user:User {userId: 303})
MATCH (product:Product {prodId: '9e720a91-ea78-4008-b757-8e7ad6e9bba7'})
MERGE (user)-[viewRecord:VIEWED]->(product)
SET viewRecord.datetime = localdatetime('2024-04-26T10:05:21');

MATCH (user:User {userId: 303})
MATCH (product:Product {prodId: '2aba356e-d10e-44c4-8c80-a529c7013f85'})
MERGE (user)-[viewRecord:VIEWED]->(product)
SET viewRecord.datetime = localdatetime('2024-04-26T10:17:23');

MATCH (user:User {userId: 291})
MATCH (product:Product {prodId: 'f771ffbd-66b0-4d19-99f7-974a9d047c87'})
MERGE (user)-[viewRecord:VIEWED]->(product)
SET viewRecord.datetime = localdatetime('2024-04-26T11:33:12');

MATCH (user:User {userId: 304})
MATCH (product:Product {prodId: '8f00c00d-c3dc-480a-a8c1-77341aa613ef'})
MERGE (user)-[viewRecord:VIEWED]->(product)
SET viewRecord.datetime = localdatetime('2024-04-27T04:43:43');

MATCH (user:User {userId: 304})
MATCH (product:Product {prodId: 'f771ffbd-66b0-4d19-99f7-974a9d047c87'})
MERGE (user)-[viewRecord:VIEWED]->(product)
SET viewRecord.datetime = localdatetime('2024-04-27T05:32:13');

MATCH (user:User {userId: 304})
MATCH (product:Product {prodId: '09007b6a-bd66-4512-adf4-5af53002e477'})
MERGE (user)-[viewRecord:VIEWED]->(product)
SET viewRecord.datetime = localdatetime('2024-04-27T09:01:52');

MATCH (user:User {userId: 300})
MATCH (product:Product {prodId: '1e8a2ccf-2e25-4476-b250-d28721788269'})
MERGE (user)-[viewRecord:VIEWED]->(product)
SET viewRecord.datetime = localdatetime('2024-04-27T10:24:19');

MATCH (user:User {userId: 300})
MATCH (product:Product {prodId: 'f1f1e9d2-8865-4879-96a8-3fa98cacc216'})
MERGE (user)-[viewRecord:VIEWED]->(product)
SET viewRecord.datetime = localdatetime('2024-04-27T10:27:04');

MATCH (user:User {userId: 297})
MATCH (product:Product {prodId: 'f1f1e9d2-8865-4879-96a8-3fa98cacc216'})
MERGE (user)-[viewRecord:VIEWED]->(product)
SET viewRecord.datetime = localdatetime('2024-04-28T08:40:16');

MATCH (user:User {userId: 307})
MATCH (product:Product {prodId: '58d1f9f5-801c-4ee1-a367-c50141685f9f'})
MERGE (user)-[viewRecord:VIEWED]->(product)
SET viewRecord.datetime = localdatetime('2024-04-28T11:59:09');

MATCH (user:User {userId: 301})
MATCH (product:Product {prodId: 'f509d521-b18b-4635-bc48-0754b9e36e4d'})
MERGE (user)-[viewRecord:VIEWED]->(product)
SET viewRecord.datetime = localdatetime('2024-04-28T13:53:33');

MATCH (user:User {userId: 294})
MATCH (product:Product {prodId: 'f771ffbd-66b0-4d19-99f7-974a9d047c87'})
MERGE (user)-[viewRecord:VIEWED]->(product)
SET viewRecord.datetime = localdatetime('2024-04-28T16:40:36');
