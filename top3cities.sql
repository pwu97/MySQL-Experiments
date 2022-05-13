CREATE TABLE trades (
    order_id int,
    user_id int,
    price float,
    quantity int,
    status varchar(500),
    timestamp datetime
);

CREATE TABLE users (
    user_id int,
    city varchar(500),
    email varchar(500),
    signup_date datetime
);

INSERT INTO trades (order_id, user_id, price, quantity, status, timestamp)
VALUES
    (1, 1, 54.32, 2, "complete", "2022-04-22"),
    (2, 1, 12.22, 1, "complete", "2022-04-22"),
    (3, 2, 0.61, 5, "complete", "2022-04-22"),
    (4, 2, 131.44, 11, "complete", "2022-04-22"),
    (5, 3, 4.53, 3, "complete", "2022-04-22"),
    (11, 3, 4.53, 3, "complete", "2022-04-22"),
    (6, 3, 4.51, 3, "cancelled", "2022-04-22"),
    (7, 4, 100.43, 5, "complete", "2022-04-22"),
    (8, 5, 0.34, 5, "complete", "2022-04-22");
    
INSERT INTO users (user_id, city, email, signup_date) 
VALUES
    (1, "Boston", "user1@email.com", "2022-01-15"),
    (2, "Durham", "user2@email.com", "2022-01-17"),
    (3, "Berkeley", "user3@email.com", "2022-05-17"),
    (4, "Berkeley", "user4@email.com", "2022-05-17"),
    (5, "San Francisco", "user5@email.com", "2022-05-17");
    
SELECT
    u.city,
    COUNT(DISTINCT(order_id)) AS num_orders
FROM
    trades AS t
    JOIN users AS u ON t.user_id = u.user_id
WHERE
    t.status = "complete"
GROUP BY
    u.city
ORDER BY
    num_orders DESC
LIMIT 
    3;
    
/*
+----------+------------+
| city     | num_orders |
+----------+------------+
| Berkeley |          3 |
| Boston   |          2 |
| Durham   |          2 |
+----------+------------+
3 rows in set (0.00 sec)
*/

