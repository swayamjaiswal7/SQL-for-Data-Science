use company;
select * from employee;
select * from department;

select * from employee e
right join department d on 
e.departmentid = d.departmentid;

SELECT *
FROM employee
NATURAL JOIN department;

SELECT e.FirstName AS Employee,
       m.FirstName AS Manager
FROM employee e
LEFT JOIN employee m
ON e.ManagerID = m.EmployeeID;

SELECT e.FirstName, d.DepartmentName -- 5
FROM employee e -- 50 
CROSS JOIN department d;

-- full outer join
SELECT e.FirstName, d.DepartmentName
FROM employee e
LEFT JOIN department d ON e.DepartmentID = d.DepartmentID

UNION

SELECT e.FirstName, d.DepartmentName
FROM employee e
RIGHT JOIN department d ON e.DepartmentID = d.DepartmentID;

--  Q1. List all employees and their department names.
select e.firstname , d.DepartmentName
from employee e 
join department d on e.departmentid = d.departmentid;

-- Q2 Find employees who are not assigned to any department.
-- left join + null 

SELECT e.Firstname  , d.departmentname
from employee e 
left join department d on e.firstname = d.departmentid 
where d.departmentname is null;
select * from employee;
select * from department;
-- Show all departments even if no employee works there.
SELECT e.Firstname  , d.departmentname
from employee e 
right join department d 
on e.departmentid = d.departmentid ;

-- List departments that currently have no employees.
SELECT e.Firstname , d.departmentname
from employee e 
right join department d 
on e.departmentid = d.departmentid 
where e.firstname is null;

-- Display employee names along with their manager names.
-- self join 
-- Company Hierarchy
select * from employee;
select e1.Firstname as employee , m.Firstname as manager
from employee e1 
 join employee m
on e1.Employeeid = m.Managerid;

-- Find employees who do not have a manager (top-level employees)
SELECT FirstName
FROM employee
WHERE ManagerID IS NULL;

alter table employee add constraint
fk_departmentid foreign key (departmentid) references department(departmentid);

-- Show all possible employee–department combinations
select e.firstname , d.departmentname from employee e
cross join department d ;

-- Count number of employees in each department
SELECT d.DepartmentName,COUNT(e.EmployeeID) AS TotalEmployees
FROM department d
LEFT JOIN employee e
ON d.DepartmentID = e.DepartmentID
GROUP BY d.DepartmentName;

-- Find departments where average salary < 60000
select d.departmentname , round(avg(e.salary),2) as avg_salary
from employee e 
right join department d 
on d.departmentid = e.departmentid
group by d.departmentname
having avg_salary <>60000;

-- Find employees earning more than the average salary of their department.
select departmentid ,avg(salary) from employee group by departmentid;
SELECT e.FirstName, e.Salary, d.DepartmentName
FROM employee e
JOIN department d
ON e.DepartmentID = d.DepartmentID
JOIN (
    SELECT DepartmentID, AVG(Salary) AS AvgSal
    FROM employee
    GROUP BY DepartmentID
) x
ON e.DepartmentID = x.DepartmentID
WHERE e.Salary > x.AvgSal;

-- Find managers who have at least 2 people reporting to them.
SElECT m.FirstName , count(e.employeeid) as Empcount
from employee e 
join employee m 
on e.managerid = m.employeeid
group by m.Firstname 
having empcount > 2;

SELECT 
    m.FirstName,
    e.ManagerID,
    COUNT(e.EmployeeID) AS ReporteeCount
FROM employee e
JOIN employee m
    ON e.ManagerID = m.EmployeeID
WHERE e.ManagerID <> 0
GROUP BY e.ManagerID, m.FirstName
HAVING COUNT(e.EmployeeID) >= 2;