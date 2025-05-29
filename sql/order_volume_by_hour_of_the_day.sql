SELECT CAST(STRFTIME('%H',order_purchase_timestamp) AS INT) AS purchase_hour,
COUNT(*) AS number_of_orders
FROM olist_orders_dataset
WHERE order_status != 'cancelled'
GROUP BY 1
ORDER BY 1;