-- https://www.hackerrank.com/challenges/challenges/problem?isFullScreen=true

SET NOCOUNT ON;

/*
Enter your query here.
Please append a semicolon ";" at the end of the query and enter your query in a single line to avoid error.
*/
with counted_challenges as (
    select h.hacker_id, h.name, count(c.challenge_id) as cnt from Hackers h left join Challenges c on h.hacker_id = c.hacker_id group by h.hacker_id, h.name
),
agg_challenges as (
    select hacker_id, name, cnt, max(cnt) over () as max_total, count(*) over (partition by cnt) as count_total from counted_challenges
)
select hacker_id, name, cnt from agg_challenges where cnt = max_total or count_total = 1 order by cnt desc, hacker_id;
go
