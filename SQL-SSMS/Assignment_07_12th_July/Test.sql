-- Create AuthorTable
CREATE TABLE AuthorTable (
    AuthorId INT IDENTITY(1,1) CONSTRAINT PK_AuthorTable PRIMARY KEY(AuthorId),
    AuthorName VARCHAR(255) NOT NULL,
    AuthorAddress VARCHAR(255) NOT NULL
);

-- Create BookTable
CREATE TABLE BookTable (
    ISBN INT IDENTITY(1,1) CONSTRAINT PK_BookTable PRIMARY KEY(ISBN),
    Title VARCHAR(255),
    PublisherName VARCHAR(255),
    AuthorId INT CONSTRAINT FK_BookTable FOREIGN KEY (AuthorId) REFERENCES AuthorTable (AuthorId),
    PublishingYear INT,
    Genre VARCHAR(255),
    Price DECIMAL(5, 2) NOT NULL,
    RatingIn5 INT
);
--Create CustomerTable
CREATE TABLE CustomerTable (
CustomerId INT IDENTITY(1,1) CONSTRAINT PK_CustomerTable PRIMARY KEY(CustomerId),
CustomerAddress VARCHAR(255) NOT NULL,
CustomerPhoneNumber VARCHAR(255),
CustomerEmail VARCHAR(255)
);

--Create OrderTable
CREATE TABLE OrderTable (
OrderId INT IDENTITY(1,1) CONSTRAINT PK_CustomerTable PRIMARY KEY(OrderId),
BookId INT NOT NULL CONSTRAINT FK_OrderTable FOREIGN KEY (BookId) REFERENCES BookTable (ISBN),
CustomerId INT NOT NULL CONSTRAINT FK_OrderTable2 FOREIGN KEY (CustomerId) REFERENCES CustomerTable (CustomerId),
PaymentMethod VARCHAR(255)
);

--Create WareHouseTable
CREATE TABLE WareHouseTable (
ISBN INT IDENTITY(1,1) CONSTRAINT PK_WareHouseTable PRIMARY KEY(ISBN),
WareHouseID INT NOT NULL, --This would be a foreign key referencing other tables which would be in ware houss where they would update the book count and availabality.
WareHouseAddress VARCHAR(255) NOT NULL,
WareHousePhoneNumber VARCHAR(255)                                  
);
 
--Create PublisherTable
CREATE TABLE PublisherTable (
PublisherId INT IDENTITY(1,1) CONSTRAINT PK_PublisherTable PRIMARY KEY(PublisherId),
PublisherName VARCHAR(255) NOT NULL,
PublisherAddress VARCHAR(255) NOT NULL,
PublisherPhoneNumber VARCHAR(255),
PublisherWebsiteURL VARCHAR(255)
);

DROP TABLE AuthorTable;
DROP TABLE BookTable;
DROP TABLE CustomerTable;
DROP TABLE OrderTable;
DROP TABLE WareHouseTable;
DROP TABLE PublisherTable;







-- Insert data into AuthorTable
INSERT INTO AuthorTable (AuthorName, AuthorAddress)
VALUES ('Abin', 'ABC veed'),
       ('Ramesh', '456 Avenue'),
	   ('Rajesh', 'XYZ veed');

-- Insert data into BookTable and reference AuthorTable using foreign key
INSERT INTO BookTable (Title, PublisherName, AuthorId, PublishingYear, Genre, Price, RatingIn5)
VALUES ('Book Title 1', 'Publisher 1', 1, 2022, 'Fiction', 120.50, 4),
       ('Book Title 2', 'Publisher 2', 2, 2021, 'Non-Fiction', 200.50, 5),
	   ('Book Title 3', 'Publisher 3', 1, 2022, 'Fiction', 120.50, 4),
	   ('Book Title 4', 'Publisher 1', 3, 2022, 'Novel', 120.50, 2);

	   
-- Insert data into WareHouseTable
INSERT INTO WareHouseTable (WareHouseAddress, WareHousePhoneNumber)
VALUES ('1234 villa groundfloor', '+91 1234567890'),
       ('4565 villa groundfloor', '+91 6723549867'),
	   ('000 villa First Floor', '+91 2398458765');

	   
SELECT * FROM BookTable



SELECT b.Title, b.PublisherName, a.AuthorName, b.PublishingYear, b.Genre, b.Price, b.RatingIn5
FROM BookTable b
JOIN AuthorTable a ON b.AuthorId = a.AuthorId;
