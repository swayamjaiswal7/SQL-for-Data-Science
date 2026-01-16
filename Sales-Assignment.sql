CREATE TABLE sales_data(
SaleID INT PRIMARY KEY,
ProductName VARCHAR(100),
Quantity INT,
SaleDate DATE,
SaleAmount DECIMAL(10,2),
CustomerName VARCHAR(100),
Region VARCHAR(50),
SalesRepID INT
);

INSERT INTO sales_data(SaleID, ProductName, Quantity, SaleDate, SaleAmount, CustomerName, Region, SalesRepID) VALUES
(1, 'Headphones' ,1, '2023-01-31' ,511.01, 'Jane Smith' , 'East' ,100),
(2, 'Monitor' ,3, '2023-03-18' ,213.63, 'Chris Green' , 'South' ,103),
(3, 'Smartwatch' ,4, '2023-04-01' ,1053.33, 'Sarah Davis' , 'East' ,102),
(4, 'Headphones' ,3, '2023-06-26' ,562.81, 'John Doe' , 'West' ,100),
(5, 'Keyboard' ,2, '2023-03-28' ,975.23, 'Nancy White' , 'South' ,101),
(6, 'Headphones' ,3, '2023-05-16' ,568.35, 'Sarah Davis' , 'West' ,100),
(7, 'Laptop' ,5, '2023-02-05' ,809.01, 'Jane Smith' , 'East' ,103),
(8, 'Laptop' ,3, '2023-01-30' ,363.02, 'Sarah Davis' , 'North' ,103),
(9, 'Laptop' ,1, '2023-05-05' ,576.43, 'Mike Brown' , 'South' ,103),
(10, 'Printer' ,5, '2023-04-17' ,848.35, 'Jane Smith' , 'North' ,101),
(11, 'Headphones' ,2, '2023-05-19' ,643.92, 'Sarah Davis' , 'East' ,102),
(12, 'Smartphone' ,5, '2023-04-04' ,1324.53, 'Steve Grey' , 'West' ,102),
(13, 'Monitor' ,2, '2023-06-02' ,380.15, 'Steve Grey' , 'West' ,104),
(14, 'Mouse' ,5, '2023-03-13' ,361.72, 'Steve Grey' , 'East' ,102),
(15, 'Mouse' ,2, '2023-04-07' ,574.13, 'Jane Smith' , 'South' ,101),
(16, 'Headphones' ,2, '2023-03-19' ,775.6, 'Jane Smith' , 'North' ,103),
(17, 'Printer' ,2, '2023-04-07' ,588.87, 'Mike Brown' , 'South' ,104),
(18, 'Monitor' ,4, '2023-02-01' ,122.41, 'Derek Lee' , 'South' ,102),
(19, 'Webcam' ,5, '2023-02-23' ,1065.98, 'Sarah Davis' , 'South' ,103),
(20, 'Smartphone' ,2, '2023-03-27' ,881.94, 'Alice Johnson' , 'East' ,104),
(21, 'Monitor' ,5, '2023-01-13' ,1451.85, 'Jane Smith' , 'East' ,102),
(22, 'Monitor' ,2, '2023-05-02' ,1084.47, 'Alice Johnson' , 'West' ,104),
(23, 'Webcam' ,1, '2023-03-19' ,1152.83, 'Mike Brown' , 'North' ,102),
(24, 'Monitor' ,1, '2023-06-13' ,1461.96, 'Derek Lee' , 'West' ,102),
(25, 'Mouse' ,5, '2023-02-02' ,1412.72, 'Chris Green' , 'East' ,100),
(26, 'Tablet' ,2, '2023-05-21' ,183.92, 'Steve Grey' , 'North' ,101),
(27, 'Keyboard' ,4, '2023-04-05' ,934.09, 'Alice Johnson' , 'North' ,105),
(28, 'Monitor' ,1, '2023-05-19' ,1003.39, 'Nancy White' , 'North' ,105),
(29, 'Monitor' ,1, '2023-03-14' ,1309.35, 'Sarah Davis' , 'West' ,103),
(30, 'Printer' ,4, '2023-06-08' ,310.9, 'Chris Green' , 'North' ,102),
(31, 'Printer' ,3, '2023-02-01' ,517.56, 'Jane Smith' , 'West' ,103),
(32, 'Smartwatch' ,4, '2023-06-25' ,1065.82, 'Nancy White' , 'North' ,102),
(33, 'Smartphone' ,2, '2023-02-26' ,1111.72, 'Jane Smith' , 'South' ,101),
(34, 'Printer' ,2, '2023-05-16' ,989.17, 'Sarah Davis' , 'North' ,102),
(35, 'Keyboard' ,1, '2023-03-14' ,1108.22, 'Nancy White' , 'West' ,104),
(36, 'Keyboard' ,4, '2023-04-23' ,177.88, 'Nancy White' , 'East' ,100),
(37, 'Tablet' ,4, '2023-01-11' ,687.28, 'Steve Grey' , 'East' ,104),
(38, 'Laptop' ,3, '2023-03-21' ,673.68, 'Mike Brown' , 'East' ,100),
(39, 'Webcam' ,5, '2023-05-27' ,127.85, 'John Doe' , 'South' ,102),
(40, 'Headphones' ,4, '2023-01-03' ,801.67, 'Mike Brown' , 'East' ,101),
(41, 'Printer' ,4, '2023-04-14' ,1434.24, 'Sarah Davis' , 'West' ,104),
(42, 'Headphones' ,3, '2023-06-12' ,739.78, 'Jane Smith' , 'South' ,100),
(43, 'Headphones' ,4, '2023-04-12' ,1018.95, 'John Doe' , 'North' ,101),
(44, 'Keyboard' ,2, '2023-01-09' ,663.05, 'Nancy White' , 'West' ,102),
(45, 'Keyboard' ,1, '2023-02-28' ,1342.7, 'Chris Green' , 'East' ,100),
(46, 'Monitor' ,2, '2023-03-30' ,1233.82, 'Steve Grey' , 'East' ,104),
(47, 'Mouse' ,3, '2023-05-25' ,1135.88, 'Karen Black' , 'South' ,102),
(48, 'Printer' ,1, '2023-05-12' ,936.17, 'Nancy White' , 'North' ,101),
(49, 'Headphones' ,4, '2023-06-03' ,1102.29, 'Sarah Davis' , 'East' ,104),
(50, 'Keyboard' ,2, '2023-06-22' ,1233.45, 'Karen Black' , 'West' ,100),
(51, 'Tablet' ,5, '2023-02-15' ,1182.02, 'Nancy White' , 'North' ,103),
(52, 'Mouse' ,2, '2023-03-17' ,482.39, 'Derek Lee' , 'South' ,100),
(53, 'Keyboard' ,5, '2023-03-28' ,615.54, 'John Doe' , 'North' ,100),
(54, 'Mouse' ,2, '2023-05-06' ,318.25, 'Alice Johnson' , 'West' ,102),
(55, 'Smartphone' ,3, '2023-04-05' ,924.67, 'Mike Brown' , 'North' ,104),
(56, 'Mouse' ,1, '2023-01-05' ,759.96, 'Chris Green' , 'South' ,105),
(57, 'Laptop' ,5, '2023-01-04' ,572.38, 'Sarah Davis' , 'East' ,105),
(58, 'Tablet' ,2, '2023-01-27' ,114.03, 'Sarah Davis' , 'South' ,105),
(59, 'Monitor' ,4, '2023-06-25' ,232.23, 'Derek Lee' , 'South' ,104),
(60, 'Printer' ,5, '2023-04-06' ,1422.23, 'Mike Brown' , 'South' ,105),
(61, 'Keyboard' ,1, '2023-05-26' ,716.65, 'Alice Johnson' , 'East' ,104),
(62, 'Smartwatch' ,4, '2023-02-16' ,276.21, 'Steve Grey' , NULL ,104),
(63, 'Webcam' ,5, '2023-01-05' ,111.63, 'Alice Johnson' , 'South' ,102),
(64, 'Webcam' ,3, '2023-01-18' ,903.09, 'Derek Lee' , 'North' ,100),
(65, 'Monitor' ,1, '2023-05-23' ,554.82, 'Chris Green' , 'East' ,101),
(66, 'Smartphone' ,5, '2023-06-13' ,1498.23, 'Derek Lee' , 'South' ,102),
(67, 'Webcam' ,3, '2023-04-16' ,1424.93, 'Chris Green' , 'North' ,105),
(68, 'Headphones' ,1, '2023-01-27' ,945.31, 'Jane Smith' , 'South' ,103),
(69, 'Smartwatch' ,4, '2023-01-15' ,404.17, 'Chris Green' , 'North' ,101),
(70, 'Printer' ,5, '2023-03-29' ,208.89, 'Karen Black' , 'North' ,105),
(71, 'Monitor' ,3, '2023-03-09' ,218.5, 'Alice Johnson' , 'West' ,101),
(72, 'Smartphone' ,2, '2023-04-15' ,743.14, 'Nancy White' , 'South' ,105),
(73, 'Webcam' ,1, '2023-01-27' ,646.85, 'Mike Brown' , 'North' ,102),
(74, 'Laptop' ,4, '2023-06-20' ,560.35, 'Mike Brown' , 'South' ,101),
(75, 'Webcam' ,2, '2023-02-12' ,1490.84, 'Sarah Davis' , 'South' ,104),
(76, 'Smartwatch' ,5, '2023-06-08' ,341.23, 'Jane Smith' , 'North' ,100),
(77, 'Webcam' ,3, '2023-06-30' ,871.52, 'Sarah Davis' , 'North' ,100),
(78, 'Tablet' ,4, '2023-02-27' ,424.62, 'Derek Lee' , 'West' ,102),
(79, 'Tablet' ,3, '2023-06-10' ,1041.56, 'Sarah Davis' , 'West' ,104),
(80, 'Mouse' ,3, '2023-05-23' ,1215.27, 'Derek Lee' , 'North' ,101),
(81, 'Webcam' ,1, '2023-04-03' ,236.69, 'Alice Johnson' , 'South' ,105),
(82, 'Webcam' ,2, '2023-03-09' ,784.72, 'Mike Brown' , 'East' ,103),
(83, 'Monitor' ,2, '2023-06-16' ,667.09, 'Derek Lee' , 'South' ,104),
(84, 'Webcam' ,5, '2023-05-23' ,776.92, 'Jane Smith' , 'North' ,101),
(85, 'Mouse' ,2, '2023-02-24' ,534.45, 'Sarah Davis' , 'North' ,100),
(86, 'Monitor' ,5, '2023-01-16' ,1370.17, 'John Doe' , 'North' ,102),
(87, 'Printer' ,2, '2023-03-31' ,1077.39, 'Jane Smith' , NULL ,104),
(88, 'Tablet' ,3, '2023-04-20' ,199.07, 'John Doe' , 'North' ,104),
(89, 'Headphones' ,4, '2023-05-14' ,826.98, 'John Doe' , 'South' ,102),
(90, 'Smartwatch' ,2, '2023-01-05' ,323.71, 'John Doe' , 'West' ,NULL),
(91, 'Smartphone' ,4, '2023-06-29' ,319.41, 'Chris Green' , 'West' ,104),
(92, 'Tablet' ,4, '2023-05-31' ,735.86, 'Karen Black' , 'South' ,102),
(93, 'Smartwatch' ,3, '2023-01-13' ,640.38, 'Steve Grey' , 'East' ,101),
(94, 'Monitor' ,1, '2023-01-31' ,932.91, 'Nancy White' , 'West' ,NULL),
(95, 'Webcam' ,2, '2023-06-22' ,524.98, 'Sarah Davis' , 'North' ,103),
(96, 'Headphones' ,1, '2023-03-24' ,641.16, 'Jane Smith' , 'North' ,103),
(97, 'Webcam' ,5, '2023-01-15' ,1307.82, 'John Doe' , 'West' ,104),
(98, 'Tablet' ,3, '2023-03-01' ,864.7, 'Jane Smith' , NULL ,104),
(99, 'Headphones' ,3, '2023-06-30' ,477.66, 'Jane Smith' , NULL ,102),
(100, 'Webcam' ,5, '2023-04-21' ,1158.19, 'Jane Smith' , 'East' ,102);

-- 1: Retrieve all records where the product sold is 'Laptop'.
select * from sales_data where ProductName = 'Laptop';

-- 2: Select sales records that occurred between January 15, 2023, and February 15, 2023.
SELECT * FROM sales_data WHERE SaleDate BETWEEN '2023-01-15' AND '2023-02-15';

-- 3: Find all sales over $1000 in the 'North' region.
SELECT * FROM sales_data WHERE SaleAmount > 1000 AND Region = 'North';

-- 4: Get records where the quantity sold is less than 3, excluding sales in the 'East' region.
SELECT * FROM sales_data WHERE Quantity < 3 AND Region <> 'East';
select * from sales_data where quantity< 3 and not region = 'East';
select * from sales_data where quantity<3 and region!='east';
select* from sales_data where Quantity<3 and Region not in ('east');

-- 5: Find records of sales where the product is either 'Laptop' or 'Tablet' and the sale amount is greater than $500
SELECT * FROM sales_data WHERE ProductName IN ('Laptop', 'Tablet') AND SaleAmount > 500;

select * from sales_data where (productname = 'Laptop' or productname = 'Tablet') and saleamount > 500;

-- 6:  Select sales that are not for 'Headphones' or 'Smartwatch' and occurred outside the 'South' region.
select * from sales_data where not(productname = 'Headphones' or productname = 'Smartwatch') and region not in ('South');

select * from sales_data where ProductName not in ('Smartwatch','Headphones') and Region != 'South';

select * from sales_data where (productname!='Headphones' or productname!="Smartwatch")and region!="south";

-- 7: Find sales made to customers whose names start with 'J' and contain the letter 'e'.
select * from sales_data where customername like 'J%e%';
SELECT * FROM sales_data WHERE CustomerName LIKE 'J%' AND CustomerName LIKE '%e%';

-- 8: Retrieve records where the quantity sold is between 2 and 4 inclusive, made by Sales Representatives with IDs 101, 102, or 103.
select * from sales_data where quantity between 2 and 4 and SalesRepID in ('101','102',103);
SELECT * FROM sales_data WHERE Quantity >=2 AND Quantity <=4  AND SalesRepID IN (101,102,103);

-- 9: Find products whose total sales amount exceeds $10,000.
select productname, sum(saleamount) 
from sales_data 
group by productname
having sum(saleamount) >10000;

-- 10: Determine the average sale amount for 'Laptop' and 'Tablet' in each region, 
-- including only regions with an average above $800, treating NULL regions as 'Unspecified'.

SELECT COALESCE(Region, 'Unspecified'), AVG(SaleAmount) AS AvgSales
FROM sales_data
WHERE ProductName IN ('Laptop', 'Tablet')
GROUP BY Region
HAVING AVG(SaleAmount) > 800
;

-- 11:  Identify sales representatives who have sold a total quantity of more than 50 units across all products
select SalesRepId ,sum(Quantity) as total
from sales_data 
group by SalesRepID
having Total>50;

-- 12: For each region, find the highest sale amount, considering only sales above $500.
select region , max(SaleAmount) as highest
from sales_data
group by region
having highest>500;

-- 13: Identify the top 5 best-selling products by total quantity sold.
select productname, sum(quantity) as total_quantity 
from sales_data 
group by productname 
order by total_quantity desc 
limit 5;

-- 14: Retrieve the details of the 10 most recent sales where the sale amount was greater than $1000, ordered by the sale date.
select * from sales_data where SaleAmount>1000 order by SaleDate desc limit 10;

-- 15: Create a single string combining product and customer names, with the product name in upper case and the customer name in lower case.
SELECT ProductName, CustomerName, CONCAT(UPPER(ProductName), '-', LOWER(CustomerName)) AS Customer_with_Product_Purchased 
FROM sales_data;

-- 16:  Find records where the first character of the ProductName is the same as the last character of the CustomerName.
SELECT * FROM sales_data
WHERE LEFT(ProductName, 1) = RIGHT(CustomerName, 1);

-- 17: Display customer names with spaces replaced by dashes, and order by these modified names.
select replace(customername,' ','-') as modified_name from sales_data order by modified_name;

-- 18:  Select records where the length of the ProductName is greater than the length of the CustomerName.
SELECT * FROM sales_data WHERE LENGTH(ProductName) > LENGTH(CustomerName);

-- 19: For any NULL values in the Region column, replace them with 'Unknown'.
SELECT Region, IFNULL(Region, 'Unknown') FROM sales_data;

-- 20:  Find all sales records where the SalesRepID is NULL.
SELECT *
FROM sales_data
WHERE SalesRepID IS NULL;

-- 21: Update the SalesRepID to '999' for all records where the SalesRepID is NULL
UPDATE sales_data
SET SalesRepID = '999'
WHERE SalesRepID IS NULL;

-- 22: Add a new column named DiscountPercent to the sales_data table. And make the DiscountPercent column to have a default value of '5.00'.
ALTER TABLE sales_data
ADD COLUMN DiscountPercent DECIMAL(5, 2) DEFAULT 5.00;

-- 23: Rename the CustomerName column to ClientName.
ALTER TABLE sales_data
CHANGE COLUMN CustomerName ClientName VARCHAR(100);

-- DROP COLUMN DiscountPercent;










