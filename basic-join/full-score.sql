-- https://www.hackerrank.com/challenges/full-score/problem?isFullScreen=true

SET NOCOUNT ON;

/*
Enter your query here.
Please append a semicolon ";" at the end of the query and enter your query in a single line to avoid error.
*/
select s.hacker_id, h.name from Submissions s join Challenges c on s.challenge_id = c.challenge_id join Difficulty d on c.difficulty_level = d.difficulty_level join Hackers h on s.hacker_id = h.hacker_id where s.score = d.score group by s.hacker_id, h.name having count(s.challenge_id) > 1 order by count(s.challenge_id) desc, s.hacker_id;
go