CREATE TABLE Department (
    DeptID INT PRIMARY KEY,
    DeptName VARCHAR(50)
);

INSERT INTO Department VALUES
(10, 'HR'),
(20, 'IT'),
(30, 'Finance'),
(40, 'Marketing');
CREATE TABLE Employee (
    EmpID INT PRIMARY KEY,
    EmpName VARCHAR(50),
    Salary INT,
    DeptID INT,
    ManagerID INT
);

INSERT INTO Employee VALUES
(101, 'John',   50000, 20, NULL),
(102, 'Alice',  60000, 20, 101),
(103, 'Bob',    45000, 10, 101),
(104, 'Carol',  70000, 30, NULL),
(105, 'David',  55000, 30, 104),
(106, 'Eve',    40000, 10, 103),
(107, 'Frank',  80000, 20, 101),
(108, 'Grace',  30000, NULL, NULL);
CREATE TABLE Customer (
    CustomerID INT PRIMARY KEY,
    CustomerName VARCHAR(50),
    City VARCHAR(50)
);

INSERT INTO Customer VALUES
(1, 'Ravi',   'Hyderabad'),
(2, 'Sneha',  'Bangalore'),
(3, 'Amit',   'Delhi'),
(4, 'Neha',   'Mumbai');
CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    OrderDate DATE,
    Amount INT
);

INSERT INTO Orders VALUES
(201, 1, '2024-01-10', 500),
(202, 1, '2024-02-15', 1500),
(203, 2, '2024-03-01', 700),
(204, 3, '2024-03-10', 1200);
