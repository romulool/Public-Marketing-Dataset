WITH categories AS(
	SELECT oprod.product_id AS product_id,
	pcnt.product_category_name_english AS product_category
	FROM olist_products_dataset oprod
	LEFT JOIN product_category_name_translation pcnt ON pcnt.product_category_name = oprod.product_category_name
),
product_and_order AS(
	SELECT ooid.order_id AS order_id,
	ooid.product_id AS product_id,
	ooid.price AS item_revenue,
	COALESCE(cat.product_category,'others') AS product_category
	FROM olist_order_items_dataset ooid
	LEFT JOIN categories cat ON cat.product_id = ooid.product_id
)

SELECT pando.product_category AS product_category,
SUM(item_revenue) AS category_revenue
FROM product_and_order pando
LEFT JOIN olist_orders_dataset oordd ON oordd.order_id = pando.order_id
WHERE oordd.order_status != 'cancelled'
AND oordd.order_purchase_timestamp <= {{Reference_date}}
GROUP BY 1
ORDER BY 2 DESC;