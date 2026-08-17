SELECT
    u.name,
    o.order_id,
    o.total_amount,
    RANK() OVER (
        ORDER BY o.total_amount DESC
    ) AS sales_rank
FROM users u
JOIN orders o ON u.user_id = o.user_id
ORDER BY sales_rank;

SELECT
    s.store_name,
    o.order_id,
    o.total_amount,
    ROW_NUMBER() OVER (
        PARTITION BY s.store_id
        ORDER BY o.total_amount DESC
    ) AS order_number
FROM stores s
JOIN orders o ON s.store_id = o.store_id
ORDER BY s.store_name, order_number;

SELECT
    s.store_name,
    o.order_id,
    o.total_amount,
    SUM(o.total_amount) OVER (
        ORDER BY o.total_amount DESC
    ) AS cumulative_sales
FROM stores s
JOIN orders o ON s.store_id = o.store_id
ORDER BY o.total_amount DESC;


SELECT
    u.name,
    o.order_id,
    o.total_amount,
    ROUND(AVG(o.total_amount) OVER (), 2) AS average_order,
    ROUND(o.total_amount - AVG(o.total_amount) OVER (), 2) AS difference_from_average
FROM users u
JOIN orders o ON u.user_id = o.user_id
ORDER BY o.total_amount DESC;

SELECT
    o.order_id,
    o.total_amount,
    LAG(o.total_amount) OVER (
        ORDER BY o.order_id
    ) AS previous_order_amount,
    o.total_amount -
    LAG(o.total_amount) OVER (
        ORDER BY o.order_id
    ) AS difference
FROM orders o
ORDER BY o.order_id;

WITH store_sales AS (
    SELECT
        store_id,
        SUM(total_amount) AS total_sales
    FROM orders
    GROUP BY store_id
)
SELECT
    s.store_name,
    ss.total_sales
FROM store_sales ss
JOIN stores s ON ss.store_id = s.store_id
ORDER BY ss.total_sales DESC;



WITH customer_orders AS (
    SELECT
        user_id,
        COUNT(order_id) AS order_count,
        SUM(total_amount) AS total_spent
    FROM orders
    GROUP BY user_id
)
SELECT
    u.name,
    co.order_count,
    co.total_spent
FROM customer_orders co
JOIN users u ON co.user_id = u.user_id
ORDER BY co.total_spent DESC;


WITH product_sales AS (
    SELECT
        product_id,
        SUM(quantity * unit_price) AS total_sales
    FROM order_items
    GROUP BY product_id
)
SELECT
    p.product_name,
    ps.total_sales
FROM product_sales ps
JOIN products p ON ps.product_id = p.product_id
ORDER BY ps.total_sales DESC;


SELECT
    s.store_name,
    o.status,
    COUNT(o.order_id) AS total_orders,
    SUM(o.total_amount) AS total_sales
FROM stores s
JOIN orders o ON s.store_id = o.store_id
GROUP BY ROLLUP (s.store_name, o.status)
ORDER BY s.store_name, o.status;

EXPLAIN ANALYZE
SELECT
    s.store_name,
    COUNT(DISTINCT o.order_id) AS total_orders,
    SUM(o.total_amount) AS total_sales
FROM stores s
JOIN orders o ON s.store_id = o.store_id
JOIN users u ON o.user_id = u.user_id
GROUP BY s.store_id, s.store_name
ORDER BY total_sales DESC;