 
 --BASIC SELECT--

select * from Staff;
select name,city from Staff;
select department,salary from Staff;

--WHERE CLAUSE--

/*Retrieve employees whose salary is greater than 50,000.*/

select emp_id,name,salary
from Staff
where salary > 50000;

/*Find employees from the city 'Hyderabad'.*/

select name,city
from Staff
where city = 'Hyderabad';

/*Get employees hired after '2021-01-01'.*/

select emp_id,name,hire_date
from Staff 
where hire_date > '2021-01-01';

/*Find employees whose department is NOT 'IT'.*/

select emp_id,name,department
from Staff
where department != 'IT';

/*Retrieve employees with age between 25 and 35.*/

select *
from Staff
where age BETWEEN 25 AND 35;



