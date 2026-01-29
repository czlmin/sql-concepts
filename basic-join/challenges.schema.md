CREATE TABLE dbo.Hackers (
    hacker_id INT PRIMARY KEY,
    name      VARCHAR(50) NOT NULL
);

CREATE TABLE dbo.Challenges (
    challenge_id INT PRIMARY KEY,
    hacker_id    INT NOT NULL
        CONSTRAINT FK_Challenges_Hackers
        REFERENCES dbo.Hackers(hacker_id)
);

INSERT INTO dbo.Hackers (hacker_id, name) VALUES
(101, 'Alice'),
(102, 'Bob'),
(103, 'Carol'),
(104, 'David'),
(105, 'Eve'),
(106, 'Frank'),
(107, 'Grace'),
(108, 'Heidi'),
(109, 'Ivan'),
(110, 'Judy');

INSERT INTO dbo.Challenges (challenge_id, hacker_id) VALUES
-- Alice (5)
(1, 101), (2, 101), (3, 101), (4, 101), (5, 101),

-- Bob (5)
(6, 102), (7, 102), (8, 102), (9, 102), (10, 102),

-- Carol (4)
(11, 103), (12, 103), (13, 103), (14, 103),

-- David (4)
(15, 104), (16, 104), (17, 104), (18, 104),

-- Eve (3)
(19, 105), (20, 105), (21, 105),

-- Frank (2)
(22, 106), (23, 106),

-- Grace (1)
(24, 107),

-- Heidi (1)
(25, 108);
