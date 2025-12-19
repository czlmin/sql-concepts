-- https://www.hackerrank.com/challenges/occupations/problem?isFullScreen=true

WITH src AS (
    SELECT
        Name,
        Occupation,
        ROW_NUMBER() OVER (
            PARTITION BY Occupation
            ORDER BY Name
        ) AS rn
    FROM OCCUPATIONS
)
SELECT
    [Doctor],
    [Professor],
    [Singer],
    [Actor]
FROM src
PIVOT (
    MAX(Name) FOR Occupation IN ([Doctor], [Professor], [Singer], [Actor])
) p
ORDER BY rn;
