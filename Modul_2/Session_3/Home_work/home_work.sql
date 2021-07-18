-- Nomer 1
https://github.com/muskarab/GenerasiGigih/tree/main/Modul_2/Session_3/Home_work/ERD.png

-- Nomer 2
CREATE TABLE `customers` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `phone` varchar(15) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `phone` (`phone`)
);

CREATE TABLE `orders` (
  `id` int NOT NULL AUTO_INCREMENT,
  `date` datetime DEFAULT NULL,
  `total` int NOT NULL,
  `customer_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `customer_id` (`customer_id`),
  CONSTRAINT `fk_customers_orders` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`)
);

CREATE TABLE `order_details` (
  `order_id` int NOT NULL,
  `item_id` int NOT NULL,
  `quantity` int NOT NULL,
  KEY `order_id` (`order_id`),
  KEY `item_id` (`item_id`),
  CONSTRAINT `fk_orders_orderdetails` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`),
  CONSTRAINT `fk_items_orderdetails` FOREIGN KEY (`item_id`) REFERENCES `items` (`id`)
);

-- Nomer 3
INSERT INTO `customers` VALUES (1,'Mustafa','085123967346'),(2,'Kamal','081063847347'),(3,'Rabbani','081501846293'),(4,'Romi','081684720638'),(5,'Arya','081603859472');

INSERT INTO `orders` VALUES (1,'2021-07-18 11:31:01',27000,1),(2,'2021-07-19 11:31:01',40000,2),(3,'2021-07-20 11:31:01',33000,3),(4,'2021-07-21 11:31:01',49000,4),(5,'2021-07-22 11:31:01',36000,5);

INSERT INTO `order_details` VALUES (1,1,1),(1,2,1),(2,3,1),(3,4,1),(3,5,1),(4,6,1),(4,7,1),(5,7,1);

-- Nomer 4
SELECT orders.id AS "order id", orders.date AS "order date", customers.name AS "customer name", 
customers.phone AS "customer phone", orders.total AS "total", 
GROUP_CONCAT(items.name) AS "items list" 
FROM orders 
JOIN customers ON orders.customer_id = customers.id 
JOIN order_details ON orders.id = order_details.order_id 
JOIN items ON order_details.item_id = items.id 
GROUP BY orders.id;
