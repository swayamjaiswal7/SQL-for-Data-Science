create database salesdb;
use salesdb;

-- top 5 product
SELECT 
    t2.name,
    ROUND(SUM(t2.price * t1.quantity)) AS rev,
    SUM(t1.quantity) AS quant
FROM
    sales1 t1
        JOIN
    products t2 ON t1.productid = t2.productid
GROUP BY t2.name
ORDER BY quant DESC
LIMIT 5;

-- sales man with highest quantity

SELECT 
    p.salespersonid, e.Firstname, SUM(p.quantity) AS soldquant
FROM
    employees e
        JOIN
    sales1 p ON e.employeeid = p.salespersonid
GROUP BY p.salespersonid , e.Firstname
ORDER BY soldquant DESC
LIMIT 5;

-- reach  Sales man name who has most no of unique customer.
SELECT 
    t1.salespersonid,
    t2.Firstname,
    COUNT(DISTINCT t1.customerid) AS reach
FROM
    sales1 t1
        JOIN
    employees t2 ON t1.salespersonid = t2.employeeid
GROUP BY t1.salespersonid , t2.Firstname
ORDER BY reach DESC
LIMIT 5;

-- most revenue
SELECT 
    t1.salespersonid,
    t3.Firstname,
    ROUND(SUM(t1.quantity * t2.price)) AS revenue
FROM
    sales1 t1
        JOIN
    products t2 ON t1.productid = t2.productid
        JOIN
    employees t3 ON t1.salespersonid = t3.employeeid
GROUP BY t1.salespersonid , t3.Firstname
ORDER BY revenue DESC
LIMIT 10;

-- Customers with more than 10 purchases
SELECT 
    t1.customerid,
    t1.Firstname,
    t1.lastname,
    COUNT(*) AS purchases
FROM
    customers t1
        JOIN
    sales1 t2 ON t1.customerid = t2.customerid
GROUP BY t1.customerid , t1.Firstname , t1.lastname
HAVING purchases > 10
ORDER BY purchases DESC;

-- salesperson made sales to more than 5 customers
SELECT 
    t1.salespersonid,
    t2.Firstname,
    COUNT(DISTINCT t1.customerid) AS reach
FROM
    sales1 t1
        JOIN
    employees t2 ON t1.salespersonid = t2.employeeid
GROUP BY t1.salespersonid , t2.Firstname
HAVING reach >= 5
ORDER BY reach DESC
LIMIT 5;

-- pair of customers who have made purchases with same salesperson
SELECT 
    CONCAT(b.firstname, ' ', b.lastname) AS fc_name,
    CONCAT(c.firstname, ' ', c.lastname) AS sc_name
FROM
    (SELECT DISTINCT
        t1.customerid AS cust1,
            t2.customerid AS cust2,
            t1.salespersonid
    FROM
        sales1 t1
    JOIN sales1 t2 ON (t1.salespersonid = t2.salespersonid
        AND t1.customerid != t2.customerid)) a
        JOIN
    customers b ON b.customerid = a.cust1
        LEFT JOIN
    customers c ON c.customerid = a.cust2
        LEFT JOIN
    employees d ON a.salespersonid = d.employeeid
;