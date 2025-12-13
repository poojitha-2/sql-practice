CREATE TABLE Customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(50),
    city VARCHAR(30),
    joined_date DATE
);
CREATE TABLE Products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(50),
    category VARCHAR(30),
    price DECIMAL(10,2)
);
CREATE TABLE Sales (
    sale_id INT PRIMARY KEY,
    customer_id INT,
    product_id INT,
    quantity INT,
    sale_amount DECIMAL(10,2),
    sale_date DATE,
    
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id),
    FOREIGN KEY (product_id) REFERENCES Products(product_id)
);
INSERT INTO Customers VALUES
(1, 'Alice', 'Hyderabad', '2021-01-10'),
(2, 'Rohan', 'Bangalore', '2020-06-20'),
(3, 'Meera', 'Chennai', '2022-02-18'),
(4, 'Arjun', 'Delhi', '2021-11-02'),
(5, 'Sara', 'Mumbai', '2023-03-28');
INSERT INTO Products VALUES
(101, 'Laptop', 'Electronics', 55000),
(102, 'Mobile', 'Electronics', 25000),
(103, 'Headphones', 'Accessories', 3000),
(104, 'Office Chair', 'Furniture', 8000),
(105, 'Notebook', 'Stationery', 50);
INSERT INTO Sales VALUES
(1, 1, 101, 1, 55000, '2023-01-15'),
(2, 2, 102, 1, 25000, '2023-01-18'),
(3, 1, 103, 2, 6000,  '2023-02-10'),
(4, 3, 105, 10, 500,  '2023-03-01'),
(5, 4, 104, 1, 8000,  '2023-04-12'),
(6, 2, 101, 1, 55000, '2023-04-22'),
(7, 1, 105, 20, 1000, '2023-04-25'),
(8, 5, 102, 1, 25000, '2023-05-01'),
(9, 3, 103, 1, 3000,  '2023-05-03'),
(10, 4, 101, 1, 55000, '2023-05-10');

select * from Customers;
select * from Products;
select * from Sales;