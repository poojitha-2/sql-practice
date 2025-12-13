select * from BOOKS

---DATE & TIME FUNCTIONS---
/*Show the year each book was published.*/
select 
	title,
	YEAR(published_date) published_year
from BOOKS
order by published_year desc;

/*Show the month name of each book’s published_date.*/

select 
	title,
	DATENAME(MONTH,published_date) published_month
from BOOKS;

/*Show the day of the week for each book.*/

select 
	title,
	DATENAME(DW,published_date) day_of_the_week
from BOOKS;

/*Retrieve books published after the year 2000.*/
select 
	title,
	YEAR(published_date) published_year
from BOOKS
where YEAR(published_date) > 2000;

/*Find books added to store in 2023.*/
select 
	title,
	added_to_store added_to_store_2023
from BOOKS
where YEAR(added_to_store) = 2023;
/*Get books restocked in February 2024.*/
select 
	title,
	CAST(last_restocked AS DATE) restocked_2024
from BOOKS
where YEAR(last_restocked) = 2024 AND MONTH(last_restocked) = 2;
/*Show how many years old each book is (from published_date).*/
select
	title,
	published_date,
	DATEDIFF(YEAR,published_date,getdate()) years_old
from BOOKS;
/*Calculate days between published_date and added_to_store.*/
select 
	title,
	published_date,
	DATEDIFF(DD,published_date,added_to_store) added_to_store
from BOOKS;
/*Find how many hours have passed since last_restocked.*/
select 
	title,
	published_date,
	DATEDIFF(HOUR,last_restocked,GETDATE()) last_restocked
from BOOKS;
/*Format last restocked date as “DD-MM-YYYY”.*/
select
	last_restocked,
	FORMAT(last_restocked,'dd/MM/yyyy') format_date
from BOOKS
/*Display added_to_store as “MonthName Day, Year”.*/
select 
	added_to_store,
	DATENAME(MONTH,added_to_store) + ' ' + 
	CAST(DAY(added_to_store) as varchar(2)) + ',' + 
	CAST(YEAR(added_to_store) as varchar(4))
from BOOKS
/*Convert last_restocked to only time (HH:MM:SS).*/
select 
	last_restocked,
	FORMAT(last_restocked,'HH:mm:ss') time_last_restocked
from BOOKS;