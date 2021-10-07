-- -----------------------------------------------------
-- Schema full-stack-ecommerce
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `full-stack-ecommerce`;

CREATE SCHEMA `full-stack-ecommerce`;
USE `full-stack-ecommerce` ;

-- -----------------------------------------------------
-- Table `full-stack-ecommerce`.`product_category`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `full-stack-ecommerce`.`product_category` (
  `id` BIGINT(20) NOT NULL AUTO_INCREMENT,
  `category_name` VARCHAR(255) NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE=InnoDB
AUTO_INCREMENT = 1;

-- -----------------------------------------------------
-- Table `full-stack-ecommerce`.`product`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `full-stack-ecommerce`.`product` (
  `id` BIGINT(20) NOT NULL AUTO_INCREMENT,
  `sku` VARCHAR(255) DEFAULT NULL,
  `name` VARCHAR(255) DEFAULT NULL,
  `description` VARCHAR(255) DEFAULT NULL,  
  `image_url` VARCHAR(255) DEFAULT NULL,
  `active` BIT DEFAULT 1,
  `units_in_stock` INT(11) DEFAULT NULL,
  `unit_price` DECIMAL(13,2) DEFAULT NULL,
  `date_created` DATETIME(6) DEFAULT NULL,
  `last_updated` DATETIME(6) DEFAULT NULL,
  `category_id` BIGINT(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_category` (`category_id`),
  CONSTRAINT `fk_category` FOREIGN KEY (`category_id`) REFERENCES `product_category` (`id`)
) 
ENGINE=InnoDB
AUTO_INCREMENT = 1;

-- -----------------------------------------------------
-- Categories
-- -----------------------------------------------------
INSERT INTO product_category(category_name) VALUES ('Pizzas');
INSERT INTO product_category(category_name) VALUES ('Spaghetti');
INSERT INTO product_category(category_name) VALUES ('Salads');
INSERT INTO product_category(category_name) VALUES ('Beverages');

-- -----------------------------------------------------
-- PIZZAS
-- -----------------------------------------------------
INSERT INTO product (sku, name, description, image_url, active, units_in_stock, unit_price, category_id,date_created) VALUES (' PIZZA-1000', 'Pepperoni', '100% Mozzarella, tomato sauce, pepperoni', 'assets/images/products/PIZZAS/pepperoni.png', 1, 100, 14.99, 1, NOW());
INSERT INTO product (sku, name, description, image_url, active, units_in_stock, unit_price, category_id,date_created) VALUES (' PIZZA-1001', 'Special', '100% Mozzarella, tomato sauce, ham, bacon, fresh mushrooms, fresh peppers, onion', 'assets/images/products/PIZZAS/special.png', 1, 100, 20.99, 1, NOW());
INSERT INTO product (sku, name, description, image_url, active, units_in_stock, unit_price, category_id,date_created) VALUES (' PIZZA-1002', 'Cheddar Melt', '100% Mozzarella, tomato sauce, cheddar, bacon, fresh mushrooms', 'assets/images/products/PIZZAS/cheddar-melt.png', 1, 100, 14.99, 1, NOW());
INSERT INTO product (sku, name, description, image_url, active, units_in_stock, unit_price, category_id,date_created) VALUES (' PIZZA-1003', 'Margherita', '100% Mozzarella, tomato sauce', 'assets/images/products/PIZZAS/margherita.png', 1, 100, 13.99, 1, NOW());
INSERT INTO product (sku, name, description, image_url, active, units_in_stock, unit_price, category_id,date_created) VALUES (' PIZZA-1004', 'Ham Special', '100% Mozzarella, tomato sauce, fresh mushrooms, peppers, ham', 'assets/images/products/PIZZAS/ham-special.png', 1, 100, 18.99, 1, NOW());
INSERT INTO product (sku, name, description, image_url, active, units_in_stock, unit_price, category_id,date_created) VALUES (' PIZZA-1005', 'Barbecue Classic', '100% Mozzarella, BBQ sauce, spicy beef, bacon', 'assets/images/products/PIZZAS/barbecue-classic.png', 1, 100, 23.99, 1, NOW());
INSERT INTO product (sku, name, description, image_url, active, units_in_stock, unit_price, category_id,date_created) VALUES (' PIZZA-1006', 'Barbecue Chicken', '100% Mozzarella, BBQ sauce, chicken, bacon', 'assets/images/products/PIZZAS/barbecue-chicken.png', 1, 100, 14.99, 1, NOW());
INSERT INTO product (sku, name, description, image_url, active, units_in_stock, unit_price, category_id,date_created) VALUES (' PIZZA-1007', 'American Classic', '100% Mozzarella, tomato sauce, pepperoni, spicy beef, fresh mushrooms', 'assets/images/products/PIZZAS/american-classic.png', 1, 100, 16.99, 1, NOW());
INSERT INTO product (sku, name, description, image_url, active, units_in_stock, unit_price, category_id,date_created) VALUES (' PIZZA-1008', 'Parmesana', '100% Mozzarella, vegetable cream, parmesan reggiano, fresh tomatoes, basil', 'assets/images/products/PIZZAS/parmesana.png', 1, 100, 25.99, 1, NOW());
INSERT INTO product (sku, name, description, image_url, active, units_in_stock, unit_price, category_id,date_created) VALUES (' PIZZA-1009', 'Greek', '100% Mozzarella, tomato sauce, feta cheece, sausage, fresh peppers, fresh tomatoes, olives, onion, regano', 'assets/images/products/PIZZAS/greek.png', 1, 100, 23.99, 1, NOW());
INSERT INTO product (sku, name, description, image_url, active, units_in_stock, unit_price, category_id,date_created) VALUES (' PIZZA-1010', 'Pesto', '100% Mozzarella, tomato sauce, pesto sauce, fresh tomatoes, parmesan reggiano, basil', 'assets/images/products/PIZZAS/pesto.png', 1, 100, 24.99, 1, NOW());
INSERT INTO product (sku, name, description, image_url, active, units_in_stock, unit_price, category_id,date_created) VALUES (' PIZZA-1011', 'Tropicana', '100% Mozzarella, tomato sauce, ham, pineapple', 'assets/images/products/PIZZAS/tropicana.png', 1, 100, 19.99, 1, NOW());
INSERT INTO product (sku, name, description, image_url, active, units_in_stock, unit_price, category_id,date_created) VALUES (' PIZZA-1012', 'Ham & Mushroom', '100% Mozzarella, tomato sauce, fresh mushrooms, ham', 'assets/images/products/PIZZAS/ham-mushroom.png', 1, 100, 24.99, 1, NOW());
INSERT INTO product (sku, name, description, image_url, active, units_in_stock, unit_price, category_id,date_created) VALUES (' PIZZA-1013', 'Ham & Bacon', '100% Mozzarella, tomato sauce, ham, bacon, cheddar', 'assets/images/products/PIZZAS/ham-bacon.png', 1, 100, 19.99, 1, NOW());
INSERT INTO product (sku, name, description, image_url, active, units_in_stock, unit_price, category_id,date_created) VALUES (' PIZZA-1014', 'Fiorentina', '100% Mozzarella, tomato sauce, pepperoni, cream cheese, olive oil, arugula', 'assets/images/products/PIZZAS/fiorentina.png', 1, 100, 22.99, 1, NOW());
INSERT INTO product (sku, name, description, image_url, active, units_in_stock, unit_price, category_id,date_created) VALUES (' PIZZA-1015', '4 Cheese', '100% Mozzarella, tomato sauce, parmesan reggiano, cream cheese, feta cheese', 'assets/images/products/PIZZAS/4-cheese.png', 1, 100, 22.99, 1, NOW());
INSERT INTO product (sku, name, description, image_url, active, units_in_stock, unit_price, category_id,date_created) VALUES (' PIZZA-1016', 'Burger Classic', '100% Mozzarella, burger sauce, pickles, spicy beef, cheddar, onion, fresh tomatoes', 'assets/images/products/PIZZAS/burger-classic.png', 1, 100, 27.99, 1, NOW());
INSERT INTO product (sku, name, description, image_url, active, units_in_stock, unit_price, category_id,date_created) VALUES (' PIZZA-1017', 'Burger BBQ', '100% Mozzarella, BBQ sauce, onion, checken, fresh tomatoes', 'assets/images/products/PIZZAS/burger-bbq.png', 1, 100, 13.99, 1, NOW());
INSERT INTO product (sku, name, description, image_url, active, units_in_stock, unit_price, category_id,date_created) VALUES (' PIZZA-1018', 'Mamma`s Pizza', '100% Mozzarella, tomato sauce, cheddar, bacon, sausage, fresh peppers', 'assets/images/products/PIZZAS/mamas.png', 1, 100, 26.99, 1, NOW());
INSERT INTO product (sku, name, description, image_url, active, units_in_stock, unit_price, category_id,date_created) VALUES (' PIZZA-1019', 'flambée', '100% Mozzarella, vegetable cream, bacon, onion', 'assets/images/products/PIZZAS/flambee.png', 1, 100, 13.99, 1, NOW());
INSERT INTO product (sku, name, description, image_url, active, units_in_stock, unit_price, category_id,date_created) VALUES (' PIZZA-1020', 'Alfredo', '100% Mozzarella, vegetable cream, spinach, parmesan reggiano, chicken', 'assets/images/products/PIZZAS/alfredo.png', 1, 100, 19.99, 1, NOW());


-- -----------------------------------------------------
-- SPAGHETTI
-- -----------------------------------------------------
INSERT INTO product (sku, name, description, image_url, active, units_in_stock, unit_price, category_id,date_created) VALUES ('SPAGHETTI-1000', 'Cheesy Pasta Bake', 'vegetable cream, mozzarela, cheddar, parmesan reggiano', 'assets/images/products/SPAGHETTIS/cheesy-pasta.png', 1, 100, 18.99, 2, NOW());
INSERT INTO product (sku, name, description, image_url, active, units_in_stock, unit_price, category_id,date_created) VALUES ('SPAGHETTI-1001', 'Napolitaine', 'fresh tomatoes sauce, fresh basil, parmesan eggiano', 'assets/images/products/SPAGHETTIS/napolitane.png', 1, 100, 18.99, 2, NOW());
INSERT INTO product (sku, name, description, image_url, active, units_in_stock, unit_price, category_id,date_created) VALUES ('SPAGHETTI-1002', 'Pasta Vegan', 'fresh tomatoes sauce, ground soy meat', 'assets/images/products/SPAGHETTIS/pasta-vegan.png', 1, 100, 18.99, 2, NOW());
INSERT INTO product (sku, name, description, image_url, active, units_in_stock, unit_price, category_id,date_created) VALUES ('SPAGHETTI-1003', 'Chicken Alfredo', 'vegetable cream, chicken, spinach, parmesan reggiano', 'assets/images/products/SPAGHETTIS/chicken-alfredo.png', 1, 100, 18.99, 2, NOW());
INSERT INTO product (sku, name, description, image_url, active, units_in_stock, unit_price, category_id,date_created) VALUES ('SPAGHETTI-1004', 'Pasta 4 cheese', 'cream, Gouda & Edam, parmesan regiano, grana padano', 'assets/images/products/SPAGHETTIS/4-cheese.png', 1, 100, 18.99, 2, NOW());
INSERT INTO product (sku, name, description, image_url, active, units_in_stock, unit_price, category_id,date_created) VALUES ('SPAGHETTI-1005', 'Carbonara', 'vegetable cream, fresh mushrooms, bacon, parmesan reggiano, grana padano', 'assets/images/products/SPAGHETTIS/carbonara.png', 1, 100, 18.99, 2, NOW());
INSERT INTO product (sku, name, description, image_url, active, units_in_stock, unit_price, category_id,date_created) VALUES ('SPAGHETTI-1006', 'Amatriciana', 'tomato sauce, bacon, onion, parmessan reggiano, grana padano', 'assets/images/products/SPAGHETTIS/amatriciana.png', 1, 100, 18.99, 2, NOW());
INSERT INTO product (sku, name, description, image_url, active, units_in_stock, unit_price, category_id,date_created) VALUES ('SPAGHETTI-1007', 'Pasta Al Pesto', 'pesto sauce, fresh tomatoes, basil, parmesan reggiano, grana padano', 'assets/images/products/SPAGHETTIS/pesto.png', 1, 100, 18.99, 2, NOW());


-- -----------------------------------------------------
-- SALADS
-- -----------------------------------------------------
INSERT INTO product (sku, name, description, image_url, active, units_in_stock, unit_price, category_id,date_created) VALUES ('SALAD-1000', 'Chef salad', 'hard-boiled egg, ham, turkey, chicken, fresh-tomatoes, cucumbers, cheese', 'assets/images/products/SALADS/chef.png', 1, 100, 17.99, 3, NOW());
INSERT INTO product (sku, name, description, image_url, active, units_in_stock, unit_price, category_id,date_created) VALUES ('SALAD-1001', 'Caesar`s salad', 'bacon, lettuce, hard-boiled egg, cheese, lettuce, caesar`s dressing', 'assets/images/products/SALADS/caesar.png', 1, 100, 17.99, 3, NOW());
INSERT INTO product (sku, name, description, image_url, active, units_in_stock, unit_price, category_id,date_created) VALUES ('SALAD-1002', 'Spinach salad', 'spinach, feta cheese, onion,almonds, vinaigrette dressing', 'assets/images/products/SALADS/spinach.png', 1, 100, 17.99, 3, NOW());
INSERT INTO product (sku, name, description, image_url, active, units_in_stock, unit_price, category_id,date_created) VALUES ('SALAD-1003', 'Green salad', 'lettuce, corn, tomatoes, vinaigrette dressing', 'assets/images/products/SALADS/green.png', 1, 100, 17.99, 3, NOW());
INSERT INTO product (sku, name, description, image_url, active, units_in_stock, unit_price, category_id,date_created) VALUES ('SALAD-1004', 'Greek salad', 'fresh tomatoes, cucumber, onions, pepper, feta cheese, olives ', 'assets/images/products/SALADS/greek.png', 1, 100, 17.99, 3, NOW());

-- -----------------------------------------------------
-- BEVERAGES
-- -----------------------------------------------------
INSERT INTO product (sku, name, description, image_url, active, units_in_stock, unit_price, category_id,date_created) VALUES ('BEVERAGE-1000', 'Cola 330ml', ' ', 'assets/images/products/BEVERAGES/cola-330.png', 1, 100, 0.90, 4, NOW());
INSERT INTO product (sku, name, description, image_url, active, units_in_stock, unit_price, category_id,date_created) VALUES ('BEVERAGE-1001', 'Sprite 330ml', ' ', 'assets/images/products/BEVERAGES/sprite.png', 1, 100, 0.90, 4, NOW());
INSERT INTO product (sku, name, description, image_url, active, units_in_stock, unit_price, category_id,date_created) VALUES ('BEVERAGE-1002', 'Cola - zero 330ml', ' ', 'assets/images/products/BEVERAGES/colazero-330.png', 1, 100, 0.90, 4, NOW());
INSERT INTO product (sku, name, description, image_url, active, units_in_stock, unit_price, category_id,date_created) VALUES ('BEVERAGE-1003', 'Fanta 330ml', ' ', 'assets/images/products/BEVERAGES/fanta-330.png', 1, 100, 0.90, 4, NOW());
INSERT INTO product (sku, name, description, image_url, active, units_in_stock, unit_price, category_id,date_created) VALUES ('BEVERAGE-1004', 'Cola 500ml', ' ', 'assets/images/products/BEVERAGES/cola-500.png', 1, 100, 1.20, 4, NOW());
INSERT INTO product (sku, name, description, image_url, active, units_in_stock, unit_price, category_id,date_created) VALUES ('BEVERAGE-1005', 'Cola  - zero 500ml', ' ', 'assets/images/products/BEVERAGES/colazero-500.png', 1, 100, 1.20, 4, NOW());
INSERT INTO product (sku, name, description, image_url, active, units_in_stock, unit_price, category_id,date_created) VALUES ('BEVERAGE-1006', 'beer 330ml', ' ', 'assets/images/products/BEVERAGES/beer.png', 1, 100, 1.50, 4, NOW());
INSERT INTO product (sku, name, description, image_url, active, units_in_stock, unit_price, category_id,date_created) VALUES ('BEVERAGE-1007', 'Cola 1,5lt', ' ', 'assets/images/products/BEVERAGES/cola-15.png', 1, 100, 2.50, 4, NOW());
INSERT INTO product (sku, name, description, image_url, active, units_in_stock, unit_price, category_id,date_created) VALUES ('BEVERAGE-1008', 'Cola - zero 1,5lt', ' ', 'assets/images/products/BEVERAGES/colazero-15.png', 1, 100, 2.50, 4, NOW());
INSERT INTO product (sku, name, description, image_url, active, units_in_stock, unit_price, category_id,date_created) VALUES ('BEVERAGE-1009', 'Water 500ml', ' ', 'assets/images/products/BEVERAGES/water.png', 1, 100, 0.50, 4, NOW());

select * from product;
Create  Table if not exists `full-stack-ecommerce`.`city` (
`id` smallint unsigned not null,
`code` varchar(2) default null,
`name` varchar(60) default null,
primary key (`id`)
) engine=InnoDB;

Create Table if not exists `full-stack-ecommerce`.`municipalities`(
`id` smallint unsigned not null,
`name` varchar(60) default null,
`city_id` smallint unsigned not null,
primary key(`id`),
key fk_city(`city_id`),
constraint fk_city foreign key (city_id) references city(`id`)
)Engine=InnoDb AUTO_INCREMENT=1;



INSERT INTO city(id,code,name) VALUES (1,"At",'Athens');
INSERT INTO city(id,code,name) VALUES (2,"Th",'Thessaloniki');
INSERT INTO city(id,code,name) VALUES (3,"Pa",'Patra');
INSERT INTO city(id,code,name) VALUES (4,"La",'Lamia');
INSERT INTO city(id,code,name) VALUES (5,"Bo",'Bolos');

select * from city;

INSERT INTO municipalities(id,name,city_id) VALUES (1,'Glyfada',1);
INSERT INTO municipalities(id,name,city_id) VALUES (2,'Alimos',1);
INSERT INTO municipalities(id,name,city_id) VALUES (3,'Palaio Faliro',1);
INSERT INTO municipalities(id,name,city_id) VALUES (13,'Argiroupoli',1);
INSERT INTO municipalities(id,name,city_id) VALUES (4,'Petroupoli',1);
INSERT INTO municipalities(id,name,city_id) VALUES (5,'Xolargos',1);
INSERT INTO municipalities(id,name,city_id) VALUES (6,'Athinon',1);
INSERT INTO municipalities(id,name,city_id) VALUES (7,'Psyxiko',1);
INSERT INTO municipalities(id,name,city_id) VALUES (8,'Buronas',1);
INSERT INTO municipalities(id,name,city_id) VALUES (9,'Hlioupoli',1);
INSERT INTO municipalities(id,name,city_id) VALUES (10,'Dafni',1);
INSERT INTO municipalities(id,name,city_id) VALUES (11,'Elliniko',1);
INSERT INTO municipalities(id,name,city_id) VALUES (12,'Pagkrati',1);

select * from municipalities;
-- Table structure for table `address`
--
CREATE TABLE `address` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `street` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `municipality` varchar(255) DEFAULT NULL,    
  `zip_code` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Table structure for table `customer`
--
CREATE TABLE `customer` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `first_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Table structure for table `orders`
--
CREATE TABLE `orders` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `order_tracking_number` varchar(255) DEFAULT NULL,
  `total_price` decimal(19,2) DEFAULT NULL,
  `total_quantity` int DEFAULT NULL,
  `billing_address_id` bigint DEFAULT NULL,
  `customer_id` bigint DEFAULT NULL,
  `shipping_address_id` bigint DEFAULT NULL,
  `status` varchar(128) DEFAULT NULL,
  `date_created` datetime(6) DEFAULT NULL,
  `last_updated` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_billing_address_id` (`billing_address_id`),
  UNIQUE KEY `UK_shipping_address_id` (`shipping_address_id`),
  KEY `K_customer_id` (`customer_id`),
  CONSTRAINT `FK_customer_id` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`id`),
  CONSTRAINT `FK_billing_address_id` FOREIGN KEY (`billing_address_id`) REFERENCES `address` (`id`),
  CONSTRAINT `FK_shipping_address_id` FOREIGN KEY (`shipping_address_id`) REFERENCES `address` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Table structure for table `order_items`
--
CREATE TABLE `order_item` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `image_url` varchar(255) DEFAULT NULL,
  `quantity` int DEFAULT NULL,
  `unit_price` decimal(19,2) DEFAULT NULL,
  `order_id` bigint DEFAULT NULL,
  `product_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `K_order_id` (`order_id`),
  CONSTRAINT `FK_order_id` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`),
  CONSTRAINT `FK_product_id` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

