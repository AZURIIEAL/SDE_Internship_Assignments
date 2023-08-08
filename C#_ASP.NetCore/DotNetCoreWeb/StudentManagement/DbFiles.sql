USE StudentData;

CREATE TABLE Student(
	PersonID int IDENTITY(1,1),
    LastName varchar(255),
    FirstName varchar(255),
    [Address] varchar(255),
    Email varchar(255));


CREATE OR ALTER PROC AddStudent

@DirectorName VARCHAR(255)
AS
BEGIN
    INSERT INTO MovieMate.[Director]([DirectorName])
    VALUES (@DirectorName);
END;

GO

