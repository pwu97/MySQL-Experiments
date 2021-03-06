CREATE TABLE total_trans (
    order_id int,
    user_id int,
    product_id varchar(500),
    spend float,
    trans_date datetime
);

INSERT INTO total_trans (order_id, user_id, product_id, spend, trans_date)
VALUES 
    # User 1
    (1, 1, 1, 0.62, "2022-03-14"),
    (3, 1, 2, 113.12, "2022-03-15"),
    (4, 1, 2, 4.23, "2022-03-16"),
    (5, 1, 2, 54.22, "2022-03-17"),
    # User 2
    (6, 2, 2, 4.23, "2022-03-16"),
    (7, 2, 1, 222.22, "2022-03-13"),
    (8, 2, 1, 5.55, "2022-03-15"),
    (9, 2, 1, 2.11, "2022-03-16"),
    (10, 2, 2, 6.42, "2022-03-17"),
    # User 3
    (11, 3, 1, 10.11, "2022-03-14");
    
SELECT
    product_id,
    trans_date,
    SUM(spend) OVER (
        PARTITION BY 
            product_id
        ORDER BY 
            trans_date ASC
    ) AS cum_spend
FROM
    total_trans
ORDER BY
    product_id,
    trans_date ASC;
    
/*
+------------+---------------------+--------------------+
| product_id | trans_date          | cum_spend          |
+------------+---------------------+--------------------+
| 1          | 2022-03-13 00:00:00 | 222.22000122070312 |
| 1          | 2022-03-14 00:00:00 | 232.95000088214874 |
| 1          | 2022-03-14 00:00:00 | 232.95000088214874 |
| 1          | 2022-03-15 00:00:00 |  238.5000010728836 |
| 1          | 2022-03-16 00:00:00 | 240.61000096797943 |
| 2          | 2022-03-15 00:00:00 | 113.12000274658203 |
| 2          | 2022-03-16 00:00:00 |   121.580002784729 |
| 2          | 2022-03-16 00:00:00 |   121.580002784729 |
| 2          | 2022-03-17 00:00:00 | 182.22000408172607 |
| 2          | 2022-03-17 00:00:00 | 182.22000408172607 |
+------------+---------------------+--------------------+
10 rows in set (0.00 sec)
*/