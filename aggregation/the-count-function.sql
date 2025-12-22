-- https://www.hackerrank.com/challenges/revising-aggregations-the-count-function/problem?isFullScreen=true

SET NOCOUNT ON;

/*
Enter your query here.
Please append a semicolon ";" at the end of the query and enter your query in a single line to avoid error.
*/
select count(id) from CITY where Population > 100000;
go