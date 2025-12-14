select * from Customers;
select * from Products;
select * from Sales;

select 
	c.customer_id,
	SUM(s.sale_amount) total_sale,
	RANK() OVER(
			order by SUM(s.sale_amount) desc
	)
from Customers c
LEFT JOIN Sales s
ON c.customer_id = s.customer_id
group by c.customer_id;
		
/*Show RANK(), DENSE_RANK(), and ROW_NUMBER() for each sale ordered by sale_amount DESC.*/
select
	
	sale_id,customer_id,sale_amount,
	RANK() OVER(order by sale_amount desc) rank_number,
	DENSE_RANK() OVER (order by sale_amount desc) dense_rank_number,
	ROW_NUMBER() OVER(order by sale_amount desc) row_number_
from Sales
/*Show each sale and the running total of sale_amount per customer.*/
select 
	s.sale_id,
	s.customer_id,
	s.sale_amount,
	SUM(s.sale_amount) OVER(
		PARTITION BY s.customer_id
		order by s.sale_id
	) running_total
	
from Sales s;
/*Show each sale and the average sale_amount per product category.*/
select 
s.sale_id,
p.category,
s.sale_amount,
AVG(s.sale_amount) OVER(
						partition by p.category		
	) avg_sale_amount
from Sales s
LEFT JOIN Products p
ON s.product_id = p.product_id
		
/*For each customer, show their previous sale date (LAG).*/
select
c.customer_id,
s.sale_date,
LAG(sale_date,1) OVER(
	partition by c.customer_id
	order by s.sale_date) previous_sale_date
from Customers c
Left join Sales s
ON c.customer_id = s.customer_id

/*For each product, show the next sale amount (LEAD).*/
select 
sale_id,
product_id,
sale_date,
sale_amount,
LEAD(sale_amount) OVER(
		partition by product_id
		order by sale_date
) next_sale_Amount
from Sales;
/*For each customer, show their first purchase amount.*/

select 
	customer_id,
	sale_date,
	sale_amount,
	FIRST_VALUE(sale_amount) OVER(
								partition by customer_id
								order by sale_date
	) first_purchase_amount
from Sales;
/*For each customer, show their most recent purchase amount.*/
select 
	customer_id,
	sale_date,
	sale_amount,
	LAST_VALUE(sale_amount) OVER(
								partition by customer_id
								order by sale_date 
								ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING
	) recent_purchase_amount
from Sales;

/*Divide all sales into 4 quartiles based on sale_amount.*/

select 
	sale_id,
	sale_amount,
	NTILE(4) OVER (
			order by sale_amount desc
	)
from Sales;
/*Show rolling 3-sale moving average per customer*/
select 
	s.sale_id,
	s.customer_id,
	s.sale_amount,
	AVG(s.sale_amount) OVER(
		PARTITION BY s.customer_id
		order by s.sale_id
		ROWS BETWEEN 2 PRECEDING AND CURRENT ROW
	) running_total
	
from Sales s;
