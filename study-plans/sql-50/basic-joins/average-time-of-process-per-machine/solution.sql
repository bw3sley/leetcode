/* Write your T-SQL query statement below */
WITH ProcessTimes AS (
    SELECT
        Activity.machine_id,
        Activity.process_id,

        MAX(CASE WHEN Activity.activity_type = 'end' THEN timestamp ELSE NULL END) - MIN (CASE WHEN Activity.activity_type = 'start' THEN timestamp ELSE NULL END) AS process_time

    FROM Activity

    GROUP BY
        Activity.machine_id,
        Activity.process_id
)

SELECT machine_id, ROUND(AVG(process_time), 3) AS processing_time FROM ProcessTimes GROUP BY ProcessTimes.machine_id