USE StudentData;

CREATE TABLE Student(
	PersonID int IDENTITY(1,1),
	FirstName varchar(255),
    LastName varchar(255),
    [Address] varchar(255),
    Email varchar(255));

GO 

CREATE OR ALTER PROC AddStudent
@LastName varchar(255),
@FirstName varchar(255),
@Address varchar(255),
@Email varchar(255)
AS
BEGIN
    INSERT INTO Student(FirstName,LastName,[Address],Email) 
	VALUES(@FirstName,@LastName,@Address,@Email)
END;

GO

SELECT * FROM Student