SELECT STRFTIME('%Y-%m',order_purchase_timestamp) 	AS purchase_month,
COUNT(DISTINCT(order_id))							AS orders
FROM olist_orders_dataset
WHERE order_status != 'canceled'
AND order_purchase_timestamp <= {{Reference_date}}
GROUP BY 1
ORDER BY 1;
