/*
WITH cte_name AS (
    SELECT query
)
SELECT *
FROM cte_name;
*/

/* A CTE is a way to define a temporary result set within a SQL query.
 It allows you to create a named query that can be referenced 
multiple times in the main statement, making complex queries easier to read and manage.
*/
/* 
When to use Common Table Expressions
CTEs aren’t always the right choice, but they shine in certain situations where they improve readability, efficiency, and maintainability. Understanding when to use them ensures your queries remain structured, scalable, and easy to troubleshoot.

Simplifying complex queries
When a query involves multiple layers of subqueries or joins, CTEs help break it down into manageable parts. Instead of dealing with deeply nested logic that’s difficult to follow, a CTE allows you to separate key components into clear, logical sections. This makes debugging and modifying queries much easier, especially when working with large datasets or complex reporting needs.

Improving query readability and reusability
If the same subquery logic is used more than once within a query, a CTE allows you to write it once and reference it multiple times. This eliminates redundancy, reducing the chance of errors and making the query easier to maintain. Instead of copying and pasting the same subquery throughout different parts of the SQL statement, a CTE centralizes that logic, ensuring consistency across your query.

Handling recursive queries
Recursive CTEs provide a structured way to process hierarchical data, such as organizational charts, product categories, or family trees. Without CTEs, querying hierarchical relationships often requires cumbersome self-joins or complex procedural logic. 

A recursive CTE simplifies this by allowing a query to reference itself, iterating through parent-child relationships until the full hierarchy is retrieved. This is particularly useful for database designs that store data in tree-like structures.

Replacing temporary tables
Instead of creating and dropping temporary tables, CTEs allow for similar functionality without the extra management overhead. Temporary tables require explicit creation, take up storage space, and can introduce performance bottlenecks if not properly managed. 

CTEs, on the other hand, are evaluated only during query execution and disappear once the statement completes. This makes them an efficient alternative when working with temporary result sets that don’t need to persist beyond a single query run.

Enhancing performance in certain cases
When used correctly, CTEs can help the query optimizer produce a more efficient execution plan by avoiding redundant calculations. While not a guaranteed performance booster, CTEs can be particularly useful when filtering or aggregating large datasets before they are joined with other tables. By pre-processing data in a structured way, CTEs can reduce the computational workload, leading to faster query execution and better resource utilization.
*/

create database projects;
use projects;
CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    Name VARCHAR(100),
    Role VARCHAR(50),
    Department VARCHAR(50)
);

INSERT INTO Employees (EmployeeID, Name, Role, Department) VALUES
(1, 'Alice', 'Developer', 'IT'),
(2, 'Bob', 'Designer', 'Design'),
(3, 'Charlie', 'Manager', 'IT'),
(4, 'Daisy', 'Developer', 'IT'),
(5, 'Ethan', 'Designer', 'Design');

CREATE TABLE Projects (
    ProjectID INT PRIMARY KEY,
    ProjectName VARCHAR(100),
    LeadEmployeeID INT,
    StartDate DATE,
    EndDate DATE
);

INSERT INTO Projects (ProjectID, ProjectName, LeadEmployeeID, StartDate, EndDate) VALUES
(101, 'Website Redesign', 2, '2024-01-01', '2024-03-30'),
(102, 'New Product Launch', 3, '2024-02-15', '2024-05-30'),
(103, 'Data Migration', 1, '2024-01-20', '2024-04-20'),
(104, 'Mobile App Development', 4, '2024-04-01', '2024-08-30'),
(105, 'Cloud Infrastructure Setup', 3, '2024-03-20', '2024-07-20'),
(106, 'Brand Redesign', 2, '2024-05-15', '2024-09-15'),
(107, 'E-commerce Platform Upgrade', 1, '2024-06-01', '2024-10-31'),
(108, 'Data Analytics Implementation', 5, '2024-04-10', '2024-12-10');

select * from projects;
select * from employees;


-- Question 1: Which employees are leading projects?

with cte as (select distinct name from employees e
join projects p on p.leademployeeid = e.employeeid)
	
select * from cte;

-- Question 2: Find the departments with project leaders.
with cte as (select distinct e.name , e.department
from employees e join projects p 
on e.employeeid = p.leademployeeid) 
select * from cte;

-- 3: List all projects that have a longer duration than the average project duration.
WITH ProjectDurations AS (
    SELECT 
        projectname, 
        (enddate - startdate) AS duration -- Direct subtraction works for days
    FROM projects
)
SELECT projectname, duration
FROM ProjectDurations
WHERE duration > (SELECT AVG(duration) FROM ProjectDurations);

-- Question 4: Identify employees who are not involved in any projects.
WITH LeadEmployees AS (
    SELECT DISTINCT leademployeeid 
    FROM projects
)
SELECT e.employeeid, e.name
FROM employees e
LEFT JOIN LeadEmployees le ON e.employeeid = le.leademployeeid
WHERE le.leademployeeid IS NULL;

-- Question 5: What is the total number of projects led by each department?

with cte as (select p.projectname , e.department from projects p 
join employees e on p.leademployeeid = e.employeeid
)
select department,count(*) as projectcount from cte group by department;

-- Case study 2
-- Orders case study 
create database orders_study;
use orders_study;

CREATE TABLE Orders (		
order_id INT PRIMARY KEY,		
customer_id INT,		
restaurant_id INT,		
order_date DATE,		
amount DECIMAL(10,2),		
status VARCHAR(20) -- 'Completed', 'Cancelled'		
);		
		
INSERT INTO Orders VALUES		
(1, 101, 1, '2025-01-01', 500, 'Completed'),		
(2, 102, 1, '2025-01-01', 300, 'Completed'),		
(3, 101, 2, '2025-01-02', 700, 'Completed'),		
(4, 103, 1, '2025-01-02', 400, 'Completed'),		
(5, 102, 2, '2025-01-03', 600, 'Completed'),		
(6, 101, 1, '2025-01-04', 200, 'Completed'),		
(7, 104, 3, '2025-01-05', 1000, 'Completed'),		
(8, 101, 3, '2025-01-05', 450, 'Completed'),		
(9, 102, 1, '2025-01-06', 150, 'Cancelled');


-- Find customers who have placed more than 2 'Completed' orders AND 
-- whose average order value is higher than the overall average of all completed orders.
with cte as (
select customer_id ,count(status) as count_per_customer,status, round(avg(amount)) as avg_amount_per_customer
from orders 
group by customer_id,status)

select * from cte
where count_per_customer >=1 and status = 'Completed' and avg_amount_per_customer > 
(Select avg(amount) from orders);

select customer_id ,count(status) as count_per_customer,status, round(avg(amount)) as avg_amount_per_customer
from orders 
group by customer_id,status;
use orders_study;

-- Find customers who have only ever ordered from a single restaurant.
WITH CustomerRestaurantCounts AS (
    SELECT 
        customer_id, 
        COUNT(DISTINCT restaurant_id) as unique_rest_count
    FROM Orders
    GROUP BY customer_id
)
SELECT o.customer_id, MAX(o.restaurant_id) as loyal_restaurant_id
FROM Orders o
JOIN CustomerRestaurantCounts crc ON o.customer_id = crc.customer_id
WHERE crc.unique_rest_count = 1
GROUP BY o.customer_id;

-- Find days where the revenue was higher than the previous day's revenue.
WITH DailyRev AS (
    SELECT order_date, SUM(amount) as revenue
    FROM Orders
    WHERE status = 'Completed'
    GROUP BY order_date
)
SELECT curr.order_date, curr.revenue, prev.revenue as prev_day_revenue
FROM DailyRev curr
JOIN DailyRev prev ON curr.order_date = DATE_ADD(prev.order_date, INTERVAL 1 DAY)
WHERE curr.revenue > prev.revenue;

-- Find the percentage contribution of the top-spending customer to each restaurant's total revenue.
WITH RestaurantTotal AS (
    SELECT restaurant_id, SUM(amount) as total_rest_revenue
    FROM Orders
    WHERE status = 'Completed'
    GROUP BY restaurant_id
),
CustomerSpendPerRest AS (
    SELECT restaurant_id, customer_id, SUM(amount) as cust_total
    FROM Orders
    WHERE status = 'Completed'
    GROUP BY restaurant_id, customer_id
),
MaxCustSpend AS (
    SELECT restaurant_id, MAX(cust_total) as max_spend
    FROM CustomerSpendPerRest
    GROUP BY restaurant_id
)
SELECT 
    rt.restaurant_id, 
    (mcs.max_spend / rt.total_rest_revenue) * 100 as top_cust_contribution_pct
FROM RestaurantTotal rt
JOIN MaxCustSpend mcs ON rt.restaurant_id = mcs.restaurant_id;

-- Find customers who ordered in the first 3 days of Jan but have placed zero orders since then.
WITH EarlyBirds AS (
    SELECT DISTINCT customer_id
    FROM Orders
    WHERE order_date BETWEEN '2025-01-01' AND '2025-01-03'
),
RecentOrders AS (
    SELECT DISTINCT customer_id
    FROM Orders
    WHERE order_date > '2025-01-03'
)
SELECT eb.customer_id
FROM EarlyBirds eb
LEFT JOIN RecentOrders ro ON eb.customer_id = ro.customer_id
WHERE ro.customer_id IS NULL;