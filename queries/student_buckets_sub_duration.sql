USE customer_engagement;

with table_paid_duration as
(
SELECT 
    student_id,
    MIN(date_start) AS first_paid_day,
    IF(MAX(date_end) <= '2022-10-31',
        MAX(date_end),
        '2022-10-31') AS last_paid_day
FROM
    purchases_info
GROUP BY student_id
),
table_content_watched_1 as
(
SELECT 
    d.*, ROUND(SUM(l.minutes_watched), 2) AS total_minutes_watched
FROM
    table_paid_duration d
        JOIN
    student_learning l USING (student_id)
WHERE
    date_watched BETWEEN first_paid_day AND last_paid_day
GROUP BY d.student_id

UNION

SELECT 
    d.*, 0 AS total_minutes_watched
FROM
    table_paid_duration d
        LEFT JOIN
    student_learning l USING (student_id)
WHERE
    l.student_id IS NULL
),
table_content_watched_2 as
(
SELECT 
    *
FROM
    table_content_watched_1

UNION 

SELECT 
    d.*, 0 AS total_minutes_watched
FROM
    table_paid_duration d
        JOIN
    student_learning l USING (student_id)
WHERE
    date_watched NOT BETWEEN first_paid_day AND last_paid_day
        AND l.student_id NOT IN (SELECT 
            student_id
        FROM
            table_content_watched_1)
),
table_duration_in_days as
(
SELECT 
    *,
    DATEDIFF(last_paid_day, first_paid_day) AS difference_in_days
FROM
    table_content_watched_2
),
table_distribute_to_buckets as
(
SELECT 
    d.*,
    i.date_registered,
    CASE
        WHEN
            total_minutes_watched = 0
                OR total_minutes_watched IS NULL
        THEN
            '[0]'
        WHEN
            total_minutes_watched > 0
                AND total_minutes_watched <= 30
        THEN
            '(0, 30]'
        WHEN
            total_minutes_watched > 30
                AND total_minutes_watched <= 60
        THEN
            '(30, 60]'
        WHEN
            total_minutes_watched > 60
                AND total_minutes_watched <= 120
        THEN
            '(60, 120]'
        WHEN
            total_minutes_watched > 120
                AND total_minutes_watched <= 240
        THEN
            '(120, 240]'
        WHEN
            total_minutes_watched > 240
                AND total_minutes_watched <= 480
        THEN
            '(240, 480]'
        WHEN
            total_minutes_watched > 480
                AND total_minutes_watched <= 1000
        THEN
            '(480, 1000]'
        WHEN
            total_minutes_watched > 1000
                AND total_minutes_watched <= 2000
        THEN
            '(1000, 2000]'
        WHEN
            total_minutes_watched > 2000
                AND total_minutes_watched <= 3000
        THEN
            '(2000, 3000]'
        WHEN
            total_minutes_watched > 3000
                AND total_minutes_watched <= 4000
        THEN
            '(3000, 4000]'
        WHEN
            total_minutes_watched > 4000
                AND total_minutes_watched <= 6000
        THEN
            '(4000, 6000]'
        ELSE '6000+'
        END AS user_buckets
FROM
    table_duration_in_days d
    join
    student_info i
    using(student_id)
)
SELECT 
    student_id,
    date_registered,
    total_minutes_watched,
    difference_in_days AS num_paid_days,
    user_buckets AS 'buckets'
FROM
    table_distribute_to_buckets;
