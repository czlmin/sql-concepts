-- https://www.hackerrank.com/challenges/weather-observation-station-18/problem?isFullScreen=true

SET NOCOUNT ON;

/*
Enter your query here.
Please append a semicolon ";" at the end of the query and enter your query in a single line to avoid error.
*/
select cast(abs(min(lat_n)-max(lat_n))+abs(min(long_w)-max(long_w)) as decimal(10,4)) from STATION;
go