USE SQLPRACTICE;

CREATE TABLE Staff (
    emp_id INT PRIMARY KEY,
    name VARCHAR(50),
    age INT,
    department VARCHAR(30),
    salary INT,
    city VARCHAR(30),
    hire_date DATE
);

INSERT INTO Staff (emp_id, name, age, department, salary, city, hire_date) VALUES
(201, 'Arjun Mehta', 28, 'IT', 55000, 'Hyderabad', '2020-03-15'),
(202, 'Sneha Reddy', 32, 'HR', 48000, 'Bangalore', '2019-07-10'),
(203, 'Rahul Singh', 45, 'Finance', 75000, 'Mumbai', '2015-05-22'),
(204, 'Meera Gupta', 29, 'Sales', 62000, 'Delhi', '2021-01-05'),
(205, 'Vikram Rao', 38, 'IT', 85000, 'Pune', '2018-11-12'),
(206, 'Anjali Verma', 41, 'Marketing', 53000, 'Kolkata', '2016-09-30'),
(207, 'Karan Patel', 26, 'HR', 40000, 'Hyderabad', '2022-04-18'),
(208, 'Sara Khan', 35, 'Sales', 70000, 'Chennai', '2017-02-14'),
(209, 'Rohit Nair', 30, 'IT', 92000, 'Bangalore', '2020-10-20'),
(210, 'Priya Verma', 44, 'Finance', 82000, 'Jaipur', '2014-08-11'),
(211, 'Amit Kumar', 27, 'Marketing', 45000, 'Delhi', '2023-01-25'),
(212, 'Neha Sharma', 31, 'HR', 51000, 'Pune', '2019-12-19'),
(213, 'Siddharth Rao', 36, 'IT', 78000, 'Chennai', '2017-06-01'),
(214, 'Divya Kulkarni', 29, 'Sales', 58000, 'Hyderabad', '2021-05-09'),
(215, 'Rajesh Pillai', 40, 'Finance', 91000, 'Bangalore', '2013-04-27');


CREATE TABLE Departments (
    dept_id INT PRIMARY KEY,
    department_name VARCHAR(30),
    manager VARCHAR(50)
);
INSERT INTO Departments (dept_id, department_name, manager) VALUES
(1, 'IT', 'Rahul'),
(2, 'HR', 'Kavitha'),
(3, 'Finance', 'Suresh'),
(4, 'Sales', 'Mahesh'),
(5, 'Marketing', 'Neha');



CREATE TABLE Projects (
    project_id INT PRIMARY KEY,
    project_name VARCHAR(50),
    department VARCHAR(30),
    budget INT
);
INSERT INTO Projects (project_id, project_name, department, budget) VALUES
(201, 'Website Revamp', 'IT', 150000),
(202, 'Recruitment Drive', 'HR', 90000),
(203, 'Audit Analysis', 'Finance', 120000),
(204, 'Sales Expansion', 'Sales', 200000),
(205, 'Brand Campaign', 'Marketing', 180000);


select * from Staff;
select * from Departments;
select * from Projects;
