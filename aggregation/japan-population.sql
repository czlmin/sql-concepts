-- https://www.hackerrank.com/challenges/japan-population/problem?isFullScreen=true

SET NOCOUNT ON;

/*
Enter your query here.
Please append a semicolon ";" at the end of the query and enter your query in a single line to avoid error.
*/
select sum(Population) from CITY where countrycode = 'JPN';
go