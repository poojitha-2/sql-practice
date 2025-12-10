select * from BOOKS;


/*Get each book title with its rounded price.*/

select title,
	   price,
	   ROUND(price,1) round_price,
	   ROUND(price,0) round_price
from BOOKS;

/*Get the ceiling and floor of each price*/

select 
	title,
	price,
	CEILING(price) ceiling_price,
	FLOOR(price) floor_price
from BOOKS;

/*Get the maximum and minimum price in books and */

select
	MAX(price) maximum_price,
	MIN(price) minimum_price
from BOOKS;

select 
	ABS(-22),
	ABS(-122);

select SQRT(100);
select SQUARE(25);

select COUNT(*)
from BOOKS;

select POWER(5,2);

select 
	SUM(price) total_price 
from BOOKS;

select AVG(price) avg_price
from BOOKS;
