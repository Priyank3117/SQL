--  You are working in a fictional Ecommerce company called MyCommerce. We want to setup a
-- new database and an order details table inside it. Please execute the following steps:


-- 1: Create a database called "mycommerce"
-- 2: Create a table inside it called "order_details", that has following fields
-- a: orderid - all our purchases have an order#, which is unique and numeric
-- b: customer_name
-- c: product_name -> text values
-- d: ordered_from -> where the customer place order from (store/app/website)
-- e: order_amount -> do not lose on decimals!!
-- f: order_date -> when the order was placed

-- g: delivery_date -> when the order was delivered
-- 3: Insert 50 records in the table. Use the attached notepad in the "Resources" section to save you time.
-- 4: Once all setup is done, run a query to return me product, number of orders, total sales, like below:

create database mycommerce

create table order_details
(
	order_id integer primary key,
	customer_name varchar(10) not null,
	product_name text ,
	ordered_from varchar(50) not null,
	order_amount numeric(6,3),
	order_date DATE not null,
	delivery_date DATE
);

insert into order_details
(order_id,customer_name,product_name,ordered_from,order_amount,order_date,delivery_date)
values (1,'bob','mouse','store',547.58,'2023-01-22','2023-01-29');

select * from order_details

-- For the "order_details" table created in previous coding exercise, make
-- the following changes:

-- a: Change name of column "customer_name" to "customer_first_name"
alter table order_details rename column customer_name to customer_first_name;

-- b: Add a new column for “cancel_date"
alter table order_details add column cancle_date DATE;