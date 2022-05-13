CREATE TABLE viewership (
    user_id int,
    device_type varchar(500),
    view_time datetime
);

INSERT INTO viewership (user_id, device_type, view_time)
VALUES 
    (1, "laptop", "2022-02-11"),
    (1, "tablet", "2022-02-11"),
    (1, "phone", "2022-02-11"),
    (2, "laptop", "2022-02-11"),
    (2, "laptop", "2022-02-11"),
    (2, "laptop", "2022-02-11"),
    (2, "laptop", "2022-02-11"),
    (2, "tablet", "2022-02-11"),
    (2, "phone", "2022-02-11"),
    (2, "phone", "2022-02-11"),
    (3, "laptop", "2022-02-11"),
    (3, "laptop", "2022-02-11"),
    (3, "laptop", "2022-02-11"),
    (4, "laptop", "2022-02-11"),
    (4, "tablet", "2022-02-11"),
    (5, "phone", "2022-02-11"),
    (6, "phone", "2022-02-11"),
    (7, "laptop", "2022-02-11"),
    (7, "tablet", "2022-02-11"),
    (7, "phone", "2022-02-11"),
    (8, "laptop", "2022-02-11"),
    (8, "tablet", "2022-02-11"),
    (9, "phone", "2022-02-11");
    
SELECT
    SUM(IF(device_type IN ("tablet", "phone"), 1, 0)) AS mobile_cnt,
    SUM(IF(device_type = "laptop", 1, 0)) AS laptop_cnt
FROM
    viewership;
    
/*
+------------+------------+
| mobile_cnt | laptop_cnt |
+------------+------------+
|         12 |         11 |
+------------+------------+
1 row in set (0.00 sec)
*/