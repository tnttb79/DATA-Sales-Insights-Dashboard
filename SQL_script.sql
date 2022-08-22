-- EYEBALL OUR DATASET -- 
USE sales;
SELECT * FROM customers;
SELECT * FROM `date`;
SELECT * FROM markets;
SELECT * FROM products;
SELECT * FROM transactions;

-- TOTAL REVENUE IN 2020 -- 
-- Method 1: INNER JOIN
SELECT 
    *, SUM(sales_amount)
FROM
    transactions t
INNER JOIN
    date d ON d.date = t.order_date
WHERE
    year = 2020;
-- Method 2: Subquery
SELECT 
    *, SUM(sales_amount)
FROM
    (SELECT 
        *, YEAR(transactions.order_date) AS order_year
    FROM
        transactions) transactions_w_year
WHERE order_year = 2020;

-- ADJUST THE CURRENCY DATA FORMAT -- 
SELECT DISTINCT(currency) FROM transactions; 
SELECT COUNT(currency) FROM transactions WHERE currency = 'INR';
SELECT COUNT(currency) FROM transactions WHERE currency = 'INR\r';

SELECT * FROM products;
SELECT DISTINCT(product_code) FROM transactions; 
USE sales;

-- REVENUE --
SELECT 
    p.product_code, SUM(t.sales_amount) AS revenue
FROM
    transactions t 
INNER JOIN products p 
ON p.product_code = t.product_code
GROUP BY p.product_code
ORDER BY revenue DESC;

select product_code, SUM(sales_amount) as revenue from transactions GROUP BY product_code order by revenue desc;






