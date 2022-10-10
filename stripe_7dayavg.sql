CREATE TABLE user_transactions (
    transaction_id int,
    user_id int,
    amount float,
    transaction_date datetime
);

INSERT INTO user_transactions (transaction_id, user_id, amount, transaction_date)
VALUES
    (1, 1, 1, '2021-01-01 15:10:10'),
    (2, 1, 1, '2021-01-01 15:10:10'),
    (3, 1, 1, '2021-01-02 15:10:10'),
    (4, 1, 1, '2021-01-02 15:10:10'),
    (5, 1, 1, '2021-01-03 15:10:10'),
    (6, 1, 1, '2021-01-03 15:10:10'),
    (7, 1, 1, '2021-01-04 15:10:10'),
    (2, 1, 1, '2021-01-05 15:10:10'),
    (3, 1, 1, '2021-01-05 15:10:10'),
    (4, 1, 1, '2021-01-06 15:10:10'),
    (5, 1, 1, '2021-01-07 15:10:10'),
    (6, 1, 1, '2021-01-08 15:10:10'),
    (7, 1, 1, '2021-01-08 15:10:10'),
    (2, 1, 1, '2021-01-08 15:10:10'),
    (3, 1, 1, '2021-01-09 15:10:10'),
    (4, 1, 1, '2021-01-10 15:10:10'),
    (5, 1, 1, '2021-01-10 15:10:10'),
    (6, 1, 1, '2021-01-11 15:10:10'),
    (7, 1, 1, '2021-01-12 15:10:10'),
    (2, 1, 1, '2021-01-13 15:10:10'),
    (3, 1, 1, '2021-01-14 15:10:10'),
    (4, 1, 1, '2021-01-14 15:10:10'),
    (5, 1, 1, '2021-01-15 15:10:10'),
    (6, 1, 1, '2021-01-16 15:10:10');
    
WITH daily_transactions AS (
    SELECT 
        CAST(transaction_date AS DATE) AS transaction_date,
        SUM(amount) AS total_amount
    FROM
        user_transactions
    GROUP BY
        transaction_date
)

/*
SELECT 
    transaction_date,
    total_amount,
    LAG(total_amount, 7) OVER (
        ORDER BY transaction_date
    ) AS prev_week_amount
FROM
    daily_transactions;
*/

SELECT 
    transaction_date,
    total_amount,
    AVG(total_amount) OVER (
        ORDER BY transaction_date
        ROWS BETWEEN 6 PRECEDING AND CURRENT ROW
    ) AS weekly_rolling_avg
FROM
    daily_transactions;
    
/*
+------------------+--------------+--------------------+
| transaction_date | total_amount | weekly_rolling_avg |
+------------------+--------------+--------------------+
| 2021-01-01       |            2 |                  2 |
| 2021-01-02       |            2 |                  2 |
| 2021-01-03       |            2 |                  2 |
| 2021-01-04       |            1 |               1.75 |
| 2021-01-05       |            2 |                1.8 |
| 2021-01-06       |            1 | 1.6666666666666667 |
| 2021-01-07       |            1 | 1.5714285714285714 |
| 2021-01-08       |            3 | 1.7142857142857142 |
| 2021-01-09       |            1 | 1.5714285714285714 |
| 2021-01-10       |            2 | 1.5714285714285714 |
| 2021-01-11       |            1 | 1.5714285714285714 |
| 2021-01-12       |            1 | 1.4285714285714286 |
| 2021-01-13       |            1 | 1.4285714285714286 |
| 2021-01-14       |            2 | 1.5714285714285714 |
| 2021-01-15       |            1 | 1.2857142857142858 |
| 2021-01-16       |            1 | 1.2857142857142858 |
+------------------+--------------+--------------------+
16 rows in set, 1 warning (0.00 sec)
*/
