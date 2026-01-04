/*Create a CTE that returns EmpID, EmpName, Salary, and then select all rows from it.*/
with cte_employee_details as
(
	select 
		EmpID,
		EmpName,
		Salary
	from Employee
)
select * from cte_employee_details;
/*Use a CTE to display employees whose salary is greater than 50,000.*/
with cte_employee_salary as
(
	select 
		EmpID,
		EmpName,
		Salary
	from Employee
)
select * from cte_employee_salary 
where Salary > 50000
/*Create a CTE that calculates the average salary and use it to find employees earning more than the average.*/
with cte_average_salary as
(
	select
		AVG(Salary) avg_salary
	from Employee
)
select 
	e.EmpID,
	e.EmpName,
	e.Salary,
	cas.avg_salary
from Employee e
CROSS JOIN cte_average_salary cas
where e.Salary > cas.avg_salary

select * from Employee
select * from Department
/*Write a CTE to list employees along with their department name.*/
with cte_employee_deptname as
(
	select
		EmpID,
		EmpName,
		DeptName
	from Employee e
	LEFT JOIN Department d
	ON e.DeptID = d.DeptID
)
select * from cte_employee_deptname;

/*Use a CTE to calculate the total number of employees per department.*/

with cte_total_employees_per_dept as
(
	select 
		DeptID,
		COUNT(*) no_of_employees
	from Employee
	group by DeptID
)
select * from cte_total_employees_per_dept;

/*Create a CTE to find the maximum salary in each department and display department-wise max salary.*/

with cte_max_salary_in_each_dept as
(
	select
		DeptID,
		MAX(Salary) max_salary
	from Employee
	where DeptID IS NOT NULL
	Group by DeptID
)
select * from cte_max_salary_in_each_dept

/*Use a CTE to find departments whose average salary is greater than overall average salary.*/
with cte_avg_salary as
(
	select 
		DeptID,
		AVG(Salary) dept_avg_salary
	from Employee
	where DeptID IS NOT NULL
	group by DeptID
)
select * from cte_avg_salary 
where dept_avg_salary > (
select AVG(Salary) from Employee)
/*Create a CTE that lists employees and their managers’ names.*/
with cte_employee_manager as
	(select 
		e.EmpID,
		e.EmpName,
		e.ManagerID,
		m.EmpName as ManagerName
	from Employee e
	LEFT JOIN Employee m
	ON e.ManagerID = m.EmpID )
select * from cte_employee_manager

/*Use a CTE to find employees who earn more than their manager.*/

with cte_employee_manager_salary as
	(select 
		e.EmpID,
		e.EmpName,
		e.ManagerID,
		e.Salary
	from Employee e
	LEFT JOIN Employee m
	ON e.ManagerID = m.EmpID 
	where e.Salary > m.Salary)
select * from cte_employee_manager_salary
/*Create a CTE to list customers along with their total order amount.*/

with cte_total_order_amount as 
(
	select 
		CustomerID,
		SUM(Amount) total_order_amount
	from Orders
	group by CustomerID
)
Select c.CustomerID,
c.CustomerName,
ctoa.total_order_amount
from Customer c
LEFT JOIN cte_total_order_amount as ctoa
ON c.CustomerID = ctoa.CustomerID
/*Display departments whose average salary is greater than overall average.*/
with cte_avg_salary as
(
	select 
		DeptID,
		AVG(Salary) avg_salary
	from Employee
	where DeptID IS NOT NULL
	group by DeptID
),
cte_overall_avg_salary as
(
	select 
		AVG(Salary) overall_avg_salary
	from Employee

)
select 
	DeptId
from cte_avg_salary cas
cross join cte_overall_avg_salary coas
where cas.avg_salary > coas.overall_avg_salary
/*Create two CTEs:

One for customers with orders

One for customers without orders

Display both results together.*/

with cte_customers_with_orders as 
(
	select 
		c.CustomerID,
		c.CustomerName
	from Customer c
	JOIN Orders o ON
	c.CustomerID = o.CustomerID
	
),cte_customers_without_orders as
(
	select 
		c.CustomerID,
		c.CustomerName
	from Customer c
	where NOT EXISTS(
		select 1
		from Orders o
		where o.CustomerID = c.CustomerID
	)
)
SELECT 
    CustomerID,
    CustomerName,
    'With Order' AS Status
FROM cte_customers_with_orders
UNION ALL

SELECT 
    CustomerID,
    CustomerName,
    'Without Order' AS Status
FROM cte_customers_without_orders;
