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
CREATE OR ALTER PROC GetStudentById
@id INT
AS 
BEGIN
	SELECT * FROM Student WHERE Student.PersonID = @id;
	
END;
GO


CREATE OR ALTER PROC UpdateStudent
@id INT,
@FirstName varchar(255),
@LastName varchar(255),
@Address varchar(255),
@Email varchar(255)

AS 
BEGIN
UPDATE Student
SET FirstName = @FirstName, LastName= @LastName,[Address]=@Address,Email=@Email
WHERE PersonID = @id;
END;
GO

CREATE OR ALTER PROC DeleteStudent
@id INT

AS 
BEGIN
DELETE FROM Student WHERE PersonID=@id;
END;
GO

SELECT * FROM Student;