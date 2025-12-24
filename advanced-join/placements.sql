-- https://www.hackerrank.com/challenges/placements/problem?isFullScreen=true

SET NOCOUNT ON;

/*
Enter your query here.
Please append a semicolon ";" at the end of the query and enter your query in a single line to avoid error.
*/
with s_salary as (
    select s.id, s.name, p.salary from Students s join Packages p on s.id = p.id
),
f_salary as (
    select f.id, p.salary from Friends f join Packages p on f.friend_id = p.id
)
select s.name from s_salary s join f_salary f on s.id = f.id where f.salary > s.salary order by f.salary;
go