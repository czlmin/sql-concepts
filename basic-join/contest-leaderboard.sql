-- https://www.hackerrank.com/challenges/contest-leaderboard/problem?isFullScreen=true

SET NOCOUNT ON;

/*
Enter your query here.
Please append a semicolon ";" at the end of the query and enter your query in a single line to avoid error.
*/
with max_score_hacker as (
    select hacker_id, challenge_id, max(score) as max_score from Submissions group by hacker_id, challenge_id
)
select h.hacker_id, h.name, sum(max_score) from Hackers h join max_score_hacker msh on h.hacker_id = msh.hacker_id where max_score > 0 group by h.hacker_id, h.name order by sum(max_score) desc, h.hacker_id;
go