-- https://www.hackerrank.com/challenges/weather-observation-station-2/problem?isFullScreen=true

SET NOCOUNT ON;

/*
Enter your query here.
Please append a semicolon ";" at the end of the query and enter your query in a single line to avoid error.
*/
--select round(cast(sum(LAT_N) as decimal(10,2)), 2), round(cast(sum(LONG_W) as decimal(10,2)), 2) from STATION;

select cast(sum(LAT_N) as decimal(10,2)), cast(sum(LONG_W) as decimal(10,2)) from STATION;
go

/*
The expression  in T-SQL performs two operations: it calculates the sum of all values in the  column and then converts that sum into a specific numeric data type. [1, 2]
Here is a breakdown of what each part means:

• : This aggregate function calculates the total sum of all the values in the column named .
• : This function is used to convert the result of the  operation from its original data type (likely a  or another numeric type) into the specified target data type.
• : This specifies the target data type and its properties.

	•  (Precision): This is the total number of digits that can be stored, both to the left and to the right of the decimal point. The maximum possible value is 99,999,999.99 (8 digits before the decimal and 2 after).
	•  (Scale): This is the number of decimal digits that will be stored to the right of the decimal point. The value will be rounded to two decimal places if it has more than two, and padded with zeros if it has fewer. [2, 3, 4, 5, 6]

In summary, the entire expression calculates the sum of values in , then displays that total sum as a number with a maximum of 10 digits in total, exactly 2 of which appear after the decimal point. This is often done to ensure precise decimal arithmetic and standardized formatting of the output. [7, 8]

AI responses may include mistakes.

[1] https://sqlzap.com/blog/sql-select-with-2-decimal-places
[2] https://learn.microsoft.com/en-us/sql/t-sql/functions/cast-and-convert-transact-sql?view=sql-server-ver17
[3] https://stackoverflow.com/questions/20119282/how-to-display-two-digits-after-decimal-point-in-sql-server
[4] https://count.co/sql-resources/sql-server/data-types
[5] https://www.youtube.com/shorts/zt5fyIPEHoQ
[6] https://www.w3schools.com/sql/sql_datatypes.asp
[7] https://www.reddit.com/r/SQL/comments/115i7pj/why_do_i_get_seemingly_random_digits_several/
[8] https://stackoverflow.com/questions/441600/write-a-number-with-two-decimal-places-sql-server


*/