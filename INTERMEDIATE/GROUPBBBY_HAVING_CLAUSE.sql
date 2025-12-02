
	---GROUP BY---
/*Find the number of employees in each department.*/
select * from Staff;

select department,count(emp_id) as total_staff
from Staff
group by department;

/*Calculate average salary for each city.*/

select city,AVG(salary) as average_salary
from Staff
group by city;

/*Get total salary paid in each department.*/

select department,sum(salary) as total_salary
from Staff
group by department;

/*Count employees hired each year.*/

select YEAR(hire_date) as year,count(emp_id) as total_hired
from Staff
group by YEAR(hire_date);

	---HAVING---
/*Show departments having more than 5 employees.*/

select department,count(emp_id) as total_staff
from Staff
group by department
having count(emp_id) > 5;

/*Show cities where average salary is greater than 60,000.*/

select city,AVG(salary) as average_salary
from Staff 
group by city
having AVG(salary) > 60000;

/*Display departments where the total salary exceeds 3,00,000.*/

select department, sum(salary) as total_salary
from Staff
group by department
having sum(salary) > 300000;

/*List job titles with at least 3 employees.*/

select department,count(emp_id) as total_employees
from Staff
group by department
having count(emp_id) >=3;


---COMBINING CONCEPTS---

/*Get the top 5 departments with highest average salary.*/

select top 5 department,AVG(salary) as avg_salary
from Staff
group by department
order by AVG(salary) desc;

/*List employees from IT and HR ordered by salary descending.*/

select emp_id,name,department,salary
from Staff
where department IN ('IT','HR')
order by salary desc;


/*Show distinct cities of employees hired after 2020.*/

select distinct city,hire_date
from Staff
where YEAR(hire_date) > 2020;

/*Retrieve departments where maximum salary is above 90,000.*/

select department,MAX(salary) as maximum_salary
from Staff
group by department
having MAX(salary) > 90000;