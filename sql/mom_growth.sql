WITH orders_per_day AS (
	SELECT STRFTIME('%Y-%m-%d',order_purchase_timestamp) AS purchase_date,
	COUNT(DISTINCT(order_id)) AS number_of_orders
	FROM olist_orders_dataset
	WHERE order_status != 'cancelled'
	GROUP BY 1
	ORDER BY 1
),
	
orders_last_60_days AS(
	SELECT number_of_orders,
	CASE WHEN purchase_date BETWEEN DATE(CURRENT_DATE, '-60 day') AND DATE(CURRENT_DATE, '-30 day') THEN 1
		WHEN purchase_date BETWEEN DATE(CURRENT_DATE, '-30 day') AND CURRENT_DATE THEN 0 
		ELSE 2 END AS previous_month
	FROM orders_per_day
)

SELECT CASE WHEN SUM(CASE WHEN previous_month == 1 THEN number_of_orders ELSE 0 END) = 0 THEN 0
		ELSE CAST(SUM(CASE WHEN previous_month == 0 THEN number_of_orders
						ELSE 0 END) AS FLOAT)/SUM(CASE WHEN previous_month == 1 THEN number_of_orders
													ELSE 0 END) - 1 END AS teste
FROM orders_last_60_days;