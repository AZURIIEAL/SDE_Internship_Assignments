--Create a DB called testDB
CREATE DATABASE testDB;

--Creating a Table called Info
CREATE TABLE Info ( 
    PersonID int,
	FirstName varchar(50),
    LastName varchar(50),
    Score int);

--To Check all the DB In list.
SELECT * FROM sys.databases;  

--To insert Data Into the Table
INSERT INTO Info (PersonID, FirstName, LastName, Score)     
VALUES (1,'Abin', 'Binu', 76),
(2,'Akshay', 'Patel', 81),
(3,'Ranjeet', 'Sharma',73),
(4,'Rohan', 'Prasad', 92),
(5,'John', 'Doe', 48);

--To Display the data
SELECT * FROM Info;

--Our objective is to create a Coloumn called Grade Which will show the Grade of students
--as if the Score is greater than 80 he will have 'A' less than 80 then he will have B.

SELECT *,Score,
    CASE
        WHEN Score > 90 THEN 'A+'
		WHEN Score > 80 AND Score <= 90 THEN 'A'
		WHEN Score >= 70 AND Score <= 80 THEN 'B+'
        ELSE 'B'
    END AS Grade
FROM Info;

