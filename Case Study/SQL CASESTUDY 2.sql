CREATE TABLE LOCATION (
  Location_ID INT PRIMARY KEY,
  City VARCHAR(50)
);

INSERT INTO LOCATION (Location_ID, City)
VALUES (122, 'New York'),
       (123, 'Dallas'),
       (124, 'Chicago'),
       (167, 'Boston');


  CREATE TABLE DEPARTMENT (
  Department_Id INT PRIMARY KEY,
  Name VARCHAR(50),
  Location_Id INT,
  FOREIGN KEY (Location_Id) REFERENCES LOCATION(Location_ID)
);


INSERT INTO DEPARTMENT (Department_Id, Name, Location_Id)
VALUES (10, 'Accounting', 122),
       (20, 'Sales', 124),
       (30, 'Research', 123),
       (40, 'Operations', 167);

	   CREATE TABLE JOB (
  Job_ID INT PRIMARY KEY,
  Designation VARCHAR(50)
);

INSERT  INTO JOB VALUES
(667, 'CLERK'),
(668,'STAFF'),
(669,'ANALYST'),
(670,'SALES_PERSON'),
(671,'MANAGER'),
(672, 'PRESIDENT')

CREATE TABLE EMPLOYEE
(EMPLOYEE_ID INT,
LAST_NAME VARCHAR(20),
FIRST_NAME VARCHAR(20),
MIDDLE_NAME CHAR(1),
JOB_ID INT FOREIGN KEY
REFERENCES JOB(JOB_ID),
MANAGER_ID INT,
HIRE_DATE DATE,
SALARY INT,
COMM INT,
DEPARTMENT_ID  INT FOREIGN KEY
REFERENCES DEPARTMENT(DEPARTMENT_ID))

INSERT INTO EMPLOYEE VALUES
(7369,'SMITH','JOHN','Q',667,7902,'17-DEC-84',800,NULL,20),
(7499,'ALLEN','KEVIN','J',670,7698,'20-FEB-84',1600,300,30),
(7505,'DOYLE','JEAN','K',671,7839,'04-APR-85',2850,NULl,30),
(7506,'DENNIS','LYNN','S',671,7839,'15-MAY-85',2750,NULL,30),
(7507,'BAKER','LESLIE','D',671,7839,'10-JUN-85',2200,NULL,40),
(7521,'WARK','CYNTHIA','D',670,7698,'22-FEB-85',1250,500,30)

/*1. List all the employee details.*/
select * from EMPLOYEE;

/*2. List all the department details.*/
select * from DEPARTMENT;
/*3. List all job details.*/
select * from JOB;
/*4. List all the locations.*/
select * from LOCATION;
/*5. List out the First Name, Last Name, Salary, Commission for all Employees.*/
select 
    FIRST_NAME,
    LAST_NAME,
    SALARY,
    COMM
from EMPLOYEE
/*6. List out the Employee ID, Last Name, Department ID for all employees and
alias
Employee ID as "ID of the Employee", Last Name as "Name of the
Employee", Department ID as "Dep_id".*/
select 
    EMPLOYEE_ID AS ID_of_the_Employee,
    LAST_NAME Name_of_the_Employee,
    DEPARTMENT_ID Dep_id
from EMPLOYEE
/*7. List out the annual salary of the employees with their names only.*/
select 
    FIRST_NAME,
    LAST_NAME,
    MIDDLE_NAME,
    SALARY
from EMPLOYEE

/*List the details about "Smith".*/
select * from EMPLOYEE
where LAST_NAME = 'Smith'
/*List out the employees who are working in department 20.*/
select 
    EMPLOYEE_ID,
    FIRST_NAME,
    DEPARTMENT_ID
from EMPLOYEE
where DEPARTMENT_ID = 20;
/*List out the employees who are earning salary between 2000 and 3000.*/
select *
from EMPLOYEE
where SALARY BETWEEN 2000 AND 3000;
/*List out the employees who are working in department 10 or 20.*/
select * 
from EMPLOYEE
where DEPARTMENT_ID IN (10,20);
/*Find out the employees who are not working in department 10 or 30.*/
select * 
from EMPLOYEE
where DEPARTMENT_ID NOT IN (10,30);
/*List out the employees whose name starts with 'L'.*/
select 
 *
from EMPLOYEE
where FIRST_NAME like 'L%';
/*List out the employees whose name starts with 'L' and ends with 'E'.*/
select 
 *
from EMPLOYEE
where FIRST_NAME like 'L%E';
/*List out the employees whose name length is 4 and start with 'J'.*/
select *
from EMPLOYEE
where LEN(FIRST_NAME) = 4 AND FIRST_NAME like 'J%';
/*List out the employees who are working in department 30 and draw the
salaries more than 2500.*/
select * from EMPLOYEE
where DEPARTMENT_ID = 30 AND SALARY > 2500;
/*List out the employees who are not receiving commission.*/
select * from EMPLOYEE
where COMM IS NULL

/* List out the Employee ID and Last Name in ascending order based on the
Employee ID.*/
select 
    EMPLOYEE_ID,
    LAST_NAME
from EMPLOYEE
order by EMPLOYEE_ID;
/*List out the Employee ID and Name in descending order based on salary.*/
select 
    EMPLOYEE_ID,
    LAST_NAME
from EMPLOYEE
order by SALARY DESC;
/*List out the employee details according to their Last Name in ascending-order.*/
select * from EMPLOYEE
order by LAST_NAME;
/*List out the employee details according to their Last Name in ascending
order and then Department ID in descending order.*/
select * from EMPLOYEE
order by LAST_NAME,
         DEPARTMENT_ID desc;

/*List out the department wise maximum salary, minimum salary and
average salary of the employees*/
select 
    DEPARTMENT_ID,
    MAX(SALARY) MaximumSalary,
    MIN(SALARY) MinimumSalary,
    AVG(SALARY) AvgSalary
from EMPLOYEE
group by DEPARTMENT_ID
/* List out the job wise maximum salary, minimum salary and average
salary of the employees.*/
select 
    JOB_ID,
    MAX(SALARY) MaximumSalary,
    MIN(SALARY) MinimumSalary,
    AVG(SALARY) AvgSalary
from EMPLOYEE
group by JOB_ID
/*List out the number of employees who joined each month in ascending order.*/
select 
    DATENAME(MONTH,HIRE_DATE) AS Month,
    COUNT(*) no_of_employees
from EMPLOYEE
group by DATENAME(MONTH,HIRE_DATE)
order by DATENAME(MONTH,HIRE_DATE)
/*List out the number of employees for each month and year in
ascending order based on the year and month.*/
select 
    FORMAT(HIRE_DATE,'MM/yyyy') AS Month_Year,
    COUNT(*) no_of_employees
from EMPLOYEE
group by FORMAT(HIRE_DATE,'MM/yyyy')
order by FORMAT(HIRE_DATE,'MM/yyyy') asc
/*List out the Department ID having at least four employees.*/
select 
    DEPARTMENT_ID,
    COUNT(*) no_of_employees
from EMPLOYEE
group by DEPARTMENT_ID
having COUNT(*) >=4
/*How many employees joined in February month.*/
select 
    DATENAME(MONTH,HIRE_DATE) as month,
    COUNT(*) no_of_employees
from EMPLOYEE
group by DATENAME(MONTH,HIRE_DATE)
having DATENAME(MONTH,HIRE_DATE) = 'February'
/*How many employees joined in May or June month.*/
select 
    DATENAME(MONTH,HIRE_DATE) as month,
    COUNT(*) no_of_employees
from EMPLOYEE
group by DATENAME(MONTH,HIRE_DATE)
having DATENAME(MONTH,HIRE_DATE) IN ('MAY','JUNE')
/*How many employees joined in 1985?*/
select 
    YEAR(HIRE_DATE) as year,
    COUNT(*) no_of_employees
from EMPLOYEE
group by YEAR(HIRE_DATE)
having YEAR(HIRE_DATE) = 1985
/*How many employees joined each month in 1985?*/
select 
    DATENAME(MONTH,HIRE_DATE) as month,
    COUNT(*) no_of_employees
from EMPLOYEE
where YEAR(HIRE_DATE) = 1985
group by DATENAME(MONTH,HIRE_DATE)

/* How many employees were joined in April 1985?*/
select 
    DATENAME(MONTH,HIRE_DATE) Month,
    YEAR(HIRE_DATE) as Year,
    COUNT(*) no_of_employees
from EMPLOYEE
where MONTH(HIRE_DATE) = 4
group by YEAR(HIRE_DATE),DATENAME(MONTH,HIRE_DATE)
having YEAR(HIRE_DATE) = 1985
/*Which is the Department ID having greater than or equal to 3 employees
joining in April 1985?*/

select 
    DEPARTMENT_ID,
    COUNT(*) no_of_employees,
    FORMAT(HIRE_DATE,'MM-yyyy') as hiredate
from EMPLOYEE
group by DEPARTMENT_ID,FORMAT(HIRE_DATE,'MM-yyyy')
having COUNT(*) >= 3 AND FORMAT(HIRE_DATE,'MM-yyyy') = '04-1985'

/* List out employees with their department names.*/
select 
    e.EMPLOYEE_ID,
    d.Name
from EMPLOYEE e
LEFT JOIN DEPARTMENT d ON
e.DEPARTMENT_ID = d.Department_Id
/*Display employees with their designations.*/
select 
    e.EMPLOYEE_ID,
    j.Designation
from EMPLOYEE e
LEFT JOIN JOB j ON
e.JOB_ID = j.Job_ID

/*Display the employees with their department names and city.*/
select 
    e.EMPLOYEE_ID,
    d.Name,
    l.City
from EMPLOYEE e
Left join DEPARTMENT d ON
e.DEPARTMENT_ID = d.Department_Id
left join LOCATION l ON
d.Location_Id = l.Location_ID

/*How many employees are working in different departments? Display with
department names.*/
select 
    DISTINCT d.Name DeptName,
    COUNT(*)  no_of_employees
from EMPLOYEE e
Left Join DEPARTMENT d ON
e.DEPARTMENT_ID = d.Department_Id
group by d.Name
/*How many employees are working in the sales department?*/
select 
d.Name as DeptName,
COUNT(*) no_of_employees 
from EMPLOYEE e
LEFT JOIN DEPARTMENT d ON
e.DEPARTMENT_ID = d.Department_Id
where d.Name = 'sales'
group by d.Name
/*Which is the department having greater than or equal to 3
employees and display the department names in
ascending order.*/
select 
d.Name as DeptName,
COUNT(*) no_of_employees
from EMPLOYEE e
Left join DEPARTMENT d ON
e.DEPARTMENT_ID = d.Department_Id
group by d.Name
having COUNT(*)>= 3
order by d.Name 
/*How many employees are working in 'Dallas'?*/
select 
    l.City,
    COUNT(*) no_of_employees
from EMPLOYEE e
Left Join DEPARTMENT d ON
e.DEPARTMENT_ID = d.Department_Id
Left join LOCATION l ON
d.Location_Id = l.Location_ID
where l.City = 'dallas'
group by l.City

/*Display all employees in sales or operation departments.*/
select 
e.EMPLOYEE_ID,
d.Name
from EMPLOYEE e
left join DEPARTMENT d ON
e.DEPARTMENT_ID = d.Department_Id
where d.Name IN('sales','operations')

select * from DEPARTMENT
select * from LOCATION
select * from EMPLOYEE
select * from JOB
/*Display the employee details with salary grades. Use conditional statement to
create a grade column.*/
select
    EMPLOYEE_ID,
    SALARY,
    CASE 
        WHEN SALARY > 2500 THEN 'A'
        WHEN SALARY > 1500 AND SALARY < 2500 THEN 'B'
        WHEN SALARY > 1000 AND SALARY < 1500 THEN 'C'
        ELSE 'D'
    END as GRADE
from EMPLOYEE
order by GRADE 
/*List out the number of employees grade wise. Use conditional statement to
create a grade column.*/
select
    CASE 
        WHEN SALARY > 2500 THEN 'A'
        WHEN SALARY > 1500 AND SALARY < 2500 THEN 'B'
        WHEN SALARY > 1000 AND SALARY < 1500 THEN 'C'
        ELSE 'D'
    END as GRADE, 
    COUNT(*) no_of_employees
from EMPLOYEE
group by CASE 
        WHEN SALARY > 2500 THEN 'A'
        WHEN SALARY > 1500 AND SALARY < 2500 THEN 'B'
        WHEN SALARY > 1000 AND SALARY < 1500 THEN 'C'
        ELSE 'D'
    END 
order by GRADE 

/*Display the employee salary grades and the number of employees between
2000 to 5000 range of salary*/
select
    CASE 
        WHEN SALARY > 2500 THEN 'A'
        WHEN SALARY > 1500 AND SALARY < 2500 THEN 'B'
        WHEN SALARY > 1000 AND SALARY < 1500 THEN 'C'
        ELSE 'D'
    END as GRADE, 
    COUNT(*) no_of_employees
from EMPLOYEE
where SALARY BETWEEN 2000 AND 5000
group by CASE 
        WHEN SALARY > 2500 THEN 'A'
        WHEN SALARY > 1500 AND SALARY < 2500 THEN 'B'
        WHEN SALARY > 1000 AND SALARY < 1500 THEN 'C'
        ELSE 'D'
    END 
order by GRADE 

/*Display the employees list who got the maximum salary.*/
select * 
from EMPLOYEE
where SALARY = (
        select 
            MAX(SALARY) maxsalary
        from EMPLOYEE
)
/*Display the employees who are working in the sales department.*/
select * 
from EMPLOYEE
where DEPARTMENT_ID =(
        select 
            Department_Id 
        from DEPARTMENT d
        where d.Name = 'Sales'
)
/*Display the employees who are working as 'Clerk'.*/
select * 
from EMPLOYEE
where JOB_ID = (
            select 
                Job_ID 
            from JOB
            where Designation = 'clerk'
)
/* Display the list of employees who are living in 'Boston'.*/
select * 
from EMPLOYEE
where DEPARTMENT_ID =(
                        select Department_Id from DEPARTMENT
                        where Location_Id = (
                                               select Location_ID from LOCATION
                                               where City= 'boston'
                                             )
                      )
/*Find out the number of employees working in the sales department.*/
select 
    COUNT(*) no_of_employees 
from EMPLOYEE
where DEPARTMENT_ID = (
            select Department_Id from DEPARTMENT
            where Name = 'sales'
)
/*Update the salaries of employees who are working as clerks on the basis of 10%.*/
UPDATE EMPLOYEE 
SET SALARY = SALARY * 1.10
where JOB_ID IN (
    select 
        JOB_ID
    from JOB
    where Designation = 'clerk'
)
select * from EMPLOYEE
select * from DEPARTMENT
select * from JOB
/*Display the second highest salary drawing employee details.*/
select MAX(SALARY) second_highest_salary from EMPLOYEE
where SALARY < (
    select MAX(SALARY) maxsalary from EMPLOYEE
)
/*List out the employees who earn more than every employee in department 30.*/
select EMPLOYEE_ID from EMPLOYEE
where SALARY > ALL (
select SALARY from EMPLOYEE
where DEPARTMENT_ID = 30
)

/*Find out which department has no employees.*/
select 
    d.Name 
from DEPARTMENT d
where Department_Id = (
                        select d.Department_Id
                        from DEPARTMENT d
                        left join EMPLOYEE e on
                        d.Department_Id = e.DEPARTMENT_ID
                        where e.EMPLOYEE_ID IS NULL
                      )

/*Find out the employees who earn greater than the average salary for
their department.*/

select * from EMPLOYEE e1
where e1.SALARY >  (
                        select 
                            AVG(SALARY) avgsalary
                        from EMPLOYEE e2
                        where e2.DEPARTMENT_ID = e1.DEPARTMENT_ID
                   )
