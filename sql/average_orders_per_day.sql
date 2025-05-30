WITH orders_per_day AS(
	SELECT STRFTIME('%Y-%m-%d',ood.order_purchase_timestamp) AS purchase_date,
	COUNT(*) AS number_of_orders
	FROM olist_orders_dataset ood
	WHERE ood.order_status != 'cancelled'
	GROUP BY 1
	ORDER BY 1
)

SELECT COALESCE(AVG(number_of_orders),0) AS average_orders
FROM orders_per_day
WHERE purchase_date >= DATE(CURRENT_DATE, '-90 day');