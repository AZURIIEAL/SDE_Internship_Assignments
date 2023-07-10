--Shop-Customer-Bookselling Table
--To Show Primary key (Automatic Increment and Created on)
CREATE TABLE CustomerData (
  CustomerID INT NOT NULL IDENTITY(1,1) PRIMARY KEY,  --IDENTITY is used (start,increment)
  CustomerName VARCHAR(50) NOT NULL,
  BookId INT,
  PaymentMethod VARCHAR(50),
  Current_DateTime DATETIME
);

--Insert Dummy data
INSERT INTO CustomerData (CustomerName,BookId,Current_DateTime) VALUES ('Abin',22,CURRENT_TIMESTAMP);


--See the data
SELECT * FROM CustomerData;

