-- Query 1: Analyze sales by store
SELECT
    s.store_name,
    COUNT(DISTINCT o.order_id) AS total_orders,
    SUM(o.total_amount) AS total_sales
FROM stores s
JOIN orders o ON s.store_id = o.store_id
JOIN users u ON o.user_id = u.user_id
GROUP BY s.store_id, s.store_name
ORDER BY total_sales DESC;


-- Query 2: Detailed sales analysis
SELECT
    s.store_name,
    COUNT(DISTINCT o.order_id) AS total_orders,
    COUNT(oi.order_item_id) AS total_items,
    SUM(oi.quantity) AS total_quantity,
    SUM(oi.quantity * oi.unit_price) AS gross_sales
FROM stores s
JOIN orders o ON s.store_id = o.store_id
JOIN order_items oi ON o.order_id = oi.order_id
JOIN products p ON oi.product_id = p.product_id
GROUP BY s.store_id, s.store_name
ORDER BY gross_sales DESC;