SELECT STRFTIME('%Y-%m-%d',order_purchase_timestamp) AS purchase_date,
COUNT(*) AS number_of_orders
FROM olist_orders_dataset
GROUP BY 1
ORDER BY 2 DESC
LIMIT 5;