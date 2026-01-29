Sure! Let’s walk through **CROSS APPLY** with a **clear, visual example** and then connect it to why it’s useful in real T-SQL problems (including ones like HackerRank).

---

## What is `CROSS APPLY` (one-sentence intuition)

> **`CROSS APPLY` runs a subquery or table-valued function *once per row* of the left table and returns only rows where the APPLY produces output.**

Think of it as:

* a **row-by-row join**
* similar to an **INNER JOIN** but where the right side can **reference columns from the left side**

---

## Example setup

### Table: `Employees`

```sql
CREATE TABLE Employees (
    emp_id   INT,
    name     VARCHAR(20),
    salary   INT
);

INSERT INTO Employees VALUES
(1, 'Alice', 60000),
(2, 'Bob',   45000),
(3, 'Carol', 80000);
```

---

## Example 1️⃣ Basic `CROSS APPLY` (correlated subquery)

### Goal

For each employee, generate **two bonus options**:

* 10% bonus
* 20% bonus

### Query

```sql
SELECT
    e.emp_id,
    e.name,
    b.bonus_type,
    b.bonus_amount
FROM Employees e
CROSS APPLY (
    SELECT '10%' AS bonus_type, e.salary * 0.10 AS bonus_amount
    UNION ALL
    SELECT '20%', e.salary * 0.20
) b;
```

---

### How SQL evaluates this (step-by-step)

#### Row 1: Alice (salary = 60000)

The APPLY subquery becomes:

```
10% → 6000
20% → 12000
```

#### Row 2: Bob (salary = 45000)

```
10% → 4500
20% → 9000
```

#### Row 3: Carol (salary = 80000)

```
10% → 8000
20% → 16000
```

---

### Result

| emp_id | name  | bonus_type | bonus_amount |
| -----: | ----- | ---------- | ------------ |
|      1 | Alice | 10%        | 6000         |
|      1 | Alice | 20%        | 12000        |
|      2 | Bob   | 10%        | 4500         |
|      2 | Bob   | 20%        | 9000         |
|      3 | Carol | 10%        | 8000         |
|      3 | Carol | 20%        | 16000        |

✔ The APPLY subquery runs **once per employee**

---

## Example 2️⃣ `CROSS APPLY` vs `INNER JOIN`

### Task

Get each employee’s **highest salary smaller than theirs**

```sql
SELECT
    e1.name,
    e2.max_lower_salary
FROM Employees e1
CROSS APPLY (
    SELECT MAX(e2.salary) AS max_lower_salary
    FROM Employees e2
    WHERE e2.salary < e1.salary
) e2;
```

### Result

| name  | max_lower_salary |
| ----- | ---------------- |
| Alice | 45000            |
| Bob   | NULL             |
| Carol | 60000            |

✔ This **cannot be written** as a normal JOIN cleanly
✔ APPLY lets the right side depend on the left side

---

## Example 3️⃣ `OUTER APPLY` vs `CROSS APPLY`

### Difference

| Type          | Behavior                                                     |
| ------------- | ------------------------------------------------------------ |
| `CROSS APPLY` | Like **INNER JOIN** — left rows with no match are dropped    |
| `OUTER APPLY` | Like **LEFT JOIN** — left rows kept, right side becomes NULL |

### Demo

```sql
SELECT
    e.name,
    x.value
FROM Employees e
OUTER APPLY (
    SELECT e.salary / 1000 AS value
    WHERE e.salary > 50000
) x;
```

Result:

| name  | value |
| ----- | ----- |
| Alice | 60    |
| Bob   | NULL  |
| Carol | 80    |

---

## Where you’ve already *seen* `CROSS APPLY`

In **15 Days of Learning SQL**, we used:

```sql
CROSS APPLY (
    SELECT s.hacker_id
    FROM Submissions s
    WHERE s.submission_date BETWEEN '2016-03-01' AND d.dt
    GROUP BY s.hacker_id
    HAVING COUNT(DISTINCT s.submission_date)
         = DATEDIFF(day, '2016-03-01', d.dt) + 1
) q
```

Meaning:

> “For each date `d`, compute hackers who have submitted on **every day up to that date**.”

That’s classic APPLY logic.

---

## One mental model to remember

```
LEFT TABLE ROW
    ↓
RUN RIGHT QUERY USING LEFT ROW
    ↓
RETURN ROWS (or none)
```

---

If you want, I can next:

* Rewrite an APPLY example using a **window function** for comparison
* Show a **performance comparison**: APPLY vs JOIN vs correlated subquery
* Or give a **Hackerrank-style practice problem** using APPLY
