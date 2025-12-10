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
