-- https://www.hackerrank.com/challenges/average-population-of-each-continent/problem?isFullScreen=true

SET NOCOUNT ON;

/*
Enter your query here.
Please append a semicolon ";" at the end of the query and enter your query in a single line to avoid error.
*/
select COUNTRY.Continent, floor(avg(CITY.Population)) from CITY join COUNTRY on CITY.CountryCode = COUNTRY.Code group by COUNTRY.Continent;
go