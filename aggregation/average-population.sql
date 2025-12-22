-- https://www.hackerrank.com/challenges/average-population/problem?isFullScreen=true

SET NOCOUNT ON;

/*
Enter your query here.
Please append a semicolon ";" at the end of the query and enter your query in a single line to avoid error.
*/
select cast(round(avg(Population), 0) as int) from CITY;

go