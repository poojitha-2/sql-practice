--JOINS--

select * from Projects;
select * from Staff;

---INNER JOIN---
/*Retrieve employee name and their project name.*/

select s.name as employeeName,
	   p.project_name
from Staff s
INNER JOIN Projects p
ON s.emp_id = p.emp_id;


/*Show emp_id, department, and project_name for all employees who have projects.*/

select	s.emp_id,
		s.department,
		p.project_name
from Staff s
INNER JOIN Projects p
ON s.emp_id = p.emp_id;

---LEFT JOIN---
/*List all employees and the projects they are assigned (show NULL if no project).*/

select s.emp_id,s.name,p.project_id,p.project_name
from Staff s
LEFT JOIN Projects p
ON s.emp_id = p.emp_id;

/*Find employees who are not assigned to any project.*/

select s.emp_id,p.project_id,p.project_name
from Staff s
LEFT JOIN Projects p
ON s.emp_id = p.emp_id
where p.project_id IS NULL;

---RIGHT JOIN---
/*List all projects and the employees working on them (even if employee record missing).*/
select p.emp_id,p.project_id,p.project_name
from Staff s
RIGHT JOIN Projects p
ON s.emp_id = p.emp_id
/*Show projects where an employee exists or is missing (spot NULL emp rows).*/
select p.project_id,p.project_name,p.emp_id,s.name
from Staff s
RIGHT JOIN Projects p
ON s.emp_id = p.emp_id;

select * from Projects;
select * from Staff;

---FULL OUTER JOIN---
/*Show all employees and all projects, matching wherever possible.*/
select s.emp_id,s.name,p.project_id,p.project_name
from Staff s
FULL JOIN Projects p
ON s.emp_id = p.emp_id;