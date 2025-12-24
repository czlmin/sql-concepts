-- https://www.hackerrank.com/challenges/sql-projects/problem?isFullScreen=true

SET NOCOUNT ON;

/*
Enter your query here.
Please append a semicolon ";" at the end of the query and enter your query in a single line to avoid error.
*/
WITH ordered AS (
    SELECT
        Task_ID,
        Start_Date,
        End_Date,
        CASE
            WHEN LAG(End_Date) OVER (ORDER BY Start_Date) = Start_Date
                THEN 0
            ELSE 1
        END AS new_project_flag
    FROM Projects
),
grp AS (
    SELECT
        Task_ID,
        Start_Date,
        End_Date,
        SUM(new_project_flag) OVER (ORDER BY Start_Date) AS project_group
    FROM ordered
)
SELECT
    MIN(Start_Date) AS Start_Date,
    MAX(End_Date)   AS End_Date
FROM grp
GROUP BY project_group
ORDER BY
    DATEDIFF(DAY, MIN(Start_Date), MAX(End_Date)) ASC,
    MIN(Start_Date) ASC;
go
