-- https://www.hackerrank.com/challenges/weather-observation-station-20/problem?isFullScreen=true

SET NOCOUNT ON;

/*
Enter your query here.
Please append a semicolon ";" at the end of the query and enter your query in a single line to avoid error.
*/
with ordered_lat_n as (
    select lat_n,
    row_number() over (order by lat_n) as lat_n_asc,
    row_number() over (order by lat_n desc) as lat_n_desc
    from STATION
)
select cast(lat_n as decimal(10, 4)) from ordered_lat_n
where lat_n_asc in (lat_n_desc, lat_n_desc-1, lat_n_desc+1);
go