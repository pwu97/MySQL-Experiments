# This file tests some MySQL functions out

# Create table
CREATE TABLE total_trans (
    order_id int,
    user_id int,
    product_id varchar(500),
    spend float,
    trans_date datetime
);

# Insert toy data into this table
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


# Test the CAST function
SELECT 
    CAST(trans_date AS DATE) AS trans_date_cast
FROM 
    total_trans;
    
# Window functions (AVG)
SELECT 
    *,
    AVG(spend) OVER() AS avg_spend
FROM 
    total_trans;
   
# Window functions (AVG and PARTITION BY)
SELECT 
    *,
    AVG(spend) OVER(PARTITION BY user_id) AS avg_spend_by_id
FROM 
    total_trans
ORDER BY
    user_id ASC;
    
