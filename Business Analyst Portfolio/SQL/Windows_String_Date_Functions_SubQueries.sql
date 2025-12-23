-- Create Database

-- Activate/Use Database


CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY IDENTITY(1,1),
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50),
    Department VARCHAR(50),
    Salary DECIMAL(10, 2)
);

INSERT INTO Employees (FirstName, LastName, Department, Salary)
VALUES
('Alice', 'Smith', 'HR', 60000),
('Bob', 'Johnson', 'IT', 80000),
('Charlie', 'Lee', 'Finance', 70000),
('David', 'Kim', 'HR', 50000),
('Eva', 'Williams', 'IT', 90000),
('Frank', 'Brown', 'Marketing', 65000),
('Grace', 'Davis', 'Finance', 72000),
('Helen', 'Taylor', 'Marketing', 75000);


/*
1.Single Row Subquery
Returns only one row and is used with operators like =, <, >, <=, >=, <>.
 Syntax:
SELECT column1
FROM table1
WHERE column2 = (SELECT column2 FROM table2 WHERE condition);
*/

-- Find employees who have the max salary 


/*
2. Multiple Row Subquery
Returns more than one row, and is used with operators like IN, ANY, ALL.

A. Using IN
Find employees who belong to departments same as employees with salary > 70000:

*/


/* B. Using ANY
Find employees who earn less than any employee in the IT department:

*/

-- Compares each employee’s salary against each of the salaries in the IT department.

/*
C. Using ALL
Find employees who earn more than all employees in HR:
*/





/* Using ANY
Find employees who earn less than any employee in the IT department:*/




-- Compares each employee’s salary against each of the salaries in the IT department.

-- Using ALL
-- Find employees who earn more than all employees in HR:




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

-- ADVANCED WINDOWS FUNCTIONS

/* 
SYNTAX
select columnname,
fun(),over([partition by clause],
           [order by clause]);
		   */

/*

LEAD() / LAG() on Orders: You'll see next and previous order dates when ordered by OrderDate.
*/



-- LAG : access data from previous row





-- FIRST_VALUE() / LAST_VALUE() with PARTITION BY CustomerID: Useful for customers with multiple orders (like CustomerID 1, 3, 4, 6).





-- NTILE(4) on Employees: Employees will be divided into quartiles based on Salary.







-- DATE FUNCTIONS
-- -- Current date


-- Extract year/month/day


-- Calculate days since order


-- Add days/months


-- STRING FUNCTIONS

-- UPPER and LOWER


-- Concatenation


-- LENGTH



-- REPLACE

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


-- ROUND, CEILING, FLOOR


-- POWER, SQRT


-- Random number
