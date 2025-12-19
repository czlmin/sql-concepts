-- https://www.hackerrank.com/challenges/weather-observation-station-10/problem?isFullScreen=true

SET NOCOUNT ON;

/*
Enter your query here.
Please append a semicolon ";" at the end of the query and enter your query in a single line to avoid error.
*/
SELECT DISTINCT CITY FROM STATION WHERE RIGHT(CITY, 1) not in ('a', 'e', 'i', 'o', 'u');
go