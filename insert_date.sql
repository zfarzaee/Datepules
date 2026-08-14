(3, 3500000, 'Online', 'pending', 'TXN1003'),
(4, 675000, 'Card', 'completed', 'TXN1004'),
(5, 1200000, 'Online', 'completed', 'TXN1005'),
(6, 617500, 'Card', 'completed', 'TXN1006'),
(7, 900000, 'Online', 'pending', 'TXN1007'),
(8, 2520000, 'Card', 'completed', 'TXN1008'),
(9, 450000, 'Online', 'completed', 'TXN1009'),
(10, 807500, 'Card', 'completed', 'TXN1010');

INSERT INTO invoices
(order_id, invoice_number, total_amount)
VALUES
(1, 'INV1001', 45000000),
(2, 'INV1002', 850000),
(3, 'INV1003', 3500000),
(4, 'INV1004', 750000),
(5, 'INV1005', 1200000),
(6, 'INV1006', 650000),
(7, 'INV1007', 900000),
(8, 'INV1008', 2800000),
(9, 'INV1009', 450000),
(10, 'INV1010', 850000);

INSERT INTO sessions
(user_id, start_time, end_time, device, browser, ip_address)
VALUES
(1, '2026-08-01 09:00:00', '2026-08-01 09:30:00', 'iPhone', 'Safari', '192.168.1.1'),
(2, '2026-08-01 10:00:00', '2026-08-01 10:25:00', 'Android', 'Chrome', '192.168.1.2'),
(3, '2026-08-02 11:00:00', '2026-08-02 11:40:00', 'Laptop', 'Chrome', '192.168.1.3'),
(4, '2026-08-02 12:00:00', '2026-08-02 12:20:00', 'iPhone', 'Safari', '192.168.1.4'),
(5, '2026-08-03 13:00:00', '2026-08-03 13:35:00', 'Laptop', 'Firefox', '192.168.1.5'),
(6, '2026-08-03 14:00:00', '2026-08-03 14:15:00', 'Android', 'Chrome', '192.168.1.6'),
(7, '2026-08-04 15:00:00', '2026-08-04 15:30:00', 'Laptop', 'Edge', '192.168.1.7'),
(8, '2026-08-04 16:00:00', '2026-08-04 16:45:00', 'iPhone', 'Safari', '192.168.1.8'),
(9, '2026-08-05 17:00:00', '2026-08-05 17:25:00', 'Android', 'Chrome', '192.168.1.9'),
(10, '2026-08-05 18:00:00', '2026-08-05 18:30:00', 'Laptop', 'Firefox', '192.168.1.10');

INSERT INTO reviews
(user_id, product_id, rating, review_text)
VALUES
(1, 1, 5, 'Excellent product'),
(2, 2, 4, 'Good quality'),
(3, 3, 5, 'Works very well'),
(4, 4, 4, 'Very useful book'),
(5, 5, 5, 'Great product'),
(6, 6, 4, 'Good quality'),
(7, 7, 5, 'Very fun'),
(8, 8, 4, 'Good controller'),
(9, 9, 5, 'Great taste'),
(10, 10, 5, 'My cat likes it');

INSERT INTO clicks
(session_id, product_id, action_type, referrer)
VALUES
(1, 1, 'view', 'Google'),
(2, 2, 'click', 'Instagram'),
(3, 3, 'view', 'Google'),
(4, 4, 'cart', 'Direct'),
(5, 5, 'view', 'Google'),
(6, 6, 'click', 'Instagram'),
(7, 7, 'cart', 'Direct'),
(8, 8, 'view', 'Google'),
(9, 9, 'click', 'Facebook'),
(10, 10, 'purchase', 'Direct');