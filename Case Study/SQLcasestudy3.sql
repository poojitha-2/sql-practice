select * from Transactions;
select * from Continent;
select * from Customers;

/*Display the count of customers in each region who have done the
transaction in the year 2020*/

select 
c.region_id,
COUNT(DISTINCT c.customer_id) no_of_customers
from Customers c
INNER JOIN Transactions  t ON
c.customer_id = t.customer_id
where YEAR(t.txn_date) = 2020
group by c.region_id
order by c.region_id

/*Display the maximum and minimum transaction amount of each
transaction type.*/
select 
txn_type,
MAX(txn_amount) maximum_txn,
MIN(txn_amount) minimum_txn
from Transactions
group by txn_type

/*Display the customer id, region name and transaction amount where
transaction type is deposit and transaction amount > 2000*/
select 
c.customer_id,
co.region_name,
t.txn_amount
from Customers c
INNER JOIN Transactions  t ON
c.customer_id = t.customer_id
INNER JOIN Continent  co ON
c.region_id = co.region_id
where t.txn_type = 'deposit' AND  t.txn_amount > 2000

/*Find duplicate records in the Customer table.*/
with cte as(
select 
*,
ROW_NUMBER() OVER(partition by customer_id,region_id,start_date,end_date order by customer_id) rn
from Customers
)
select * from cte where rn > 1

/*Display th customer id, region name, transaction type and transaction
amount for the minimum transaction amount in deposit.*/
select 
c.customer_id,
co.region_name,
t.txn_type,
MIN(t.txn_amount) minimum_txn_amount
from Customers c
INNER JOIN Transactions  t ON
c.customer_id = t.customer_id
INNER JOIN Continent  co ON
c.region_id = co.region_id
where t.txn_type = 'deposit' 
group by c.customer_id,co.region_name,t.txn_type