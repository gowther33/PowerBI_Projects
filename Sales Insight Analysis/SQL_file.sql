USE sales;
SELECT * FROM sales.date;
SELECT * FROM sales.transactions;

-- Revenue by year
SELECT date.year, SUM(sales_amount) FROM transactions 
INNER JOIN date ON transactions.order_date = date.date
GROUP BY date.year;

Select distinct(currency) From transactions;
/* We have different currency strings so we need to fix it in power query.
'INR'
'USD'
'INR\r'
'USD\r' */

Select Count(*) as currency_count From transactions where currency = 'USD';
Select Count(*) as currency_count From transactions where currency = 'USD\r';
-- We see that USD has duplicate rows 
Select Count(*) as currency_count From transactions where currency = 'INR';
Select Count(*) as currency_count From transactions where currency = 'INR\r';
-- We see that INR\r has more records so it is correct so we remove INR records in power query

Select  Distinct(customer_code) From transactions;
Select Sum(sales_amount) as revenue From transactions;
Select count(*) from products where product_code = null;
Select distinct(product_code) from transactions;
Select * from products where product_code = '(Blank)';


