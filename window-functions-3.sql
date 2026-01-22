create database studentssk;
use studentssk;
CREATE TABLE Students (
    student_name VARCHAR(100),
    subject VARCHAR(100),
    marks INT
);


INSERT INTO Students (student_name, subject, marks)
VALUES 
-- Marks for Alice
('Alice', 'Math', 85),
('Alice', 'Science', 88),
('Alice', 'English', 92),

-- Marks for Bob
('Bob', 'Math', 90),
('Bob', 'Science', 78),
('Bob', 'English', 85),

-- Marks for Charlie
('Charlie', 'Math', 85),
('Charlie', 'Science', 82),
('Charlie', 'English', 80),

-- Marks for David
('David', 'Math', 92),
('David', 'Science', 91),
('David', 'English', 89),

-- Marks for Eve
('Eve', 'Math', 90),
('Eve', 'Science', 85),
('Eve', 'English', 87),

-- Marks for Frank
('Frank', 'Math', 75),
('Frank', 'Science', 72),
('Frank', 'English', 78),

-- Marks for Grace
('Grace', 'Math', 85),
('Grace', 'Science', 89),
('Grace', 'English', 90);

-- Create window by subjects ranks 
select student_name,row_number() 
over () as rollno
from students
group by student_name;

-- ranking each student on basis of total marks
Select student_name , sum(marks),
rank() over (order by sum(marks) desc) as ranking from students
group by student_name;

select * from students;
-- first_value ,last_value ,nth_value

select * , 
last_value(student_name) over
(partition by subject order by marks desc 
ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) as piche_se_top
from students;

CREATE TABLE Sales (
    OrderID INT,
    OrderDate DATE,
    CustomerID INT,
    CustomerName VARCHAR(50),
    City VARCHAR(30),
    Product VARCHAR(50),
    Category VARCHAR(30),
    Quantity INT,
    Price DECIMAL(10,2)
);
INSERT INTO Sales VALUES
(1,'2025-01-01',101,'Rahul','Mumbai','Laptop','Electronics',1,60000),
(2,'2025-01-02',102,'Amit','Delhi','Mouse','Electronics',2,500),
(3,'2025-01-03',103,'Neha','Pune','Chair','Furniture',1,7000),
(4,'2025-01-04',101,'Rahul','Mumbai','Keyboard','Electronics',1,1500),
(5,'2025-01-05',104,'Priya','Delhi','Table','Furniture',1,12000),
(6,'2025-01-06',105,'Rohit','Pune','Bottle','Accessories',3,300),
(7,'2025-01-07',102,'Amit','Delhi','Monitor','Electronics',1,12000),
(8,'2025-01-08',103,'Neha','Pune','Bag','Accessories',1,2000),
(9,'2025-01-09',104,'Priya','Delhi','Laptop','Electronics',1,62000),
(10,'2025-01-10',105,'Rohit','Pune','Mouse','Electronics',2,500),

(11,'2025-01-11',101,'Rahul','Mumbai','Chair','Furniture',1,7000),
(12,'2025-01-12',102,'Amit','Delhi','Keyboard','Electronics',1,1500),
(13,'2025-01-13',103,'Neha','Pune','Table','Furniture',1,12000),
(14,'2025-01-14',104,'Priya','Delhi','Bottle','Accessories',4,300),
(15,'2025-01-15',105,'Rohit','Pune','Laptop','Electronics',1,61000),

(16,'2025-01-16',101,'Rahul','Mumbai','Monitor','Electronics',1,11500),
(17,'2025-01-17',102,'Amit','Delhi','Bag','Accessories',1,2200),
(18,'2025-01-18',103,'Neha','Pune','Mouse','Electronics',1,500),
(19,'2025-01-19',104,'Priya','Delhi','Chair','Furniture',1,7200),
(20,'2025-01-20',105,'Rohit','Pune','Keyboard','Electronics',1,1600),

(21,'2025-01-21',101,'Rahul','Mumbai','Table','Furniture',1,12500),
(22,'2025-01-22',102,'Amit','Delhi','Bottle','Accessories',2,300),
(23,'2025-01-23',103,'Neha','Pune','Laptop','Electronics',1,60500),
(24,'2025-01-24',104,'Priya','Delhi','Mouse','Electronics',2,500),
(25,'2025-01-25',105,'Rohit','Pune','Monitor','Electronics',1,11800),

(26,'2025-01-26',101,'Rahul','Mumbai','Bag','Accessories',1,2100),
(27,'2025-01-27',102,'Amit','Delhi','Chair','Furniture',1,7100),
(28,'2025-01-28',103,'Neha','Pune','Keyboard','Electronics',1,1550),
(29,'2025-01-29',104,'Priya','Delhi','Table','Furniture',1,12100),
(30,'2025-01-30',105,'Rohit','Pune','Bottle','Accessories',3,300),

(31,'2025-02-01',101,'Rahul','Mumbai','Laptop','Electronics',1,63000),
(32,'2025-02-02',102,'Amit','Delhi','Mouse','Electronics',2,500),
(33,'2025-02-03',103,'Neha','Pune','Chair','Furniture',1,7300),
(34,'2025-02-04',104,'Priya','Delhi','Keyboard','Electronics',1,1500),
(35,'2025-02-05',105,'Rohit','Pune','Table','Furniture',1,12300),

(36,'2025-02-06',101,'Rahul','Mumbai','Monitor','Electronics',1,11900),
(37,'2025-02-07',102,'Amit','Delhi','Bag','Accessories',1,2300),
(38,'2025-02-08',103,'Neha','Pune','Bottle','Accessories',2,300),
(39,'2025-02-09',104,'Priya','Delhi','Laptop','Electronics',1,64000),
(40,'2025-02-10',105,'Rohit','Pune','Mouse','Electronics',1,500),

(41,'2025-02-11',101,'Rahul','Mumbai','Chair','Furniture',1,7400),
(42,'2025-02-12',102,'Amit','Delhi','Keyboard','Electronics',1,1600),
(43,'2025-02-13',103,'Neha','Pune','Monitor','Electronics',1,12100),
(44,'2025-02-14',104,'Priya','Delhi','Bag','Accessories',1,2400),
(45,'2025-02-15',105,'Rohit','Pune','Laptop','Electronics',1,65000),

(46,'2025-02-16',101,'Rahul','Mumbai','Mouse','Electronics',1,500),
(47,'2025-02-17',102,'Amit','Delhi','Table','Furniture',1,12400),
(48,'2025-02-18',103,'Neha','Pune','Keyboard','Electronics',1,1650),
(49,'2025-02-19',104,'Priya','Delhi','Bottle','Accessories',3,300),
(50,'2025-02-20',105,'Rohit','Pune','Chair','Furniture',1,7500);

-- Running Total of Sales (per Customer)
select * , sum(quantity*price) over (partition by customerid
ORDER BY orderdate
           ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) as running_sales
from sales
order by customerid;

-- how does today’s order value compare with the customer’s previous order

select *,
lag(quantity*price) over (partition by customerid
order by orderdate)  as previous_order_date
from sales
order by orderdate,customerid;

select *,
lead(quantity*price) over (partition by customerid
order by orderdate)  as next_order_value
from sales
order by orderdate,customerid;

-- 
select *,
(quantity*price)-lag(quantity*price) over (partition by customerid
order by orderdate)  as change_from_prev
from sales
order by orderdate,customerid;

-- Find Highest Purchase of Each Customer
with cte as(
select *,rank() over(
partition by customerid ORDER BY Quantity*Price desc) as sale_rank
from sales)
select * from cte where sale_rank=1;


