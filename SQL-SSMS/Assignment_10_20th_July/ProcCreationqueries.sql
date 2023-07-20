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

-- Example usage of the InsertUser stored procedure
EXEC InsertUser
    @Username = 'john_doe',
    @Email = 'john.doe@example.com',
    @Password = 'password123',
    @Address = '123 Main St';


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


-- Example usage of the InsertMovie stored procedure
EXEC InsertMovie
    @Title = 'Avengers: Endgame',
    @Certification = 12,
    @ReleaseDate = '2019-04-26',
    @Duration = 181,
    @PosterLink = 'http://poster.in',
    @TrailerLink = 'http://trailer.com',
    @GenreId = 1,
    @LanguageId = 1,
    @DirectorId = 1;
