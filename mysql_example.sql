drop database pizzas_restaurant;

CREATE DATABASE IF NOT EXISTS pizzas_restaurant;

use pizzas_restaurant;

 
CREATE TABLE IF NOT EXISTS customers (
customer_id INT NOT NULL AUTO_INCREMENT,
customer_firstname VARCHAR(100) NOT NULL,
customer_lastname VARCHAR(100) NOT NULL,
customer_phone_number VARCHAR(15) NOT NULL,
PRIMARY KEY (customer_id));


CREATE TABLE IF NOT EXISTS `orders` (
order_id INT NOT NULL AUTO_INCREMENT,
order_datetime datetime,
pizza_qty INT,
amount decimal (6,2),
PRIMARY KEY (order_id));


CREATE TABLE IF NOT EXISTS `pizzas` (
pizza_id INT NOT NULL AUTO_INCREMENT,
pizza_name VARCHAR(100),
price decimal (6,2),
PRIMARY KEY (pizza_id));


insert into `orders` 
    (order_datetime, pizza_qty, amount)
    values 
    ('2014-10-09 09:47:00', 1, 7.99);

insert into `orders`
    (order_datetime, pizza_qty, amount)
    values 
    ('2014-10-09 09:47:00', 1, 14.99);

insert into `orders`
    (order_datetime, pizza_qty, amount)
    values
    ('2014-10-09 13:20:00', 1, 9.99);

insert into `orders`
    (order_datetime, pizza_qty, amount)
    values
    ('2014-10-09 13:20:00', 2, 29.99);

insert into `orders`
    (order_datetime, pizza_qty, amount)
    values
    ('2014-10-09 09:47:00', 1, 14.99);

insert into `orders`
    (order_datetime, pizza_qty, amount)
    values
    ('2014-10-09 09:47:00', 1, 12.99);


insert into customers
(customer_firstname, customer_lastname, customer_phone_number)
values
('Travor', 'Page', '226-555-4982');

insert into customers
(customer_firstname, customer_lastname, customer_phone_number)
values
('John', 'Doe', '555-555-94982');

INSERT into pizzas
(pizza_name, price)
values
('Pepperoni & Cheese', 7.99),
('Vegetarian', 9.99),
('Meat Lovers', 14.99),
('Hawaiian', 12.99);

CREATE TABLE IF NOT EXISTS pizzas_order(
order_id int NOT NULL,
pizza_id int NOT NULL,
PRIMARY KEY (order_id),
FOREIGN KEY (pizza_id) REFERENCES pizzas(pizza_id));

insert into pizzas_order
(order_id, pizza_id)
values
(1,1),
(3,2),
(2,3),
(4,3),
(5,3),
(6,4);

CREATE TABLE IF NOT EXISTS customers_order(
order_id int NOT NULL,
customer_id int NOT NULL,
PRIMARY KEY (order_id),
FOREIGN KEY (customer_id) REFERENCES customers(customer_id));

insert into customers_order
(order_id, customer_id)
values
(1,1),
(2,1),
(5,1),
(6,1),
(3,2),
(4,2);



select c.customer_id, c.customer_firstname, c.customer_lastname, c.customer_phone_number, sum(amount) sumamt  from `orders` o 
join `customers_order` co on o.order_id = co.order_id 
join `customers` c on co.customer_id = c.customer_id 
group by c.customer_id
ORDER BY sumamt DESC LIMIT 1;

select c.customer_id, c.customer_firstname, c.customer_lastname, c.customer_phone_number, o.order_datetime, sum(amount) sumamt  from `orders` o 
join `customers_order` co on o.order_id = co.order_id 
join `customers` c on co.customer_id = c.customer_id 
group by c.customer_id, o.order_datetime;
