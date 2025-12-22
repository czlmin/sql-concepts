-- https://www.hackerrank.com/challenges/weather-observation-station-2/problem?isFullScreen=true

SET NOCOUNT ON;

/*
Enter your query here.
Please append a semicolon ";" at the end of the query and enter your query in a single line to avoid error.
*/
select round(cast(sum(LAT_N) as decimal(10,2)), 2), round(cast(sum(LONG_W) as decimal(10,2)), 2) from STATION;
go