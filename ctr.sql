CREATE TABLE events (
    app_id int,
    event_id varchar(255),
    timestamp datetime
);

INSERT INTO events (app_id, event_id, timestamp)
VALUES
    (1, 'click', '2022-05-11'),
    (1, 'impression', '2022-05-11'),
    (1, 'impression', '2022-05-11'),
    (2, 'click', '2022-05-09'),
    (2, 'impression', '2022-05-11'),
    (3, 'impression', '2022-05-11'),
    (3, 'impression', '2022-05-11'),
    (4, 'impression', '2022-05-11'),
    (4, 'click', '2022-05-11'),
    (5, 'click', '2022-05-11'),
    (5, 'click', '2022-05-11'),
    (5, 'click', '2022-05-11'),
    (5, 'click', '2022-05-11'),
    (5, 'impression', '2022-05-11'),
    (5, 'impression', '2022-05-11'),
    (5, 'impression', '2022-05-11'),
    (5, 'impression', '2022-05-11'),
    (5, 'impression', '2022-05-11');
    
SELECT 
    app_id,
    SUM(IF(event_id = 'click', 1, 0)) / SUM(IF(event_id = 'impression', 1, 0)) AS ctr
FROM
    events
GROUP BY
    1;
    
/*
+--------+--------+
| app_id | ctr    |
+--------+--------+
|      1 | 0.5000 |
|      2 | 1.0000 |
|      3 | 0.0000 |
|      4 | 1.0000 |
|      5 | 0.8000 |
+--------+--------+
5 rows in set (0.00 sec)
*/

SELECT 
    app_id,
    SUM(CASE 
            WHEN event_id = 'click' THEN 1 
            ELSE 0 
    END) / 
    SUM(CASE WHEN event_id = 'impression' THEN 1 
            ELSE 0 
    END) AS ctr
FROM
    events
GROUP BY
    1;
    
/*
+--------+--------+
| app_id | ctr    |
+--------+--------+
|      1 | 0.5000 |
|      2 | 1.0000 |
|      3 | 0.0000 |
|      4 | 1.0000 |
|      5 | 0.8000 |
+--------+--------+
5 rows in set (0.00 sec)
*/