/*Like assignment 
...........................................................................................
1.Display all records who’s name starts with John.
2.Display all records who’s name ends with John.
3.Display all records who’s name have John ( can be any where ).
4.Display all records who’s name starts with A and ends with n.
5.Display all records who have alex or deo any where in name column.  */


--1.Display all records who’s name starts with John.
SELECT *
FROM Employe
WHERE [name] LIKE 'John%';  --We just want john(at first) anything else doesnt matter so John%.



--2.Display all records who’s name ends with John.
SELECT *
FROM Employe
WHERE [name] LIKE '%John'; --We just want john(at End) anything in front doesnt matter so %John.



--3.Display all records who’s name have John ( can be any where ).
SELECT *
FROM Employe
WHERE [name] LIKE '%John%'; --We just want john(anywhere) anything in front or back doesnt matter so %John%.




--4.Display all records who’s name starts with A and ends with n.
SELECT *
FROM Employe
WHERE [name] LIKE 'A%n'; --Only need is to have A at first and n at last hence A%n.



--5.Display all records who have alex or deo any where in name column.

SELECT *
FROM Employe
WHERE [name] LIKE '%alex%' OR [name] LIKE'%deo%';


--Finding % in a Coloumn 
SELECT *
FROM Employe
WHERE [name] LIKE '%[%]%';


--DUMMY DATA
CREATE TABLE Employe (
  id INT IDENTITY(1,1) PRIMARY KEY,
  name VARCHAR(50)
);

INSERT INTO Employe (name)
VALUES
  ('Alex'),
  ('Deo'),
  ('John'),
  ('Alex Deo'),
  (''),
  ('%%%'),
  ('Alex Deo John');




