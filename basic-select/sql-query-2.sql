-- http://hackerrank.com/challenges/revising-the-select-query-2/problem?isFullScreen=true

SET NOCOUNT ON;

/*
Enter your query here.
Please append a semicolon ";" at the end of the query and enter your query in a single line to avoid error.
*/
select name from CITY where population > 120000 and countrycode = 'USA';
go