-- https://www.hackerrank.com/challenges/african-cities/problem?isFullScreen=true

SET NOCOUNT ON;

/*
Enter your query here.
Please append a semicolon ";" at the end of the query and enter your query in a single line to avoid error.
*/
select CITY.Name from CITY join COUNTRY on CITY.CountryCode = COUNTRY.Code where COUNTRY.Continent = 'Africa';
go