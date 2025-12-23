-- Create Database
CREATE DATABASE DAY4;
-- Activate/Use Database
USE DAY4;

CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY AUTO_INCREMENT,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50),
    Department VARCHAR(50),
    Salary DECIMAL(10, 2)
);


INSERT INTO Employees 
VALUES
(EmployeeID,'Alice', 'Smith', 'HR', 60000),
(EmployeeID,'Bob', 'Johnson', 'IT', 80000),
(EmployeeID,'Charlie', 'Lee', 'Finance', 70000),
(EmployeeID,'David', 'Kim', 'HR', 50000),
(EmployeeID,'Eva', 'Williams', 'IT', 90000),
(EmployeeID,'Frank', 'Brown', 'Marketing', 65000),
(EmployeeID,'Grace', 'Davis', 'Finance', 72000),
(EmployeeID,'Helen', 'Taylor', 'Marketing', 75000);


/*
1.Single Row Subquery
Returns only one row and is used with operators like =, <, >, <=, >=, <>.
 Syntax:
SELECT column1
FROM table1
WHERE column2 = (SELECT column2 FROM table2 WHERE condition);
*/

-- Find employees who have the max salary 
SELECT FirstName, Salary
FROM Employees
WHERE Salary = (
    SELECT max(Salary) FROM Employees
);

/*
2. Multiple Row Subquery
Returns more than one row, and is used with operators like IN, ANY, ALL.

A. Using IN
Find employees who belong to departments same as employees with salary > 70000:

*/
SELECT FirstName, Department
FROM Employees
WHERE Department IN (
    SELECT Department
    FROM Employees     WHERE Salary > 70000 );

/* B. Using ANY
Find employees who earn less than any employee in the IT department:

*/
SELECT FirstName, Salary
FROM Employees
WHERE Salary < ANY (
    SELECT Salary
    FROM Employees
    WHERE Department = 'IT'
);
-- Compares each employee’s salary against each of the salaries in the IT department.

/*
C. Using ALL
Find employees who earn more than all employees in HR:
*/

SELECT FirstName, Salary
FROM Employees
WHERE Salary > ALL (
    SELECT Salary
    FROM Employees
    WHERE Department = 'HR'
);



/* Using ANY
Find employees who earn less than any employee in the IT department:*/

SELECT FirstName, Salary
FROM Employees
WHERE Salary < ANY (
    SELECT Salary
    FROM Employees
    WHERE Department = 'IT'
);


-- Compares each employee’s salary against each of the salaries in the IT department.

-- Using ALL
-- Find employees who earn more than all employees in HR:


SELECT FirstName, Salary
FROM Employees
WHERE Salary > ALL (
    SELECT Salary
    FROM Employees
    WHERE Department = 'HR'
);

CREATE TABLE  Customers (
    CustomerID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Email varchar(50)
);
select * from customers;

CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    OrderDate DATE,
	Foreign Key(CustomerID) References Customers(CustomerID)
);

select * from orders;


INSERT INTO Customers (CustomerID, FirstName, LastName, Email)
VALUES 
(1, 'Alice', 'Smith','alice@gmail.com'),
(2, 'Bob', 'Johnson', 'bob@gmail.com'),
(3, 'Charlie', 'Williams', 'charlie@gmail.com'),
(4, 'Diana', 'Brown', 'diana@gmail.com'),
(5, 'Evan', 'Jones', 'evan@gmail.com'),
(6, 'Fay', 'Garcia', 'fay@gmail.com'),
(7, 'George', 'Martinez', 'geaorge@gmail.com'),
(8, 'Hannah', 'Davis', 'hannah@gmail.com');

INSERT INTO Orders (OrderID, CustomerID, OrderDate)
VALUES 
(101, 1, '2024-01-10'),
(102, 1, '2024-03-15'),
(103, 2, '2024-01-20'),
(104, 3, '2024-02-25'),
(105, 3, '2024-04-05'),
(106, 4, '2024-01-30'),
(107, 4, '2024-02-10'),
(108, 5, '2024-03-01'),
(109, 6, '2024-01-05'),
(110, 6, '2024-04-10'),
(111, 1, '2024-05-01'),
(112, 2, '2024-03-20');

/*

LEAD() / LAG() on Orders: You'll see next and previous order dates when ordered by OrderDate.
*/
select customerid,orderdate
from orders
order by OrderDate;

SELECT CustomerID, OrderDate, 
 LEAD(OrderDate, 1) OVER (ORDER BY OrderDate) AS NextOrderDate
FROM Orders;



-- LAG : access data from previous row

select CustomerID,orderdate,
lag(orderdate,1) over ( order by orderdate) as previousdate
from orders;



-- FIRST_VALUE() / LAST_VALUE() with PARTITION BY CustomerID: Useful for customers with multiple orders (like CustomerID 1, 3, 4, 6).

SELECT CustomerID, OrderDate, 
 FIRST_VALUE(OrderDate) OVER (PARTITION BY CustomerID ORDER BY OrderDate) AS 
FirstOrderDate
FROM Orders;


SELECT CustomerID, OrderDate, 
 LAST_VALUE(OrderDate) OVER (PARTITION BY CustomerID ORDER BY OrderDate ) as lastorderdate
 FROM Orders;

-- NTILE(4) on Employees: Employees will be divided into quartiles based on Salary.

SELECT EmployeeID, 
 NTILE(4) OVER (ORDER BY Salary) AS Quartile
FROM Employees;


/* 
SYNTAX
select columnname,
fun(),over([partition by clause],
           [order by clause]);
		   */


-- DATE FUNCTIONS
-- -- Current date
SELECT NOW() AS Today;

-- Extract year/month/day
SELECT OrderID, YEAR(OrderDate) AS OrderYear, MONTH(OrderDate) AS OrderMonth, DAY(OrderDate) AS OrderDay
FROM Orders;


-- date difference in days
SELECT OrderID, DATEDIFF(NOW(), OrderDate) AS DaysAgo
FROM Orders;

-- date difference in months
SELECT OrderID, 
       TIMESTAMPDIFF(MONTH, OrderDate, NOW()) AS MonthsAgo
FROM Orders;


-- Add days/months


SELECT OrderID, DATE_ADD(OrderDate, INTERVAL 7 DAY) AS DeliveryDate
FROM Orders;


-- STRING FUNCTIONS

-- UPPER and LOWER
SELECT UPPER(FIRSTName) AS UpperName, LOWER(LastName) AS LowerName
FROM Employees;

-- Concatenation

select concat(FIRSTName," ",LASTNAME) as fullname from employees;

-- LENGTH

SELECT FIRSTName, length(FIRSTName) AS NameLength FROM EMPLOYEES;  

-- REPLACE

SELECT FIRSTNAME, REPLACE(FIRSTNAME, 'Alice', 'ALICIA') AS FixedName FROM EMPLOYEES;

-- Math Functions
CREATE TABLE Numbers (
    NumID INT,
    Value DECIMAL(10,2)
);

INSERT INTO Numbers VALUES
(1, 25.7),
(2, 12.4),
(3, -5.9),
(4, 0);

-- ABS: Absolute value
SELECT Value, ABS(Value) AS Absolute FROM Numbers;

-- ROUND, CEILING, FLOOR
SELECT Value,
       ROUND(Value, 0) AS Rounded,
       CEILING(Value) AS Ceil,
       FLOOR(Value) AS Floor
FROM Numbers;

-- POWER, SQRT
SELECT Value,
       POWER(Value, 2) AS Squared,
       SQRT(ABS(Value)) AS Sqrt
FROM Numbers;

-- Random number
SELECT RAND() * 100 AS RandomScore; -- Generates a random number between 0 and 100