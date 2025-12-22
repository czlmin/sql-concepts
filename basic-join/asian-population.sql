-- https://www.hackerrank.com/challenges/asian-population/problem?isFullScreen=true

SET NOCOUNT ON;

/*
Enter your query here.
Please append a semicolon ";" at the end of the query and enter your query in a single line to avoid error.
*/
select sum(CITY.Population) from CITY join COUNTRY on CITY.CountryCode = COUNTRY.Code where COUNTRY.Continent = 'Asia';
go