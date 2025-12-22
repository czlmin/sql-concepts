-- https://www.hackerrank.com/challenges/binary-search-tree-1/problem?isFullScreen=true

SET NOCOUNT ON;

/*
Enter your query here.
Please append a semicolon ";" at the end of the query and enter your query in a single line to avoid error.
*/
select distinct b1.N, case when b1.P is null then 'Root' when b2.N is null then 'Leaf' else 'Inner' end from BST b1 left join BST b2 on b1.N = b2.P order by b1.N;
go