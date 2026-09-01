/*DROP DATABASE IF EXISTS restaurant; */


/*This database is for a restaurant. It stores customers details, table reservations, menu items, 
 and customer orders. The DB helps the restaurant to manage bookingd and track orders.
 Normalisation: 
 customer details are stored once in the customer table, menu in the menu table.
 Reservations link to customers using customer_id.
Orders are linked to customers and menu items using foreign keys. This avoids repeating customers and menu information in other tables
*/

CREATE DATABASE restaurant;
USE restaurant;
SHOW DATABASES;

CREATE TABLE customers (
customer_id INT PRIMARY KEY AUTO_INCREMENT,
first_name VARCHAR(50) NOT NULL,
last_name VARCHAR(50) NOT NULL,
email VARCHAR(100) NOT NULL UNIQUE,
phone_number VARCHAR(20) 
);

SHOW TABLES;

CREATE TABLE reservations (
reservation_id INT PRIMARY KEY AUTO_INCREMENT,
customer_id INT NOT NULL,
reservation_date DATE NOT NULL,
reservation_time TIME NOT NULL,
number_of_guests INT NOT NULL,
table_number INT NOT NULL,
status VARCHAR(20) DEFAULT 'Confirmed',

/* 2 constraints for reservations table*/
CHECK (number_of_guests > 0),
CHECK (status IN ('Confirmed', 
'Completed', 'Cancelled')),


FOREIGN KEY 
(customer_id)
REFERENCES 	customers(customer_id)
);



CREATE TABLE menu (
menu_id INT PRIMARY KEY AUTO_INCREMENT,
item_name VARCHAR(100) NOT NULL UNIQUE,
category VARCHAR(50) NOT NULL,
price DECIMAL (10,2) NOT NULL,
vegetarian BOOLEAN DEFAULT FALSE
);

CREATE TABLE orders (
order_id INT PRIMARY KEY AUTO_INCREMENT,
customer_id INT NOT NULL,
menu_id INT NOT NULL,
quantity INT NOT NULL DEFAULT 1,
order_date DATE NOT NULL,
order_time TIME NOT NULL,
status VARCHAR(20) DEFAULT 'Completed',

CHECK (quantity > 0),
CHECK (status IN ('Completed', 'Pending', 'Cancelled')),
FOREIGN KEY (customer_id)
REFERENCES 	customers(customer_id),
FOREIGN KEY (menu_id)
REFERENCES menu(menu_id)

);

INSERT INTO customers
(first_name, last_name, email, phone_number)
VALUES ('Claire', 'Dunphy', 'claire.dunphy@gmail.com', '07123760948');

INSERT INTO customers
(first_name, last_name, email, phone_number)
VALUES ('Phil', 'Dunphy', 'phil.dunphy@gmail.com', '07097491837');

INSERT INTO customers
(first_name, last_name, email, phone_number)
VALUES ('Jay', 'Pritchett', 'jay.pritchett@gmail.com', '07945760917');

INSERT INTO customers
(first_name, last_name, email, phone_number)
VALUES ('Gloria', 'Pritchett', 'gloria.pritchett@gmail.com', '07945405917');

INSERT INTO customers
(first_name, last_name, email, phone_number)
VALUES ('Hailee', 'Dunphy', 'hailee.dunphy@gmail.com', '07099809834');

INSERT INTO customers
(first_name, last_name, email, phone_number)
VALUES ('Amy', 'Dunphy', 'amy.dunphy@gmail.com', '09017491547');

INSERT INTO customers
(first_name, last_name, email, phone_number)
VALUES ('Tom', 'Pritchett', 'tom.pritchett@gmail.com', '07610405917');

INSERT INTO customers
(first_name, last_name, email, phone_number)
VALUES ('Plant', 'Pritchett', 'plant.pritchett@gmail.com', '07945701209');


INSERT INTO menu
(item_name, category, price, vegetarian)
VALUES ('Margherita Pizza', 'Main', 12.00, TRUE);

INSERT INTO menu 
(item_name, category, price, vegetarian) 
VALUES ('Pepperoni Pizza', 'Main', 13.750, FALSE);


INSERT INTO menu (item_name, category, price, vegetarian)
VALUES ('Ice cream', 'Dessert', 7.20, TRUE);


INSERT INTO menu (item_name, category, price, vegetarian) 
VALUES ('Greek Salad', 'Main', 11.50, TRUE);
INSERT INTO menu (item_name, category, price, vegetarian) VALUES ('Brownie', 'Dessert', 9.50, TRUE);

INSERT INTO menu (item_name, category, price, vegetarian) 
VALUES ('Fried Chicken', 'Main', 11.75, FALSE);

INSERT INTO menu (item_name, category, price, vegetarian) 
VALUES ('Cheesecake', 'Dessert', 8.90, TRUE);

INSERT INTO menu (item_name, category, price, vegetarian) 
VALUES ('Fresh apple juice', 'Drink', 4.95, TRUE);




INSERT INTO reservations (customer_id, reservation_date, reservation_time, number_of_guests, table_number, status) 
VALUES (1, '2026-09-05', '18:30:00', 2, 1, 'Confirmed'); 


INSERT INTO reservations (customer_id, reservation_date, reservation_time, number_of_guests, table_number, status)
 VALUES (2, '2026-09-05', '19:00:00', 4, 2, 'Confirmed'); 

INSERT INTO reservations (customer_id, reservation_date, reservation_time, number_of_guests, table_number, status) 
VALUES (3, '2026-09-06', '18:00:00', 3, 3, 'Confirmed'); 

INSERT INTO reservations (customer_id, reservation_date, reservation_time, number_of_guests, table_number, status) 
VALUES (4, '2026-09-06', '19:30:00', 2, 4, 'Confirmed');

 INSERT INTO reservations (customer_id, reservation_date, reservation_time, number_of_guests, table_number, status) 
VALUES (5, '2026-09-07', '20:00:00', 5, 5, 'Confirmed');

 INSERT INTO reservations (customer_id, reservation_date, reservation_time, number_of_guests, table_number, status) 
VALUES (6, '2026-09-07', '18:30:00', 2, 6, 'Completed'); 

INSERT INTO reservations (customer_id, reservation_date, reservation_time, number_of_guests, table_number, status) 
VALUES (7, '2026-09-08', '19:00:00', 6, 7, 'Confirmed'); 

INSERT INTO reservations (customer_id, reservation_date, reservation_time, number_of_guests, table_number, status)
 VALUES (8, '2026-09-08', '19:30:00', 4, 8, 'Confirmed'); 

INSERT INTO orders 
(customer_id, menu_id, quantity, order_date, order_time, status)
VALUES 
(1, 1, 1, '2026-09-05', '19:00:00', 'Completed');

INSERT INTO orders 
(customer_id, menu_id, quantity, order_date, order_time, status)
VALUES 
(2, 2, 2, '2026-09-05', '19:30:00', 'Completed');


INSERT INTO orders 
(customer_id, menu_id, quantity, order_date, order_time, status)
VALUES 
(3, 3, 1, '2026-09-06', '18:30:00', 'Completed');

INSERT INTO orders 
(customer_id, menu_id, quantity, order_date, order_time, status)
VALUES 
(4, 4, 1, '2026-09-06', '20:00:00', 'Completed');

INSERT INTO orders 
(customer_id, menu_id, quantity, order_date, order_time, status)
VALUES 
(5, 5, 2, '2026-09-07', '20:30:00', 'Completed');

INSERT INTO orders 
(customer_id, menu_id, quantity, order_date, order_time, status)
VALUES 
(6, 6, 1, '2026-09-07', '19:00:00', 'Completed');

INSERT INTO orders 
(customer_id, menu_id, quantity, order_date, order_time, status)
VALUES 
(7, 7, 2, '2026-09-08', '19:30:00', 'Completed');

INSERT INTO orders 
(customer_id, menu_id, quantity, order_date, order_time, status)
VALUES 
(8, 8, 3, '2026-09-08', '20:00:00', 'Completed');


SELECT * FROM customers;
SELECT * FROM menu; 
SELECT * FROM reservations; 
SELECT * FROM orders; 

SELECT item_name, price
FROM menu
ORDER BY price DESC; 

SELECT AVG(price) AS average_price
FROM menu;

SELECT COUNT(*) AS total_customers
FROM customers;

SELECT customers.first_name, customers.last_name,
reservations.reservation_date, 
reservations.reservation_time, 
reservations.number_of_guests
FROM customers
JOIN reservations
ON customers.customer_id = reservations.customer_id
ORDER BY reservations.reservation_date;


SELECT customers.first_name, customers.last_name,
menu.item_name, 
orders.quantity,
orders.order_date
FROM orders
JOIN customers
ON orders.customer_id = customers.customer_id
JOIN menu
ON orders.menu_id = menu.menu_id
ORDER BY orders.order_date;

/*Adding two functions testing first*/

/*joining first and last names*/
SELECT CONCAT (first_name, ' ', last_name) AS full_name,
email
FROM customers
ORDER BY full_name;

/*to return the weekday of res.*/
SELECT reservation_date,
DAYNAME(reservation_date) AS day_name
FROM reservations
ORDER BY reservation_date;


/*addong a temporary customer to mark off delete specification so that it still meets the 8 rows requirement*/

INSERT INTO customers (first_name, last_name, email, phone_number)
VALUES ('Luke', 'Dunphy', 'luke.dunphy@gmail.com', '07123704215');

DELETE FROM customers
WHERE email = 'luke.dunphy@gmail.com'


/*procedure*/


DROP PROCEDURE IF EXISTS GetCustomerOrders; 



CREATE PROCEDURE GetCustomerOrders (IN customer_id_input INT)
	SELECT customers.first_name, 
	customers.last_name, 
	menu.item_name, 
	orders.quantity, 
	orders.order_date
	
	FROM orders
	JOIN customers
	ON orders.customer_id = customers.customer_id
	JOIN menu 
	ON orders.menu_id = menu.menu_id
	WHERE customers.customer_id = customer_id_input
	ORDER BY orders.order_date;
	
