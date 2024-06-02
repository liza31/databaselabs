/* Create node IDs uniqueness (partial replacement for the Enterprise-only NODE KEY) constraints */

/* -- Create "Category" entity nodes ID uniqueness constraint */
CREATE CONSTRAINT IF NOT EXISTS category__id FOR (category:Category)
REQUIRE category.catId IS UNIQUE;

/* -- Create "Brand" entity nodes ID uniqueness constraint */
CREATE CONSTRAINT IF NOT EXISTS brand__id FOR (brand:Brand)
REQUIRE brand.brandId is UNIQUE;

/* -- Create "Product" entity nodes ID uniqueness constraint */
CREATE CONSTRAINT IF NOT EXISTS product__id FOR (product:Product)
REQUIRE product.prodId is UNIQUE;

/* -- Create "User" entity nodes ID uniqueness constraint */
CREATE CONSTRAINT IF NOT EXISTS user__id FOR (user:User)
REQUIRE user.userId is UNIQUE;

/* -- Create "Order" entity nodes ID uniqueness constraint */
CREATE CONSTRAINT IF NOT EXISTS order__id FOR (order:Order)
REQUIRE order.ordId is UNIQUE;
