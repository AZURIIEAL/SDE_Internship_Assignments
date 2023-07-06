--Create a Database
CREATE DATABASE BookStoreDB;

-- Create a Table to hold the data
CREATE TABLE BookDatatable (
  BookID INT,
  Title VARCHAR(100),
  Author VARCHAR(100),
  Price DECIMAL(5, 2),
  PublicationYear INT,
  BookSeller VARCHAR(100),
  BookInStock INT,
  Genre VARCHAR(50),
  [Language] VARCHAR(50),
  RatingIn5 INT
);

--Insert dummy data 
INSERT INTO BookDatatable (BookID, Title, Author, Price, PublicationYear,BookSeller, BookInStock, Genre, Language, RatingIn5) VALUES
  (1, 'Khasakkinte Itihasam', 'O. V. Vijayan', 350.0, 1969,'DC Books', 123, 'Novel', 'Malayalam', 4),
  (2, 'To Kill a Mockingbird', 'Harper Lee',400.0, 1960,'Penguin', 148, 'Novel', 'English', 3),
  (3, 'Randamoozham', ' M. T. Vasudevan Nair',240.0, 1984,'DC Books', 200, 'Novel', 'Malayalam', 5),
  (4, 'Pride and Prejudice', 'Jane Austen',220.0, 1813,'Faraway Books', 120, 'Novel', 'English', 3),
  (5, 'Naalukettu', 'M. T. Vasudevan Nair',350.0, 1958,'Peacock', 178, 'Novel', 'Malayalam', 4);


--To Visualise the data
  SELECT * FROM BookDatatable;



