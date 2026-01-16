create database Sales_data;
use Sales_data;
CREATE TABLE orders (
OrderID INT PRIMARY KEY,
CustomerID INT,
EmployeeID INT,
OrderDate DATE,
ShipperID INT
);

CREATE TABLE products (
ProductID INT PRIMARY KEY,
ProductName VARCHAR(100),
SupplierID INT,
CategoryID INT,
Unit VARCHAR(50)
);

CREATE TABLE order_details (
OrderDetailID INT PRIMARY KEY,
OrderID INT,
ProductID INT,
Quantity INT,
FOREIGN KEY (OrderID) REFERENCES orders(OrderID),
FOREIGN KEY (ProductID) REFERENCES products(ProductID)
);

INSERT INTO orders VALUES
(10248, 90, 5, '1996-07-04', 3),
(10249, 81, 6, '1996-07-05', 1),
(10250, 34, 4, '1996-07-08', 2),
(10251, 84, 3, '1996-07-08', 1),
(10252, 76, 4, '1996-07-09', 2),
(10253, 34, 3, '1996-07-10', 2),
(10254, 14, 5, '1996-07-11', 2),
(10255, 68, 9, '1996-07-12', 3);

INSERT INTO products VALUES
(1, 'Chais', 1, 1, '10 boxes x 20 bags'),
(2, 'Chang', 1, 1, '24 bottles'),
(3, 'Aniseed Syrup', 1, 2, '12 bottles'),
(4, 'Chef Anton''s Cajun Seasoning', 2, 2, '48 jars'),
(5, 'Chef Anton''s Gumbo Mix', 2, 2, '36 boxes'),
(6, 'Grandma''s Boysenberry Spread', 3, 2, '12 jars'),
(7, 'Uncle Bob''s Organic Dried Pears', 3, 7, '12 boxes'),
(8, 'Northwoods Cranberry Sauce', 3, 2, '12 jars');

INSERT INTO order_details VALUES
(1, 10248, 11, 12),
(2, 10248, 42, 10),
(3, 10248, 72, 5),
(4, 10249, 14, 9),
(5, 10249, 51, 40),
(6, 10250, 41, 10),
(7, 10250, 51, 35),
(8, 10250, 65, 15);

INSERT INTO products (ProductID, ProductName, SupplierID, CategoryID, Unit) VALUES
(11,'Queso Cabrales',4,4,'1 kg pkg'),
(14,'Tofu',6,7,'40 - 100 g pkgs'),
(41,'Jack''s New England Clam Chowder',8,8,'12 - 12 oz cans'),
(42,'Singaporean Hokkien Fried Mee',9,5,'32 - 1 kg pkgs'),
(51,'Manjimup Dried Apples',12,7,'50 - 300 g pkgs'),
(65,'Louisiana Fiery Hot Pepper Sauce',2,2,'32 - 8 oz bottles'),
(72,'Mozzarella di Giovanni',14,4,'24 - 200 g pkgs');

INSERT INTO order_details (OrderDetailID, OrderID, ProductID, Quantity) VALUES
(1,10248,11,12),
(2,10248,42,10),
(3,10248,72,5),
(4,10249,14,9),
(5,10249,51,40),
(6,10250,41,10),
(7,10250,51,35),
(8,10250,65,15);

select * from orders;
select * from order_details;
select * from products;

-- 1. Find products that were never ordered
SELECT 
    *
FROM
    products p
WHERE
    p.ProductID NOT IN (SELECT 
            ProductID
        FROM
            order_details);


-- 2. Find customers who placed at least one order
SELECT DISTINCT
    customerid
FROM
    orders
WHERE
    customerid IN (SELECT 
            customerid
        FROM
            orders);

-- 3. Find orders that contain more than the average quantity
SELECT 
    *
FROM
    order_details
WHERE
    quantity > (SELECT 
            AVG(quantity)
        FROM
            order_details);

-- 4. Find products that were ordered more times than product 51;
SELECT 
    productid
FROM
    order_details
GROUP BY productid
HAVING SUM(quantity) > (SELECT 
        SUM(quantity)
    FROM
        order_details
    WHERE
        productid = 51);

-- 5 Find the highest quantity order

SELECT 
    orderid, quantity
FROM
    order_details
WHERE
    quantity = (SELECT 
            MAX(quantity)
        FROM
            order_details)
;

-- 6. Find customers who ordered more than average number of orders

-- a) Quantity Wise
SELECT 
    customerid
FROM
    orders
WHERE
    orderid IN (SELECT 
            orderid
        FROM
            order_details
        WHERE
            quantity > (SELECT 
                    AVG(quantity)
                FROM
                    order_details));
-- b) Order Count wise
SELECT 
    CustomerID
FROM
    orders
GROUP BY CustomerID
HAVING COUNT(*) > (SELECT 
        AVG(order_count)
    FROM
        (SELECT 
            COUNT(*) AS order_count
        FROM
            orders
        GROUP BY CustomerID) t); -- creating temporary table t for running the outer query

-- 7. Find products that appear in every order
SELECT 
    ProductID
FROM
    order_details
GROUP BY ProductID
HAVING COUNT(DISTINCT OrderID) = (SELECT 
        COUNT(*)
    FROM
        orders);

-- 8.find the latest order per customer
-- correlated subquery
SELECT 
    *
FROM
    orders o
WHERE
    OrderDate = (SELECT 
            MAX(o2.orderdate)
        FROM
            orders o2
        WHERE
            o2.customerid = o.customerid);

-- Q9. Find orders whose total quantity is above the average order

SELECT 
    orderid
FROM
    order_details
GROUP BY orderid
HAVING SUM(quantity) > (SELECT 
        AVG(total_qty)
    FROM
        (SELECT 
            SUM(quantity) AS total_qty
        FROM
            order_details
        GROUP BY orderid) t);
        
-- Q10. Find suppliers whose products were never ordered
/* Works even if order_details.ProductID has NULLs

Is faster on large tables

*/

SELECT DISTINCT
    p.SupplierID
FROM
    products p
WHERE
    NOT EXISTS( SELECT 
            1
        FROM
            order_details od
        WHERE
            od.ProductID = p.ProductID);

-- 11.Delete all the customers record who have never ordered.

Delete from orders where customerid in (SELECT 
    customerid
FROM
    products p
WHERE
    p.ProductID NOT IN (SELECT 
            ProductID
        FROM
            order_details ));