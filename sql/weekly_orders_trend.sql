WITH RECURSIVE dates(date) AS (
	SELECT MIN(STRFTIME('%Y-%m-%d',order_purchase_timestamp))
	FROM olist_orders_dataset
	UNION ALL
	SELECT date(date, '+1 day')
	FROM dates
	WHERE dates.date < (SELECT MAX(STRFTIME('%Y-%m-%d',order_purchase_timestamp))
						FROM olist_orders_dataset)
),
weeks AS (
	SELECT date AS week_start,
	DATE(date, '+6 day') AS week_end
	FROM dates
	WHERE STRFTIME('%w',date) = '0'
),
orders_table AS(
SELECT STRFTIME('%Y-%m-%d',order_purchase_timestamp) AS purchase_date,
COUNT(DISTINCT(order_id)) AS orders
FROM olist_orders_dataset
WHERE order_status != 'canceled'
GROUP BY 1
ORDER BY 1
)

SELECT weeks.week_start AS week,
COALESCE(SUM(orders_table.orders),0) AS total_orders
FROM weeks
LEFT JOIN orders_table ON orders_table.purchase_date BETWEEN weeks.week_start AND weeks.week_end
GROUP BY 1
ORDER BY 1;
