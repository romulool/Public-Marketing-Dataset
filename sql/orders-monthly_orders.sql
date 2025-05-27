SELECT 	SUBSTR(DATE(order_purchase_timestamp, 'start of month'),1,7) 	AS purchase_month,
		COUNT(DISTINCT(order_id)) 										AS orders
FROM olist_orders_dataset
WHERE order_status != 'canceled'
GROUP BY 1
ORDER BY 1;
