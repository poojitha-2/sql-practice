create schema dannys_diner
GO;

create table dannys_diner.sales(
	customer_id VARCHAR(1),
	order_date DATE,
	product_id INT
)
Insert INTO dannys_diner.sales 
VALUES
  ('A', '2021-01-01', '1'),
  ('A', '2021-01-01', '2'),
  ('A', '2021-01-07', '2'),
  ('A', '2021-01-10', '3'),
  ('A', '2021-01-11', '3'),
  ('A', '2021-01-11', '3'),
  ('B', '2021-01-01', '2'),
  ('B', '2021-01-02', '2'),
  ('B', '2021-01-04', '1'),
  ('B', '2021-01-11', '1'),
  ('B', '2021-01-16', '3'),
  ('B', '2021-02-01', '3'),
  ('C', '2021-01-01', '3'),
  ('C', '2021-01-01', '3'),
  ('C', '2021-01-07', '3');
  select * from dannys_diner.sales;

  CREATE TABLE dannys_diner.menu (
  product_id INT,
  product_name VARCHAR(5),
  price INT
);

INSERT INTO dannys_diner.menu
  (product_id, product_name, price)
VALUES
  ('1', 'sushi', '10'),
  ('2', 'curry', '15'),
  ('3', 'ramen', '12');


CREATE TABLE dannys_diner.members (
  customer_id VARCHAR(1),
  join_date DATE
);

INSERT INTO dannys_diner.members
  (customer_id, join_date)
VALUES
  ('A', '2021-01-07'),
  ('B', '2021-01-09');



/*What is the total amount each customer spent at the restaurant?*/

select 
	s.customer_id,
	SUM(m.price) totalAmount
from dannys_diner.sales s
INNER join dannys_diner.menu m ON 
s.product_id = m.product_id
group by s.customer_id
/*How many days has each customer visited the restaurant?*/

select 
	s.customer_id,
	count( DISTINCT s.order_date) no_of_days
from dannys_diner.sales s
group by s.customer_id

--What was the first item from the menu purchased by each customer?

WITH ranked_orders AS (
    SELECT
        s.customer_id,
        s.order_date,
        m.product_name,
        ROW_NUMBER() OVER (
            PARTITION BY s.customer_id
            ORDER BY s.order_date
        ) AS rn
    FROM dannys_diner.sales s
    JOIN dannys_diner.menu m
        ON s.product_id = m.product_id
)
SELECT
    customer_id,
    product_name AS first_item_purchased
FROM ranked_orders
WHERE rn = 1
ORDER BY customer_id;


--What is the most purchased item on the menu and how many times was it purchased by all customers?

select top 1
	m.product_name most_purchased_item,
	count(m.product_id) no_of_times_purchased
from dannys_diner.menu m
INNER join dannys_diner.sales s ON
m.product_id = s.product_id
group by m.product_name
order by count(m.product_id) desc
--Which item was the most popular for each customer?

with cte_most_popular_item as(
        select
            s.customer_id,
            m.product_name,
            count(s.product_id) no_of_orders,
            RANK() over(partition by s.customer_id order by count(s.product_id) desc) rnk
        from dannys_diner.sales s
        inner join dannys_diner.menu m on
        s.product_id = m.product_id
        group by s.customer_id,m.product_name
        --order by s.customer_id,no_of_orders desc
)
select customer_id,
product_name
from cte_most_popular_item 
where rnk = 1
--Which item was purchased first by the customer after they became a member?

with cte_ranked_orders as(

                    select 
                    s.customer_id,
                    s.order_date,
                    m.product_name,
                    ROW_NUMBER() over(partition by s.customer_id order by s.order_date ) rn
                    from dannys_diner.sales s
                    join dannys_diner.members mem  on 
                    s.customer_id = mem.customer_id
                    join dannys_diner.menu m on
                    s.product_id = m.product_id
                    where s.order_date  >= mem.join_date
)

select 
customer_id,
product_name 
from cte_ranked_orders 
where rn = 1
--Which item was purchased just before the customer became a member?
with cte_ranked_orders as(

                    select 
                    s.customer_id,
                    s.order_date,
                    m.product_name,
                    ROW_NUMBER() over(partition by s.customer_id order by s.order_date desc) rn
                    from dannys_diner.sales s
                    join dannys_diner.members mem  on 
                    s.customer_id = mem.customer_id
                    join dannys_diner.menu m on
                    s.product_id = m.product_id
                    where s.order_date  < mem.join_date
)

select 
customer_id,
product_name 
from cte_ranked_orders 
where rn = 1

--What is the total items and amount spent for each member before they became a member?

select 
s.customer_id,
count(*) total_items,
sum(m.price) total_amount
from 
dannys_diner.sales s
join dannys_diner.members mem on 
s.customer_id = mem.customer_id
join dannys_diner.menu m on
s.product_id = m.product_id
where s.order_date < mem.join_date
group by s.customer_id

--If each $1 spent earns 10 points and sushi has a 2× points multiplier, how many points does each customer have?

select * from dannys_diner.members
select * from dannys_diner.sales
select * from dannys_diner.menu

select 
     s.customer_id,
     sum(
            CASE
                WHEN LOWER(m.product_name) = 'sushi' THEN m.price*10*2
                ELSE m.price*10
            END 
        ) AS points
 from dannys_diner.sales s
 JOIN dannys_diner.menu m ON
 s.product_id = m.product_id
 group by s.customer_id

 --Double points for all items in the first week after joining, and sushi always has 2× points. Calculate points by end of January.
 select 
     s.customer_id,
     sum(
            CASE
                WHEN s.order_date BETWEEN mem.join_date AND DATEADD(day,6,mem.join_date)  OR 
                m.product_name = 'sushi' THEN m.price*10*2
                ELSE m.price*10
            END 
        ) AS points
 from dannys_diner.sales s
 JOIN dannys_diner.menu m ON
 s.product_id = m.product_id
LEFT JOIN dannys_diner.members mem ON
 s.customer_id = mem.customer_id
 where s.order_date <= '2021-01-31'
 group by s.customer_id
 order by s.customer_id