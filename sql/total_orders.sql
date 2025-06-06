SELECT COUNT(DISTINCT(order_id)) AS total_orders
FROM olist_orders_dataset
WHERE order_status != 'cancelled'
AND order_purchase_timestamp <= {{Reference_date}};