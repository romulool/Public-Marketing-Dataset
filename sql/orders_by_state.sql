SELECT ocd.customer_state AS customer_state,
COUNT(*) AS number_of_orders
FROM olist_orders_dataset ood
LEFT JOIN olist_customers_dataset ocd ON ocd.customer_id = ood.customer_id
WHERE ood.order_status != 'cancelled'
AND ood.order_purchase_timestamp <= {{Reference_date}}
GROUP BY 1
ORDER BY 2 DESC;