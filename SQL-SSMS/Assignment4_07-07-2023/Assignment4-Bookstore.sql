
-- Create a Database
CREATE DATABASE BookStoreDB;

-- Use the BookStoreDB
USE BookStoreDB;

-- Create a Table to hold the data
CREATE TABLE BookDatatable (
  BookID INT NOT NULL IDENTITY(1,1) PRIMARY KEY,  --IDENTITY is used (start,increment)
  Title VARCHAR(100) NOT NULL,
  Author VARCHAR(100),
  Price DECIMAL(5, 2) NOT NULL,
  PublicationYear SMALLINT,
  BookSeller VARCHAR(100),
  BookInStock INT NOT NULL,
  Genre VARCHAR(50),
  [Language] VARCHAR(50),
  RatingIn5 TINYINT,
  CreatedOn DATE DEFAULT GETDATE(),
  CreatedOnDATETIME DATETIME DEFAULT GETDATE()
);
DROP TABLE BookDatatable

--Insert dummy data 
INSERT INTO BookDatatable (Title, Author, Price, PublicationYear,BookSeller, BookInStock, Genre, [Language], RatingIn5) VALUES
  ('B', 'O. V. Vijayan', 350.0, 1969,'DC Books', 123, 'Novel', 'English', 4),
  ('To Kill a Mockingbird', 'Harper Lee',400.0, 1960,'Penguin', 148, 'Novel', 'English', 3),
  ('Randamoozham', ' M. T. Vasudevan Nair',240.0, 1984,'DC Books', 200, 'Novel', 'Malayalam', 5),
  ('Pride and Prejudice', 'Jane Austen',220.0, 1813,'Faraway Books', 120, 'Novel', 'English', 3),
  ('Naalukettu', 'M. T. Vasudevan Nair',350.0, 1958,'Peacock', 0, 'Novel', 'Malayalam', 4);

--To Visualise the data

SELECT *,BookInStock,
    CASE
        WHEN BookInStock > 0 THEN 'YES'
        ELSE 'NO'
    END AS BookAvailability
FROM BookDatatable;
--.---------------------------------------------------------------------------------------------------------
-- 1. Display the incremented id value (identity primary key) .
--We can use SCOPE_IDENTIFY() to scope to the latest ID.
SELECT SCOPE_IDENTITY() AS incremented_id;

--2. Display date in DD-MM-YYYY format.
--105 acts as the DD-MM-YYYY.
SELECT *,CONVERT(varchar(10), CreatedOn, 105) AS [DD-MM-YYYY]
FROM BookDatatable;

--3.Declare an attribute of datatype datetime and display only the date.
--We can use 105 after CreatedOnDATETIME for a specific format.
SELECT *,CONVERT(varchar(11),CreatedOnDATETIME) AS OnlyDate
FROM BookDatatable;

--Adding the single values for monday as there is a question  neeeding monday dates.
INSERT INTO BookDatatable (Title, Author, Price, PublicationYear,BookSeller, BookInStock, Genre, [Language], RatingIn5,CreatedOn,CreatedOnDATETIME) VALUES
  ('A', 'O. V. Vijayan', 350.0, 1969,'DC Books', 123, 'Novel', 'English', 4,'1-10-22','2022-10-01 13:25:07.480');

--5. For Book table: 
--i) Display the no. of books arrived during the last year  

SELECT COUNT(*) AS TotalBooksArrived2022
FROM BookDatatable
WHERE YEAR(CreatedOn) = 2022;

--ii) Display the no. of books arrived on every Monday during the last year
SELECT COUNT(*) AS BooksArrivedOnMondays2022
FROM BookDatatable
WHERE DATEPART(weekday, CreatedOn) = 2 -- Monday
  AND YEAR(CreatedOn) = 2022;






