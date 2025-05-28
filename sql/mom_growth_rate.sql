WITH mo AS
    (SELECT *
	FROM {{#38-monthly-orders}}) -- this is the reference that Metabase set to the monthly orders query
SELECT purchase_month,
(CAST(orders AS FLOAT)/LAG(orders) OVER(ORDER BY purchase_month) - 1) AS percent_change -- decimal format; may be set as percentage inside Metabase
FROM mo;