#1 Calculate total sales revenue and 
#quantity sold by product category and customer_state.

SELECT 
    p.product_category,
    c.customer_state,
    ROUND(SUM(oi.price), 2) AS total_sales_revenue,
    COUNT(oi.order_item_id) AS quantity_sold
FROM
    orders o
        JOIN
    order_items oi ON o.order_id = oi.order_id
        JOIN
    products p ON oi.product_id = p.product_id
        JOIN
    customers c ON o.customer_id = c.customer_id
GROUP BY p.product_category , c.customer_state
ORDER BY total_sales_revenue DESC;



#2. Identify the top 5 products by total sales revenue across all Walmart regions
WITH product_sales AS (
    SELECT 
        p.product_id,
        seller_state,
        seller_city,
        product_category,
        SUM(oi.price) AS total_revenue
    FROM 
        products AS p
    JOIN 
        order_items AS oi ON p.product_id = oi.product_id
	JOIN
    Sellers AS s ON s.seller_id = oi.seller_id
    GROUP BY 
        p.product_id,seller_state,seller_city,product_category
)
SELECT 
    *
FROM (
    SELECT *,
           DENSE_RANK() OVER (ORDER BY total_revenue DESC) AS sales_rank
    FROM product_sales
) ranked_products
WHERE sales_rank <= 5;






#3. Find customers with the highest number of orders and total spend, ranking them as Walmart’s most valuable customers.

SELECT
    c.customer_unique_id,
    COUNT(DISTINCT o.order_id) AS NumberOfOrders,
    SUM(p.payment_value) AS TotalSpend
FROM
    customers c
JOIN
    orders o ON c.customer_id = o.customer_id
JOIN
    payments p ON o.order_id = p.order_id
GROUP BY
    c.customer_unique_id
ORDER BY
    TotalSpend DESC, NumberOfOrders DESC;


#4. Determine customer states with the highest average order value (AOV).

SELECT
    c.customer_state,
    ROUND(AVG(p.payment_value),2) AS AverageOrderValue
FROM
    customers c
JOIN
    orders o ON c.customer_id = o.customer_id
JOIN
    payments p ON o.order_id = p.order_id
GROUP BY
    c.customer_state
ORDER BY
    AverageOrderValue DESC;



#5. Compute average delivery time (in days) by seller state, calculated as the difference
# between order_purchase_timestamp and order_delivered_customer_date.


SELECT 
    seller_state,
    ROUND(AVG(DATEDIFF(STR_TO_DATE(order_delivered_customer_date,
                            '%Y-%m-%d'),
                    STR_TO_DATE(order_purchase_timestamp, '%Y-%m-%d'))),
            2) AS Average_Delivery_Days
FROM
    orders o
        JOIN
    Order_items oi ON o.order_id = oi.order_id
        JOIN
    sellers s ON s.seller_id = oi.seller_id
GROUP BY seller_state;


#6. List the top 5 sellers based on total revenue earned.
SELECT 
    s.seller_id,
    s.seller_city,
    s.seller_state,
    ROUND(SUM(p.payment_value), 2) Revenue
FROM
    sellers s
        JOIN
    order_items oi ON oi.seller_id = s.seller_id
    join payments p on p.order_id = oi.order_id
GROUP BY s.seller_id,s.seller_city,
    s.seller_state
ORDER BY revenue DESC
LIMIT 5;

#7. Analyze the monthly revenue trend over the last 12 months 
# to track Walmart’s growth.
SELECT 
    DATE_FORMAT(o.order_purchase_timestamp, '%Y-%m') AS SalesMonth,
    ROUND(SUM(p.payment_value),2) AS MonthlyRevenue
FROM
    orders o
        JOIN
    payments p ON o.order_id = p.order_id
WHERE
    o.order_purchase_timestamp >= DATE_SUB((SELECT 
                MAX(order_purchase_timestamp)
            FROM
                orders),
        INTERVAL 12 MONTH)
GROUP BY SalesMonth
ORDER BY SalesMonth;
  
    
#8. Calculate the number of new unique customers acquired each month, based on customer_unique_id.   
    WITH cte AS (
    SELECT
        c.customer_unique_id,
        MIN(o.order_purchase_timestamp) AS FirstPurchaseDate
    FROM
        customers c
    JOIN
        orders o ON c.customer_id = o.customer_id
    GROUP BY
        c.customer_unique_id
)
SELECT
    DATE_FORMAT(FirstPurchaseDate, '%Y-%m') AS Acq_Month,
    COUNT(customer_unique_id) AS NewCustomers
FROM
    cte
GROUP BY
    Acq_Month
ORDER BY
    Acq_Month;
    
    
    
    
    
#9. Rank customers by lifetime spend within each customer state using SQL window functions.    
    WITH Cte AS (
    SELECT
        c.customer_unique_id,
        c.customer_state,
        SUM(p.payment_value) AS LifetimeSpend
    FROM
        customers c
    JOIN
        orders o ON c.customer_id = o.customer_id
    JOIN
        payments p ON o.order_id = p.order_id
    GROUP BY
        c.customer_unique_id, c.customer_state
)
SELECT
    customer_unique_id,
    customer_state,
    LifetimeSpend,
    DENSE_RANK() OVER (PARTITION BY customer_state ORDER BY LifetimeSpend DESC) AS Ranking
FROM
    Cte;
    
    
    
    
    #10. Compute the rolling 3-month average revenue trend, to visualize sales momentum.
    WITH MonthlyRevenue AS (
    SELECT
        DATE_FORMAT(o.order_purchase_timestamp, '%Y-%m') AS SalesMonth,
        SUM(p.payment_value) AS TotalRevenue
    FROM
        orders o
    JOIN
        payments p ON o.order_id = p.order_id
    GROUP BY
        SalesMonth
)
SELECT
    SalesMonth,
    TotalRevenue,
    AVG(TotalRevenue) OVER (ORDER BY SalesMonth ROWS BETWEEN 2 PRECEDING AND CURRENT ROW) AS Rolling3MonthAvg
FROM
    MonthlyRevenue
ORDER BY
    SalesMonth;



















