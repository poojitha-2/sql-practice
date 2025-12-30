/*Write a query to find employees whose salary is greater than the average salary of all employees.*/

select 
	EmpId,
	EmpName,
	Salary
from 
Employee
where Salary > ( select AVG(Salary) avgsalary from Employee )

/*Find the employee(s) who earn the maximum salary.*/

select 
	EmpId,
	Salary
from Employee
where Salary = ( select MAX(Salary) from Employee )
/*Display employees who work in the same department as ‘John’.*/
select
	EmpName,
	DeptID
from Employee
where DeptID IN (select DeptId from Employee where EmpName = 'John') 
/*Find employees whose salary is less than the salary of employee with EmpID = 101.*/
select 
	EmpId,
	EmpName,
	Salary
from Employee
where Salary < (select Salary from Employee where EmpID = 101 )

/*List departments that have at least one employee.*/

select 
	DeptId,
	DeptName
from Department
where  DeptID = ANY ( select DeptId from Employee )

select * from Department
select * from Employee

/*Find employees who earn more than the average salary of their department.*/
SELECT 
	E.EmpID,
	E.Salary
FROM Employee E
WHERE E.Salary > (
    SELECT AVG(Salary)
    FROM Employee
    WHERE DeptID = E.DeptID
);
/*Display employees who do not belong to any department.*/
select EmpId
from Employee
where DeptId IS NULL;

/*Find customers who have placed at least one order.*/

select c.CustomerId,
c.CustomerName
from Customer c
where c.CustomerId = ANY (select CustomerId from Orders)

/*Find customers who have never placed any order.*/

select 
	CustomerId,
	CustomerName
from Customer c
where NOT EXISTS (
			select 1
			from Orders o
			where o.CustomerID = c.CustomerID
)
/*Display employees whose salary is equal to the minimum salary in their department.*/

select 
	e.EmpId,
	e.EmpName
from Employee e
where e.Salary = (
		Select MIN(Salary) 
		from Employee
		where DeptID = e.DeptId
)
/*Find employees whose salary is greater than ALL salaries in Department 30.*/
select 
*
from Employee
where Salary > ALL(
					select 
						Salary
					from Employee
					where DeptID = 30)
/*Find employees whose salary is greater than ANY salary in Department 20.*/

select 
*
from Employee
where Salary > ANY(
					select 
						Salary
					from Employee
					where DeptID = 20)
/*List departments where average salary is greater than overall average salary.*/

select 
	DeptId,
	AVG(Salary) avgsal
from Employee 
group by DeptID
Having AVG(Salary) > (select AVG(Salary) avgsalary from Employee)

/*Find employees working in departments that have more than 5 employees.*/

select
	*
from 
Employee
where DeptId IN(
select
DeptId
from Employee
group by DeptID
Having COUNT(*) > 5)
/*Find employees who earn the highest salary in their department.*/

Select 
	EmpId,
	EmpName
from Employee e
where Salary = (
		select 
			MAX(Salary) maxsalary
		from Employee
		where e.DeptID = DeptID
)
/*Find employees whose salary is greater than the average salary of employees reporting to the same manager.*/
select 
	EmpID,
	EmpName
from Employee e
where Salary > (
select 
	AVG(Salary) avgsalary
from Employee
where ManagerID = e.ManagerID
)
/*Display customers who have placed an order with amount greater than the average order amount of that customer.*/
select
	CustomerId,
	OrderDate,
	Amount
from Orders o 
where Amount > (
select 
	AVG(Amount) avgamount
from Orders
where CustomerID = o.CustomerID
)
/*Find departments that do not have any employees earning more than 50,000.*/
SELECT 
    d.DeptId,
    d.DeptName
FROM Department d
WHERE NOT EXISTS (
    SELECT 1
    FROM Employee e
    WHERE e.DeptID = d.DeptID
      AND e.Salary > 50000
);

/*Find the second highest salary using a subquery.*/
select top 1
	Salary 
from (
select top 2 Salary
from Employee 
order by Salary Desc
)t
order by Salary ASC
---------------------
SELECT MAX(Salary)
FROM Employee
WHERE Salary < (
    SELECT MAX(Salary)
    FROM Employee
);
/*Find employees who earn more than their manager.*/


select 
	EmpId,
	EmpName
from Employee e
where EXISTS (
	select 1
	from Employee m
	where m.EmpId = e.ManagerID
	AND e.Salary > m.Salary
)
select * from Employee

SELECT 
    e.EmpId,
    e.EmpName
FROM Employee e
WHERE e.Salary > (
    SELECT m.Salary
    FROM Employee m
    WHERE m.EmpId = e.ManagerId
);
