Below is a **clean T-SQL schema + sample data (50 records)** you can load into **Microsoft SQL Server** to practice the HackerRank **OCCUPATIONS** problem.

The data is designed so that:

* All **4 occupations** appear (`Doctor`, `Professor`, `Singer`, `Actor`)
* Names are mixed and unordered (so sorting logic matters)
* Counts per occupation are uneven (so `NULL`s appear after pivoting)

---

## 1️⃣ Table schema (matches HackerRank)

```sql
CREATE TABLE dbo.Occupations (
    Name        VARCHAR(50) NOT NULL,
    Occupation  VARCHAR(20) NOT NULL
);
```

---

## 2️⃣ Sample data (50 records)

```sql
INSERT INTO dbo.Occupations (Name, Occupation) VALUES
-- Doctors (13)
('Alice', 'Doctor'),
('Brian', 'Doctor'),
('Catherine', 'Doctor'),
('Daniel', 'Doctor'),
('Evelyn', 'Doctor'),
('Frank', 'Doctor'),
('Grace', 'Doctor'),
('Henry', 'Doctor'),
('Isabella', 'Doctor'),
('Jack', 'Doctor'),
('Katherine', 'Doctor'),
('Liam', 'Doctor'),
('Monica', 'Doctor'),

-- Professors (12)
('Aaron', 'Professor'),
('Betty', 'Professor'),
('Charles', 'Professor'),
('Diana', 'Professor'),
('Edward', 'Professor'),
('Fiona', 'Professor'),
('George', 'Professor'),
('Hannah', 'Professor'),
('Ian', 'Professor'),
('Julia', 'Professor'),
('Kevin', 'Professor'),
('Laura', 'Professor'),

-- Singers (11)
('Amelia', 'Singer'),
('Benjamin', 'Singer'),
('Chloe', 'Singer'),
('David', 'Singer'),
('Ella', 'Singer'),
('Felix', 'Singer'),
('Georgia', 'Singer'),
('Harry', 'Singer'),
('Irene', 'Singer'),
('Jason', 'Singer'),
('Kelly', 'Singer'),

-- Actors (14)
('Adam', 'Actor'),
('Bella', 'Actor'),
('Chris', 'Actor'),
('Derek', 'Actor'),
('Emily', 'Actor'),
('Finn', 'Actor'),
('Gabriel', 'Actor'),
('Hailey', 'Actor'),
('Ivan', 'Actor'),
('Jessica', 'Actor'),
('Kyle', 'Actor'),
('Luna', 'Actor'),
('Mark', 'Actor'),
('Nina', 'Actor');
```

---

## 3️⃣ Quick sanity check

```sql
SELECT Occupation, COUNT(*) AS cnt
FROM dbo.Occupations
GROUP BY Occupation;
```

Expected result:

```
Actor       14
Doctor      13
Professor   12
Singer      11
```

---

## 4️⃣ What this lets you practice

With this dataset you can correctly test:

* `ROW_NUMBER() OVER (PARTITION BY Occupation ORDER BY Name)`
* `PIVOT` vs `CASE WHEN` solutions
* Handling of **uneven row counts**
* Correct alphabetical ordering
* Proper handling of `NULL`s in pivot output

---

If you want, I can next:

* Run the **expected pivot output** using this data
* Generate **edge-case data** (single-occupation dominance, same names, etc.)
* Or convert this into a **CSV / Excel-ready** format
