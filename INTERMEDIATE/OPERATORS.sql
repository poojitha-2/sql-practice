---SET OPERATORS(UNION,UNION ALL,EXCEPT,INTERSECT)---

/*Retrieve all unique employees from both tables.*/

select e_id,
	   e_name
from Staff_A

UNION

select e_id,
	   e_name
from Staff_B

select * from Staff_A;
select * from Staff_B;

/*Retrieve all employees from both tables including duplicates.*/

select e_id,
	   e_name
from Staff_A

UNION ALL

select e_id,
	   e_name
from Staff_B;

/*Find employees who exist in BOTH Staff_A and Staff_B.*/
select e_id,
	   e_name
from Staff_A

INTERSECT

select e_id,
	   e_name
from Staff_B

/*Find employees who are in Staff_A but NOT in Staff_B.*/
select e_id,
	   e_name
from Staff_A

EXCEPT

select e_id,
	   e_name
from Staff_B
/*Find employees who are in Staff_B but NOT in Staff_A.*/

select e_id,
	   e_name
from Staff_B

EXCEPT

select e_id,
	   e_name
from Staff_A
/*Combine both tables but show only employees whose city matches.*/
select e_id,
	   e_name,
	   city
from Staff_A

INTERSECT

select e_id,
	   e_name,
	   city
from Staff_B
/*Get employees who are unique to each table (A only + B only).*/
(select e_id,
	   e_name
from Staff_A

EXCEPT

select e_id,
	   e_name
from Staff_B)


UNION

(select e_id,
	   e_name
from Staff_B

EXCEPT

select e_id,
	   e_name
from Staff_A)

select * from Staff_A;
select * from Staff_B;