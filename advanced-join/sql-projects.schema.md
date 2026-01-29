Below is a ready-to-run **T-SQL schema + 25 records** for the HackerRank **SQL Project Planning** problem. The data is designed to form **multiple project “chains”** (consecutive tasks where `End_Date = next Start_Date`) with different durations, plus a few single-day projects.

---

## 1️⃣ Schema

```sql
CREATE TABLE dbo.Projects (
    Task_ID     INT        NOT NULL PRIMARY KEY,
    Start_Date  DATE       NOT NULL,
    End_Date    DATE       NOT NULL
);
```

> (In the HackerRank problem, each task is 1 day long, so typically `End_Date = Start_Date + 1 day`.)

---

## 2️⃣ Sample Data (25 records)

This set creates **6 projects** with varying lengths:

* Project A: 6 tasks (duration 6 days)
* Project B: 4 tasks (duration 4 days)
* Project C: 7 tasks (duration 7 days)
* Project D: 3 tasks (duration 3 days)
* Project E: 2 tasks (duration 2 days)
* Project F: 3 single tasks (duration 1 day each)

```sql
INSERT INTO dbo.Projects (Task_ID, Start_Date, End_Date) VALUES
-- Project A (6 tasks): 2015-10-01 .. 2015-10-07
(1,  '2015-10-01', '2015-10-02'),
(2,  '2015-10-02', '2015-10-03'),
(3,  '2015-10-03', '2015-10-04'),
(4,  '2015-10-04', '2015-10-05'),
(5,  '2015-10-05', '2015-10-06'),
(6,  '2015-10-06', '2015-10-07'),

-- gap

-- Project B (4 tasks): 2015-10-10 .. 2015-10-14
(7,  '2015-10-10', '2015-10-11'),
(8,  '2015-10-11', '2015-10-12'),
(9,  '2015-10-12', '2015-10-13'),
(10, '2015-10-13', '2015-10-14'),

-- gap

-- Project C (7 tasks): 2015-10-20 .. 2015-10-27
(11, '2015-10-20', '2015-10-21'),
(12, '2015-10-21', '2015-10-22'),
(13, '2015-10-22', '2015-10-23'),
(14, '2015-10-23', '2015-10-24'),
(15, '2015-10-24', '2015-10-25'),
(16, '2015-10-25', '2015-10-26'),
(17, '2015-10-26', '2015-10-27'),

-- gap

-- Project D (3 tasks): 2015-11-01 .. 2015-11-04
(18, '2015-11-01', '2015-11-02'),
(19, '2015-11-02', '2015-11-03'),
(20, '2015-11-03', '2015-11-04'),

-- gap

-- Project E (2 tasks): 2015-11-10 .. 2015-11-12
(21, '2015-11-10', '2015-11-11'),
(22, '2015-11-11', '2015-11-12'),

-- Single-task projects (duration 1 day)
(23, '2015-11-20', '2015-11-21'),
(24, '2015-11-25', '2015-11-26'),
(25, '2015-12-01', '2015-12-02');
```

---

## 3️⃣ Quick check: view tasks ordered by date

```sql
SELECT *
FROM dbo.Projects
ORDER BY Start_Date;
```

---

## 4️⃣ What your output should group into (for reference)

You should end up with these project ranges:

| Project | Start_Date | End_Date   | Duration |
| ------- | ---------- | ---------- | -------- |
| A       | 2015-10-01 | 2015-10-07 | 6        |
| B       | 2015-10-10 | 2015-10-14 | 4        |
| C       | 2015-10-20 | 2015-10-27 | 7        |
| D       | 2015-11-01 | 2015-11-04 | 3        |
| E       | 2015-11-10 | 2015-11-12 | 2        |
| F1      | 2015-11-20 | 2015-11-21 | 1        |
| F2      | 2015-11-25 | 2015-11-26 | 1        |
| F3      | 2015-12-01 | 2015-12-02 | 1        |

(HackerRank wants ordering by duration asc, then start date.)

---

If you want, I can also generate a **more “messy” dataset** (Task_ID not aligned with dates, overlapping dates excluded, etc.) to better simulate tricky cases while still valid per the problem constraints.
