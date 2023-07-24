--Proc Creation queries

--Create the stored procedure to insert data into the Language  table
CREATE PROCEDURE AddLanguage 
    @Language VARCHAR(50)
AS
BEGIN
    INSERT INTO MovieMate.[Language] ([Language])
    VALUES (@Language);
END;

GO 

--Create the stored procedure to insert data into the Certification  table
CREATE PROCEDURE AddCertification
    @Certification VARCHAR(50)
AS
BEGIN
    INSERT INTO MovieMate.[Certification] ([Certification])
    VALUES (@Certification);
END;

GO

--Create the stored procedure to insert data into the Genre  table
CREATE PROCEDURE AddGenre
    @Genre VARCHAR(50)
AS
BEGIN
    INSERT INTO MovieMate.[Genre] ([Genre])
    VALUES (@Genre);
END;

GO

--Create the stored procedure to insert data into the Location table
CREATE PROCEDURE AddLocation 
    @Zipcode INT,
	@Name VARCHAR(50)
AS
BEGIN
    INSERT INTO MovieMate.[Location]([Zipcode],[Name])
    VALUES (@Zipcode,@Name);
END;

GO

--Create the stored procedure to insert data into the Director table
CREATE PROCEDURE AddDirector
	@DirectorName VARCHAR(255)
AS
BEGIN
    INSERT INTO MovieMate.[Director]([DirectorName])
    VALUES (@DirectorName);
END;

GO

--Create the stored procedure to insert data into the Screen table
CREATE PROCEDURE AddScreen
	@Name VARCHAR(255),
	@Capacity INT

AS
BEGIN
    INSERT INTO MovieMate.[Screen]([Name],Capacity)
    VALUES (@Name ,@Capacity);
END;

GO

--Create the stored procedure to insert data into the SeatCategory table
CREATE PROCEDURE AddSeatCategory
	@TypeName VARCHAR(50),
	@Price DECIMAL(10,2)
AS
BEGIN
    INSERT INTO MovieMate.[SeatCategory](TypeName,Price)
    VALUES (@TypeName ,@Price);
END;

GO

--Create the stored procedure to insert data into the Time table
CREATE PROCEDURE AddTime
	@ShowTimeTitle VARCHAR(50)
AS
BEGIN
    INSERT INTO MovieMate.[Time](ShowTimeTitle)
    VALUES (@ShowTimeTitle);
END;

GO

-- Create the stored procedure to insert data into the User table
CREATE PROCEDURE AddUser 
    @Username VARCHAR(50),
    @Email VARCHAR(100),
    @Password VARCHAR(100),
    @Address VARCHAR(255)
AS
BEGIN
    INSERT INTO MovieMate.[User] (Username, Email, [Password], [Address])
    VALUES (@Username, @Email, @Password, @Address);
END;

GO

--Creating a type
CREATE TYPE MovieMate.EntityId AS TABLE(
    [Id] int 
);
GO

-- Create the stored procedure to insert data into the Movie table
CREATE PROCEDURE AddMovie
    @Title VARCHAR(100),
    @Certification INT,
    @ReleaseDate DATE,
    @Duration INT,
    @PosterLink VARCHAR(200), 
    @TrailerLink VARCHAR(200),
	@Description TEXT,
    @GenreIds AS MovieMate.EntityId READONLY,
	@DirectorIds AS MovieMate.EntityId READONLY,
	@LanguageIds AS MovieMate.EntityId READONLY
AS
BEGIN
    INSERT INTO MovieMate.Movie (Title, Certification, ReleaseDate, Duration, PosterLink, TrailerLink,[Description])
    VALUES (@Title, @Certification, @ReleaseDate, @Duration, @PosterLink, @TrailerLink,@Description);

-- @@Identity @scope_identity 
	DECLARE @MovieId INT = @@Identity

	INSERT MovieMate.MovieGenre (MovieId, GenreId)
	SELECT @MovieId, Id
	FROM @GenreIds

	INSERT MovieMate.DirectorMovie(MovieId, DirectorId)
	SELECT @MovieId, Id
	FROM @DirectorIds

	INSERT MovieMate.MovieLanguage(MovieId, LanguageId)
	SELECT @MovieId, Id
	FROM @LanguageIds
END;

GO
 --Create Procedure to delete movie.
CREATE PROCEDURE DeleteMovie
    @MovieId INT
AS
BEGIN
    -- Delete the movie from Movie table
    DELETE FROM MovieMate.Movie WHERE MovieId = @MovieId;

    -- Delete the movie's genre associations from MovieGenre table
    DELETE FROM MovieMate.MovieGenre WHERE MovieId = @MovieId;

    -- Delete the movie's director associations from DirectorMovie table
    DELETE FROM MovieMate.DirectorMovie WHERE MovieId = @MovieId;

    -- Delete the movie's language associations from MovieLanguage table
    DELETE FROM MovieMate.MovieLanguage WHERE MovieId = @MovieId;
END;


 --Create Procedure to add theatre.

CREATE PROCEDURE AddTheatre
	@Name VARCHAR(100),
	@LocationId INT,
	@Address VARCHAR(200)

	AS 
	BEGIN
	INSERT INTO MovieMate.Theatre([Name],LocationId,[Address]) VALUES(@Name,@LocationId,@Address)
	END; 
	
	--addd a coloumn.
ALTER TABLE MovieMate.Screen 
ADD TheatreId INT CONSTRAINT FK_Screen_TheatreId  FOREIGN KEY (TheatreId) REFERENCES MovieMate.[Theatre](TheatreId)


















