SELECT COUNT(DISTINCT(order_id)) AS orders_last_30_days
FROM olist_orders_dataset
WHERE order_status != 'cancelled'
AND STRFTIME('%Y-%m-%d',order_purchase_timestamp) >= DATE({{Reference_date}}, '-30 day');