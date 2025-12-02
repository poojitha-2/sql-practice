---ORDER BY---

/*List all employees ordered by name in ascending order.*/

select emp_id,name 
from Staff
order by name;

/*Show employees ordered by salary (highest first).*/

select emp_id,name,salary
from Staff
order by salary desc;

/*Sort employees by department, then by name inside each department.*/

select name,department
from Staff
order by department,name asc;

/*Order employees by hire_date from oldest to newest.*/

select * from Staff
order by hire_date;

	--DISTINCT--
/*Show distinct city names from Employees.*/

select distinct city
from Staff;

/*Show distinct job titles from Employees.*/

select distinct department 
from staff;

/*Show how many unique departments exist.*/

select count(distinct(department)) as totaldepartments
from staff;

	--TOP--

/*Retrieve the top 5 highest-paid employees.*/

select top 5 emp_id,name,salary
from staff
order by salary desc;

/*Show top 3 most recently hired employees.*/

select top 3 emp_id,name,hire_date
from Staff
order by hire_date desc;

/*Get the top 10 oldest employees by age.*/

select top 10 emp_id,name,age
from Staff
order by age desc;
