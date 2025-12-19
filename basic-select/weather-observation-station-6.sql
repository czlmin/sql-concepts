-- https://www.hackerrank.com/challenges/weather-observation-station-6/problem?isFullScreen=true

SET NOCOUNT ON;

/*
Enter your query here.
Please append a semicolon ";" at the end of the query and enter your query in a single line to avoid error.
*/
--SELECT DISTINCT CITY FROM STATION WHERE substring(CITY, 1, 1) in ('a', 'e', 'i', 'o', 'u');
SELECT DISTINCT CITY FROM STATION WHERE LEFT(CITY, 1) in ('a', 'e', 'i', 'o', 'u');
go