CREATE DATABASE SQLPRACTICE;

USE SQLPRACTICE;

CREATE TABLE Employees(
    emp_id INT PRIMARY KEY,
    name VARCHAR(100),
    department VARCHAR(50),
    salary INT,
    age INT,
    city VARCHAR(50),
    hire_date DATE
);

INSERT INTO Employees (emp_id, name, department, salary, age, city, hire_date) VALUES
(101, 'Arjun Mehta', 'IT', 75000, 28, 'Hyderabad', '2021-03-15'),
(102, 'Sneha Rao', 'HR', 55000, 32, 'Bangalore', '2019-07-10'),
(103, 'Rahul Jain', 'Finance', 82000, 38, 'Mumbai', '2018-11-21'),
(104, 'Meera Gupta', 'Sales', 46000, 26, 'Delhi', '2020-02-05'),
(105, 'Sanjay Rana', 'IT', 65000, 35, 'Pune', '2022-06-12'),
(106, 'Ananya Das', 'Marketing', 40000, 29, 'Kolkata', '2023-01-18'),
(107, 'Vikram Reddy', 'HR', 52000, 41, 'Hyderabad', '2017-09-25'),
(108, 'Kavya Nair', 'Sales', 48000, 30, 'Chennai', '2021-10-30'),
(109, 'Aman Singh', 'IT', 91000, 34, 'Bangalore', '2016-05-09'),
(110, 'Priya Verma', 'Finance', 70000, 27, 'Jaipur', '2022-08-03'),
(111, 'Tarun Arora', 'Marketing', 39000, 24, 'Delhi', '2020-12-19'),
(112, 'Rani Sharma', 'HR', 61000, 36, 'Pune', '2018-04-14'),
(113, 'Dhanush Roy', 'IT', 57000, 33, 'Chennai', '2021-05-22'),
(114, 'Alisha Khan', 'Sales', 45000, 25, 'Hyderabad', '2023-03-09'),
(115, 'Nikhil Rao', 'Finance', 88000, 40, 'Bangalore', '2017-01-05');


select * from Employees;

--COMPARISION OPERATORS--

/*Retrieve all employees whose salary is greater than 50,000.*/

select name,salary from Employees
where salary > 50000;

/*Find employees whose age is less than 30.*/

select name,age 
from Employees
where age < 30;

/*Show employees whose city is not 'Hyderabad'.*/

select name,city
from Employees
where city != 'Hyderabad';

/*List employees who were hired after 2020-01-01.*/

select name,hire_date 
from Employees
where hire_date > '2020-01-01';

/*Show employees whose salary equals 75,000.*/

select name, salary
from Employees
where salary = 75000;

--LOGICAL OPERATORS--

select * from Employees;

/*Retrieve employees who work in the 'IT' department AND have salary > 60,000.*/

select emp_id,name,department,salary
from Employees
where department = 'IT' AND salary > 60000;

/*Find employees who live in 'Delhi' OR 'Mumbai'.*/

select emp_id,city
from Employees
where city = 'Delhi' OR city ='Mumbai';

/*Show employees who do NOT belong to the 'HR' department.*/

select emp_id,name,department
from Employees
where NOT department = 'HR';

/*Retrieve employees who age > 30 AND salary < 40,000.*/

select emp_id,age,salary 
from Employees
where age > 30 AND salary < 40000;

/*Show employees who city = 'Chennai' OR department = 'Finance'.*/

select emp_id,city,department
from Employees
where city = 'Chennai' OR department = 'Finance';

--RANGE OPERATOR--

select * from Employees;

/*Retrieve employees whose salary is between 40,000 and 80,000.*/

select emp_id,salary
from Employees
where salary BETWEEN 40000 AND 80000;

/*Show employees whose age is between 25 and 35*/

select emp_id,age
from Employees
where age BETWEEN 25 AND 35;

/*Find employees hired between '2018-01-01' and '2021-12-31'.*/

select emp_id,hire_date 
from Employees
where hire_date BETWEEN '2018-01-01' AND '2021-12-31';

--MEMBERSHIP OPERATOR--

/*Retrieve employees whose department is IN ('IT', 'Finance', 'Sales').*/

select emp_id,department
from Employees
where department IN ('IT','Finance','Sales');

/*Find employees whose city is NOT IN ('Hyderabad', 'Bangalore').*/

select emp_id,city
from Employees
where city NOT IN ('Hyderabad','Bangalore'); 

/*List employees whose emp_id is IN (101, 104, 110).*/

select emp_id,name 
from Employees
where emp_id IN(101,104,110);

--SEARCH OPERATOR--

/*Show employees whose name starts with 'A'.*/

select emp_id,name
from Employees
where name LIKE 'A%';

/*Show employees whose name contains 'an'.*/

select emp_id,name
from Employees
where name LIKE '%an%';

/*Retrieve employees whose city ends with 'pur'.*/

select emp_id,name,city
from Employees
where city LIKE '%pur';

/*Get employees whose department name is 3 characters long.*/

select emp_id,department
from Employees
where department LIKE '___';


--COMBINED OPERATORS--

select * from Employees;

/*Retrieve employees in the IT department whose salary is between 60,000 and 90,000, and name starts with 'S'.*/

select emp_id,name,department,salary
from Employees
where department = 'IT' AND (salary BETWEEN 60000 AND 90000) AND 
      name LIKE 'S%';

/*Find all employees not in HR, age greater than 35, and living in Bangalore or Pune.*/

select emp_id,department,age,city
from Employees
where department != 'HR' AND age > 35 AND (city = 'Bangalore' OR city= 'Pune'); 

/*Show employees hired after 2019, whose name contains 'ra', and salary < 70,000.*/

select emp_id, hire_date as year ,name,salary
from Employees
where hire_date > '2019' AND name LIKE '%ra%' AND salary < 70000;

/*List employees whose department is Finance, city is not Mumbai, and salary > 50,000.*/

select emp_id,department,city,salary
from Employees
where department = 'Finance' AND NOT city = 'Mumbai' AND salary > 50000;

/*Find employees whose name ends with 'a' and emp_id is in (101, 102, 103, 110).*/

select emp_id,name 
from Employees
where name LIKE '%a' AND emp_id IN(101,102,103,110);