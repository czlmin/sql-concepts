-- https://www.hackerrank.com/challenges/weather-observation-station-19/problem?isFullScreen=true

SET NOCOUNT ON;

/*
Enter your query here.
Please append a semicolon ";" at the end of the query and enter your query in a single line to avoid error.
*/
select cast(sqrt(power(min(lat_n)-max(lat_n), 2)+power(min(long_w)-max(long_w), 2)) as decimal(10,4)) from STATION;
go