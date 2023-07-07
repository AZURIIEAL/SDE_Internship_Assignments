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
);

--Insert dummy data 
INSERT INTO BookDatatable (Title, Author, Price, PublicationYear,BookSeller, BookInStock, Genre, [Language], RatingIn5) VALUES
  ('Khasakkinte Itihasam', 'O. V. Vijayan', 350.0, 1969,'DC Books', 123, 'Novel', 'Malayalam', 4),
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
