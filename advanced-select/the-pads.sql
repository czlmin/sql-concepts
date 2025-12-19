-- https://www.hackerrank.com/challenges/the-pads/problem?isFullScreen=true

SET NOCOUNT ON;

/*
Enter your query here.
Please append a semicolon ";" at the end of the query and enter your query in a single line to avoid error.
*/
select Name + '(' + LEFT(Occupation, 1) + ')' from OCCUPATIONS order by Name;
select 'There are a total of ' + cast(count(*) as varchar) + ' ' + lower(Occupation) + 's.' from OCCUPATIONS group by Occupation order by count(*), Occupation;
go