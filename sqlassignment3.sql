
--  1. Case Study: Customer Data Analysis --
select * from customerdata;
select * from customerdata order by age;
select * from customerdata order by Balance desc limit 10;
SELECT region, AVG(balance) AS average_balance
FROM customerdata
GROUP BY region
HAVING AVG(balance) > 60000;
SELECT job, SUM(balance) AS total_balance
FROM customerdata
GROUP BY job
ORDER BY total_balance DESC
LIMIT 3;
select Region,  sum(balance) as Region_balance
from customerdata
group by Region
order by Region_balance desc 
limit 5;
SELECT SUM(balance) AS total_balance
FROM customerdata
WHERE age BETWEEN 25 AND 35;

select name,Gender,Balance from customerdata where balance >50000 and gender like 'M%';

-- 2. Case Study: TechMart Data Creation--
create table products
(
product_Id int primary key auto_increment,
name varchar(255),
price float,
category varchar(255)

);
INSERT INTO products( product_Id, name, price, category)
VALUES
(101,'Wireless Mouse', 799.00, 'Accessories'),
(102, 'Bluetooth Headphones', 1499.00, 'Audio'),
(103, 'Smartphone Stand', 299.00, 'Accessories'),
(104, 'USB-C Charger', 999.00, 'Power'),
(105, 'Gaming Keyboard', 2499.00, 'Gaming');
select * from products;
create table customers
(
Id int primary key auto_increment,
name varchar(255),
email varchar(300),
phone varchar(400)
);
ALTER TABLE customers CHANGE COLUMN Id customer_Id  int;
INSERT INTO Customers (customer_id, name, email, phone)
VALUES
(301, 'Aarav Mehta', 'aarav.mehta@example.com', '9876543210'),
( 302,'Sneha Kapoor', 'sneha.kapoor@example.com', '9123456789'),
(303, 'Rohan Verma', 'rohan.verma@example.com', '9988776655');
select * from customers;
create table orders
(
Order_Id int primary key auto_increment,
customer_Id int,
product_Id int,
quantity int,
order_date date,
FOREIGN KEY (customer_id) REFERENCES Customers(customer_id),
FOREIGN KEY (product_id) REFERENCES Products(product_id)
);
INSERT INTO orders (order_Id, customer_Id, product_Id, quantity, order_date) VALUES
(401, 301, 101, 4, '2025-08-01'),
(402, 302, 102, 3, '2025-08-02'),
(403, 303, 103, 2, '2025-08-03'),
(404, 301, 104, 1, '2025-08-04'),
(405, 302, 105, 5, '2025-08-05'),
(406, 303, 102, 4, '2025-08-06'),
(407, 301, 103, 3, '2025-08-07'),
(408, 302, 104, 2, '2025-08-08'),
(409, 303, 101, 3, '2025-08-09'),
(410, 303, 105, 1, '2025-08-10');
select *from orders;

ALTER TABLE customerdata
CHANGE COLUMN `Customer ID` CustomerID INT;

SET SQL_SAFE_UPDATES = 0;

-- 3. Case Study: Data Analysis on Customer Database--
UPDATE customerdata
SET Job = 'Data Scientist'
WHERE CustomerID = 100000000;
SET SQL_SAFE_UPDATES = 1;

UPDATE customerdata
SET balance = balance * 1.10;
UPDATE customerdata
SET balance = 0
WHERE age < 30;

UPDATE customerdata
SET Region = 'Wales'
WHERE Name = 'Simon';
SELECT * FROM customerdata WHERE Name = 'Simon';

update customerdata
set Job ='Engineer'
where gender ='Male';
rollback;
commit;
update customerdata
set balance = Balance*2
where name like 'J%';

UPDATE customerdata
SET job = 'Manager'
WHERE balance = (
    SELECT max_balance
    FROM (
        SELECT MAX(balance) AS max_balance
        FROM customerdata
    ) AS copy_table
);
SELECT customerid, name, surname, job, balance
FROM customerdata
WHERE balance = (
    SELECT MAX(balance)
    FROM customerdata
);

update customerdata
set balance = 50000
where region = 'England';
SELECT * FROM customerdata
WHERE age > 50;

-- 4. Case Study: Customer Database Management--
 
 delete from customerdata where age > 50;
 delete from customerdata where CustomerID =100000000;
 delete from customerdata where Job ='Other';
delete FROM customerdata
WHERE Gender = 'Male' AND age > 40;

-- 5. Case Study: Analyzing Customer Data--

SELECT gender, COUNT(*) AS total_customers
FROM customerdata
GROUP BY gender;

 SELECT MAX(age) AS max_age, MIN(age) AS min_age
FROM customerdata;
SELECT region, COUNT(*) AS customer_count
FROM customerdata
GROUP BY region
ORDER BY customer_count DESC
LIMIT 1;
-- Oldest customer(s)
SELECT *
FROM customerdata
WHERE age = (SELECT MAX(age) FROM customerdata);

-- Youngest customer(s)
SELECT *
FROM customerdata
WHERE age = (SELECT MIN(age) FROM customerdata);

SELECT gender, SUM(balance) AS total_balance
FROM customerdata
GROUP BY gender
ORDER BY total_balance DESC;

SELECT job, AVG(balance) AS avg_balance
FROM customerdata
GROUP BY job
ORDER BY avg_balance DESC;

SELECT Job, COUNT(*) AS common_job
FROM customerdata
GROUP BY Job
ORDER BY common_job DESC
LIMIT 1;

select region ,sum(Balance) as SBalance
from customerdata
group by Region
order by sBalance DESC