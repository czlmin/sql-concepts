-- https://www.hackerrank.com/challenges/draw-the-triangle-1/problem?isFullScreen=true

SET NOCOUNT ON;

/*
Enter your query here.
Please append a semicolon ";" at the end of the query and enter your query in a single line to avoid error.
*/
with nums as (
    select 1 as star
    union all
    select star+1 from nums
    where star < 20
)
select replicate('* ', star) from nums order by star desc;
go