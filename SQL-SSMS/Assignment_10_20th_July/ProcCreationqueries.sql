--Proc Creation queries.

-- Create the stored procedure to insert data into the User table
CREATE PROCEDURE InsertUser 
    @Username VARCHAR(50),
    @Email VARCHAR(100),
    @Password VARCHAR(100),
    @Address VARCHAR(255)
AS
BEGIN
    INSERT INTO MovieMate.[User] (Username, Email, [Password], [Address])
    VALUES (@Username, @Email, @Password, @Address);
END;



-- Create the stored procedure to insert data into the Movie table
CREATE PROCEDURE InsertMovie
    @Title VARCHAR(100),
    @Certification INT,
    @ReleaseDate DATE,
    @Duration INT,
    @PosterLink VARCHAR(200),
    @TrailerLink VARCHAR(200),
    @GenreId INT,
    @LanguageId INT,
    @DirectorId INT
AS
BEGIN
    INSERT INTO MovieMate.Movie (Title, Certification, ReleaseDate, Duration, PosterLink, TrailerLink, GenreId, LanguageId, DirectorId)
    VALUES (@Title, @Certification, @ReleaseDate, @Duration, @PosterLink, @TrailerLink, @GenreId, @LanguageId, @DirectorId);
END;


