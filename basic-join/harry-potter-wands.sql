-- https://www.hackerrank.com/challenges/harry-potter-and-wands/problem?isFullScreen=true

SET NOCOUNT ON;

/*
Enter your query here.
Please append a semicolon ";" at the end of the query and enter your query in a single line to avoid error.
*/
with sorted_wands as (
    select *, row_number() over (partition by code, power order by coins_needed) as rn from Wands
)
select w.id, wp.age, w.coins_needed, w.power from sorted_wands w join Wands_Property wp on w.code = wp.code where wp.is_evil = 0 and w.rn = 1 order by w.power desc, wp.age desc;
go