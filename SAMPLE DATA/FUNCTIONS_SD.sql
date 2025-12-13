CREATE TABLE BOOKS(
	book_id INT PRIMARY KEY,
	title VARCHAR(100),
	author VARCHAR(50),
	genre VARCHAR(30),
	price DECIMAL(6,2),
	publisher VARCHAR(40)
);

INSERT INTO BOOKS VALUES
(1, 'Harry Potter and the Goblet of Fire', 'J.K. Rowling', 'Fantasy', 699.50, 'Bloomsbury'),
(2, 'The Great Gatsby', 'F. Scott Fitzgerald', 'Classic', 499.99, 'Scribner'),
(3, 'A Game of Thrones', 'George R.R. Martin', 'Fantasy', 899.00, 'Bantam Books'),
(4, 'To Kill a Mockingbird', 'Harper Lee', 'Classic', 350.75, 'J.B. Lippincott'),
(5, 'Atomic Habits', 'James Clear', 'Self-Help', 550.00, 'Avery'),
(6, 'The Alchemist', 'Paulo Coelho', 'Fiction', 299.00, 'HarperOne');

select * from Books;

ALTER TABLE BOOKS
ADD published_date DATE,
    added_to_store DATETIME,
    last_restocked DATETIME;

UPDATE BOOKS SET 
    published_date = '2000-07-08',
    added_to_store = '2023-02-12 10:45:00',
    last_restocked = '2024-01-15 14:20:00'
WHERE book_id = 1;

UPDATE BOOKS SET 
    published_date = '1988-05-01',
    added_to_store = '2023-03-10 16:30:00',
    last_restocked = '2024-03-01 11:00:00'
WHERE book_id = 2;

UPDATE BOOKS SET 
    published_date = '1949-06-08',
    added_to_store = '2023-04-20 12:00:00',
    last_restocked = '2024-02-10 09:30:00'
WHERE book_id = 3;

UPDATE BOOKS SET 
    published_date = '2013-05-14',
    added_to_store = '2023-01-05 09:10:00',
    last_restocked = '2024-03-05 18:45:00'
WHERE book_id = 4;

UPDATE BOOKS SET 
    published_date = '2007-05-22',
    added_to_store = '2023-06-11 14:55:00',
    last_restocked = '2024-01-20 08:00:00'
WHERE book_id = 5;

UPDATE BOOKS SET 
    published_date = '2019-02-05',
    added_to_store = '2023-07-01 17:25:00',
    last_restocked = '2024-02-25 13:15:00'
WHERE book_id = 6;