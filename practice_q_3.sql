

select * from Customers

select * from Orders

select  * from Products

--1) Write an SQL query to find the names of customers who have placed an order.

select distinct CustomerName from Customers a inner join Orders b
on a.CustomerID=b.CustomerID


--2) Find the list of customers who have not placed any orders.
select distinct CustomerName from Customers c left join Orders o 
on 
c.CustomerID=o.CustomerID
where o.OrderID is null

--3) List all orders along with the product name and price.
select o.OrderID,p.ProductName,p.Price from Orders o inner join Products p 
on
o.ProductID=p.ProductID

--4) Find the names of customers and their orders, including customers who haven't placed any orders.
select distinct c.CustomerName,o.OrderID from Customers c left  join Orders o 
on 
c.CustomerID=o.CustomerID

--5) Retrieve a list of products that have never been ordered.
select distinct p.ProductID,p.ProductName from Products p left join Orders o 
on 
p.ProductID=o.ProductID
where o.OrderID is null

--6) Find the total number of orders placed by each customer.

select CustomerName,COUNT(OrderID) [Number of order] from Customers c  inner join Orders o on c.CustomerID=o.CustomerID
group by CustomerName

--
select CustomerName,COUNT(OrderID) [Number of order] from Customers c left join Orders o on c.CustomerID=o.CustomerID
group by CustomerName

--7) Display the customers, the products they've ordered, and the order date. Include customers who haven't placed any orders.
select distinct c.CustomerName,p.ProductID, p.ProductName, o.OrderDate from Customers c 
left join Orders o
on 
c.CustomerID=o.CustomerID
left join 
Products p
on 
o.ProductID=p.ProductID

