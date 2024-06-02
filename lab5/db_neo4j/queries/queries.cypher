/* Execute queries specified by the laboratory task */

/* -- 1)  For the specific "Order" node query all the "Item" nodes it "INCLUDES"
          (ordId: 491) */

MATCH (:Order {orderId: 491})-[:INCLUDES]->(item:Item)
RETURN item as orderItems;

/* -- 2) For the specific "Order" calculate its total sum
         (ordId: 491) */

MATCH (order:Order {orderId: 491})-[orderItem:INCLUDES]->(:Item)
RETURN apoc.number.format(sum(orderItem.costSum) / 100, "UAH #,##0.00") AS calculatedOrderSum,
       apoc.number.format(order.totalSum / 100, "UAH #,##0.00") AS declaredOrderSum;

/* -- 3) For the specific "Customer" query all the "Order" nodes it "MADE"
         (Svetlana Polishchuk, userId: 300) */

MATCH (:Customer {userId: 300})-[:MADE]->(order:Order)
RETURN order as customerOrders;

/* -- 4) For the specific "Customer" query all the "Item" nodes it bought through "Order"
         (Svetlana Polishchuk, userId: 300) */

MATCH (:Customer {userId: 300})-[:MADE]->(:Order)-[:INCLUDES]->(item:Item)
RETURN DISTINCT item as customerItems;

/* -- 5) For the specific "Customer" calculate the total quantity of "Item" it bought through "Order"
         (Svetlana Polishchuk, userId: 300) */

MATCH (:Customer {userId: 300})-[:MADE]->(:Order)-[orderItem:INCLUDES]->(:Item)
RETURN sum(orderItem.quantity) AS totalBought;

/* -- 6) For the specific "Customer" calculate the total sum of all the "Order" nodes it "MADE"
         (Svetlana Polishchuk, userId: 300) */

MATCH (:Customer {userId: 300})-[:MADE]->(:Order)-[orderItem:INCLUDES]->(:Item)
RETURN apoc.number.format(sum(orderItem.costSum) / 100, "UAH #,##0.00") AS totalSpent;

/* -- 7) For each "Item" node count total number of sold items, query items data ordering them by this value. */

MATCH (brand:Brand)<-[:LABELED_BY]-(item:Item)-[:BELONGS_TO]->(category:Category)
OPTIONAL MATCH (item)<-[orderItem:INCLUDES]-(:Order)
RETURN category.label AS itemCategory,
       brand.name AS itemBrand,
       item.label AS itemLabel,
       sum(orderItem.quantity) AS totalSold
  ORDER BY totalSold DESC;

/* -- 8) For the specific "Customer" query all the "Item" nodes it "VIEWED"
         (Dmitry Sokolov, userId: 304) */

MATCH (:Customer {userId: 304})-[:VIEWED]->(item:Item)
RETURN item as viewedItems;

/* -- 9) For the specific "Item" query all the other "Item" nodes included ("INCLUDES") in the same orders ("Order")
         ("iPad Air (2023)", prodId: '9e720a91-ea78-4008-b757-8e7ad6e9bba7') */

MATCH (:Item {prodId: '9e720a91-ea78-4008-b757-8e7ad6e9bba7'})<-[:INCLUDES]-(:Order)-[:INCLUDES]->(adjacentItem:Item)
RETURN DISTINCT adjacentItem AS adjacentItems;

/* -- 10) For the specific "Item" query all the "Customer" nodes bought it through "Order"
          ("iPhone 13 Pro Max", prodId: 'f509d521-b18b-4635-bc48-0754b9e36e4d') */

MATCH (:Item {prodId: 'f509d521-b18b-4635-bc48-0754b9e36e4d'})<-[:INCLUDES]-(:Order)<-[:MADE]-(customer:Customer)
RETURN customer AS itemBuyers;

/* -- 11) For the specific "Customer" query all the "Item" nodes it "VIEWED" but not bought through "Order"
          (Dmitry Sokolov, userId: 304) */

MATCH (customer:Customer {userId: 304})-[:VIEWED]->(item:Item)
  WHERE NOT (customer)-[:MADE]->(:Order)-[:INCLUDES]->(item)
RETURN item AS rejectedItems;
