---FUNCTIONS---

---STRING FUNCTIONS---
select * from BOOKS;
/*Convert title to uppercase*/

select UPPER(title) as title
from BOOKS;

/*Check author name length*/

select author,LEN(author) as author_len
from BOOKS;
/*Extract the first word of each book title*/
select title,LEN(LEFT(title,CHARINDEX(' ',title + ' ',1)-1)) as title_firstletter
from BOOKS;

/*Get last 5 letters of publisher*/

select publisher, RIGHT(publisher,5) as last_5_char
from BOOKS;

/*Combine title + author*/
select CONCAT(title,' ','by',' ',author) as title_author
from BOOKS;

/*Create full book label*/

/*Replace spaces with hyphens*/
select title,REPLACE(title,' ','-') as new_title
from BOOKS;
/*Replace "The" with ""*/
select title,REPLACE(title,'The','') as new_title
from BOOKS;
/*Clean leading/trailing spaces*/

select * from BOOKS;
select TRIM(title) from BOOKS;
