-- https://www.hackerrank.com/challenges/weather-observation-station-15/problem?isFullScreen=true

SET NOCOUNT ON;

/*
Enter your query here.
Please append a semicolon ";" at the end of the query and enter your query in a single line to avoid error.
*/
select top 1 cast(long_w as decimal(10,4)) from STATION where lat_n < 137.2345 order by lat_n desc;
go