-- https://www.hackerrank.com/challenges/earnings-of-employees/problem?isFullScreen=true

SET NOCOUNT ON;
select distinct max_earnings, cnt from (select distinct max(salary*months) as max_earnings from Employee) a join
(select count(employee_id) as cnt from Employee where salary*months = (select max(salary*months) from Employee)) b on 1=1;
go