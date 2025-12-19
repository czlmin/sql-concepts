-- https://www.hackerrank.com/challenges/japanese-cities-name/problem?isFullScreen=true

SET NOCOUNT ON;

/*
Enter your query here.
Please append a semicolon ";" at the end of the query and enter your query in a single line to avoid error.
*/
SELECT NAME FROM CITY WHERE COUNTRYCODE = 'JPN';
go