SELECT COUNT(DISTINCT(order_id)) AS orders_last_30_days
FROM olist_orders_dataset
WHERE order_status != 'cancelled'
AND STRFTIME('%Y-%m-%d',order_purchase_timestamp) >= DATE(CURRENT_DATE, '-30 day');