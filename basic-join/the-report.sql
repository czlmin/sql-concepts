-- https://www.hackerrank.com/challenges/the-report/problem?isFullScreen=true

SET NOCOUNT ON;

/*
Enter your query here.
Please append a semicolon ";" at the end of the query and enter your query in a single line to avoid error.
*/
select case when g.Grade < 8 then NULL else s.Name end, g.Grade, s.Marks from Students as s join Grades as g on s.Marks <= g.Max_Mark and s.Marks >= g.Min_Mark order by g.Grade desc, s.Name, s.Marks;
go