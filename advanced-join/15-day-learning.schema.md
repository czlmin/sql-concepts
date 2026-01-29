Below is a **ready-to-run T-SQL schema + 25 records** for the **Submissions** table that fits the **“15 Days of Learning SQL”** problem and works cleanly with your provided `Hackers` table.

The data is intentionally designed to let you practice:

* daily max submitter logic
* continuous-streak (from 2016-03-01) logic
* ties and gaps

---

## 1️⃣ Submissions table schema (HackerRank-compatible)

```sql
CREATE TABLE dbo.Submissions (
    submission_id   INT        NOT NULL PRIMARY KEY,
    hacker_id       INT        NOT NULL
        CONSTRAINT FK_Submissions_Hackers
        REFERENCES dbo.Hackers(hacker_id),
    submission_date DATE       NOT NULL
);
```

---

## 2️⃣ Sample data (25 records)

**Design goals**

* Alice (101): submits every day from Mar-01 → Mar-05 (perfect early streak)
* Bob (102): misses Mar-03 (breaks streak)
* Carol (103): submits multiple times on a day (tests max-per-day logic)
* David (104): late starter
* Others: sporadic submissions

```sql
INSERT INTO dbo.Submissions (submission_id, hacker_id, submission_date) VALUES
-- 2016-03-01
(1,  101, '2016-03-01'),
(2,  102, '2016-03-01'),
(3,  103, '2016-03-01'),

-- 2016-03-02
(4,  101, '2016-03-02'),
(5,  102, '2016-03-02'),
(6,  103, '2016-03-02'),
(7,  103, '2016-03-02'),  -- Carol submits twice

-- 2016-03-03
(8,  101, '2016-03-03'),
(9,  103, '2016-03-03'),
(10, 104, '2016-03-03'),

-- 2016-03-04
(11, 101, '2016-03-04'),
(12, 102, '2016-03-04'),
(13, 103, '2016-03-04'),
(14, 103, '2016-03-04'),  -- Carol submits twice again

-- 2016-03-05
(15, 101, '2016-03-05'),
(16, 102, '2016-03-05'),
(17, 104, '2016-03-05'),

-- 2016-03-06
(18, 105, '2016-03-06'),
(19, 106, '2016-03-06'),

-- 2016-03-07
(20, 101, '2016-03-07'),
(21, 103, '2016-03-07'),

-- 2016-03-08
(22, 107, '2016-03-08'),

-- 2016-03-09
(23, 108, '2016-03-09'),
(24, 109, '2016-03-09'),

-- 2016-03-10
(25, 110, '2016-03-10');
```

---

## 3️⃣ Quick sanity checks

### A) Submissions per day per hacker

```sql
SELECT
    submission_date,
    hacker_id,
    COUNT(*) AS num_submissions
FROM dbo.Submissions
GROUP BY submission_date, hacker_id
ORDER BY submission_date, num_submissions DESC, hacker_id;
```

### B) Distinct submission days per hacker

```sql
SELECT
    h.hacker_id,
    h.name,
    COUNT(DISTINCT s.submission_date) AS days_submitted
FROM dbo.Hackers h
LEFT JOIN dbo.Submissions s
  ON s.hacker_id = h.hacker_id
GROUP BY h.hacker_id, h.name
ORDER BY h.hacker_id;
```

---

## 4️⃣ What this dataset lets you test

✔ Continuous-streak logic
✔ Daily max-submitter with tie-break by `hacker_id`
✔ Multiple submissions on same day
✔ Hackers with no early participation
✔ Days with very few submissions

---

If you want, next I can:

* Show the **expected output table** for this exact dataset
* Add more rows to fully cover **all 15 days**
* Or generate a **stress-test version** with 100+ submissions
