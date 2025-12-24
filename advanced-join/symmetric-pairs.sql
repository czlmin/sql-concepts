-- https://www.hackerrank.com/challenges/symmetric-pairs/problem?isFullScreen=true

SET NOCOUNT ON;

/*
Enter your query here.
Please append a semicolon ";" at the end of the query and enter your query in a single line to avoid error.
*/
with marked as (
    select *,
    row_number() over (order by X) as rn from Functions
)
select distinct m1.X, m1.Y from marked m1 join marked m2 on m1.X = m2.Y and m1.Y = m2.X and m1.rn <> m2.rn where m1.X <= m1.Y order by m1.X;
go