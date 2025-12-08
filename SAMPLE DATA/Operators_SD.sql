CREATE TABLE Staff_A(
e_id INT,
e_name VARCHAR(50),
city VARCHAR(50)
);

CREATE TABLE Staff_B(
e_id INT,
e_name VARCHAR(50),
city VARCHAR(50)
);

INSERT INTO Staff_A (e_id,e_name,city) VALUES
(101, 'John', 'Delhi'),
(102, 'Anita', 'Mumbai'),
(103, 'Raj', 'Bangalore'),
(104, 'Meera', 'Hyderabad');

INSERT INTO Staff_B (e_id,e_name,city) VALUES
(103, 'Raj', 'Bangalore'),
(104, 'Meera', 'Hyderabad'),
(105, 'Karan', 'Pune'),
(106, 'Riya', 'Chennai');

select * from Staff_A;
select * from Staff_B;