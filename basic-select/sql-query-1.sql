-- https://www.hackerrank.com/challenges/revising-the-select-query/problem?isFullScreen=true

SET NOCOUNT ON;

/*
Enter your query here.
Please append a semicolon ";" at the end of the query and enter your query in a single line to avoid error.
*/
select * from CITY where population > 100000 and countrycode = 'USA';
go
