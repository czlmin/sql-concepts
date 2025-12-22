-- https://www.hackerrank.com/challenges/the-blunder/problem?isFullScreen=true

SET NOCOUNT ON;

/*
Enter your query here.
Please append a semicolon ";" at the end of the query and enter your query in a single line to avoid error.
*/
select avg(salary) - avg(cast(replace(cast(salary as varchar), '0', '') as int)) from EMPLOYEES;
go