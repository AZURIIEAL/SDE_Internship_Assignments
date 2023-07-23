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

-- Movie 2: Memento
EXEC AddMovie
    @Title = 'Memento',
    @Certification = 2,
    @ReleaseDate = '2000-03-16',
    @Duration = 113,
    @PosterLink = 'http://example.com/memento_poster.jpg',
    @TrailerLink = 'http://example.com/memento_trailer.mp4',
    @Description = 'A mind-bending tale of a man with short-term memory loss seeking revenge for his wifes murder.',
    @GenreIds = @Genres,
    @DirectorIds = @Directors,
    @LanguageIds = @Languages;

-- Movie 3: Insomnia
EXEC AddMovie
    @Title = 'Insomnia',
    @Certification = 2,
    @ReleaseDate = '2002-05-24',
    @Duration = 118,
    @PosterLink = 'http://example.com/insomnia_poster.jpg',
    @TrailerLink = 'http://example.com/insomnia_trailer.mp4',
    @Description = 'A psychological thriller about a detective hunting a killer while battling his own insomnia.',
    @GenreIds = @Genres,
    @DirectorIds = @Directors,
    @LanguageIds = @Languages;

-- Movie 4: Batman Begins
EXEC AddMovie
    @Title = 'Batman Begins',
    @Certification = 2,
    @ReleaseDate = '2005-06-15',
    @Duration = 140,
    @PosterLink = 'http://example.com/batman_begins_poster.jpg',
    @TrailerLink = 'http://example.com/batman_begins_trailer.mp4',
    @Description = 'The origin story of the Dark Knight, Batman, as he fights crime and corruption in Gotham City.',
    @GenreIds = @Genres,
    @DirectorIds = @Directors,
    @LanguageIds = @Languages;

-- Movie 5: The Prestige
EXEC AddMovie
    @Title = 'The Prestige',
    @Certification = 2,
    @ReleaseDate = '2006-10-20',
    @Duration = 130,
    @PosterLink = 'http://example.com/the_prestige_poster.jpg',
    @TrailerLink = 'http://example.com/the_prestige_trailer.mp4',
    @Description = 'A thrilling tale of rivalry between two magicians in Victorian-era London.',
    @GenreIds = @Genres,
    @DirectorIds = @Directors,
    @LanguageIds = @Languages;

-- Movie 6: The Dark Knight
EXEC AddMovie
    @Title = 'The Dark Knight',
    @Certification = 2,
    @ReleaseDate = '2008-07-18',
    @Duration = 152,
    @PosterLink = 'http://example.com/the_dark_knight_poster.jpg',
    @TrailerLink = 'http://example.com/the_dark_knight_trailer.mp4',
    @Description = 'The Joker wreaks havoc in Gotham City, challenging Batman to the ultimate test of morality.',
    @GenreIds = @Genres,
    @DirectorIds = @Directors,
    @LanguageIds = @Languages;

-- Movie 7: Inception
EXEC AddMovie
    @Title = 'Inception',
    @Certification = 2,
    @ReleaseDate = '2010-07-16',
    @Duration = 148,
    @PosterLink = 'http://example.com/inception_poster.jpg',
    @TrailerLink = 'http://example.com/inception_trailer.mp4',
    @Description = 'A mind-bending heist film set within the realm of dreams.',
    @GenreIds = @Genres,
    @DirectorIds = @Directors,
    @LanguageIds = @Languages;

-- Movie 8: The Dark Knight Rises
EXEC AddMovie
    @Title = 'The Dark Knight Rises',
    @Certification = 2,
    @ReleaseDate = '2012-07-20',
    @Duration = 165,
    @PosterLink = 'http://example.com/the_dark_knight_rises_poster.jpg',
    @TrailerLink = 'http://example.com/the_dark_knight_rises_trailer.mp4',
    @Description = 'Batman returns to face the formidable Bane, who plans to destroy Gotham City.',
    @GenreIds = @Genres,
    @DirectorIds = @Directors,
    @LanguageIds = @Languages;

-- Movie 9: Interstellar
EXEC AddMovie
    @Title = 'Interstellar',
    @Certification = 2,
    @ReleaseDate = '2014-11-07',
    @Duration = 169,
    @PosterLink = 'http://example.com/interstellar_poster.jpg',
    @TrailerLink = 'http://example.com/interstellar_trailer.mp4',
    @Description = 'A journey beyond our solar system to find a new home for humanity.',
    @GenreIds = @Genres,
    @DirectorIds = @Directors,
    @LanguageIds = @Languages;

-- Movie 10: Dunkirk
EXEC AddMovie
    @Title = 'Dunkirk',
    @Certification = 2,
    @ReleaseDate = '2017-07-13',
    @Duration = 106,
    @PosterLink = 'http://example.com/dunkirk_poster.jpg',
    @TrailerLink = 'http://example.com/dunkirk_trailer.mp4',
    @Description = 'An epic war film depicting the Dunkirk evacuation during World War II.',
    @GenreIds = @Genres,
    @DirectorIds = @Directors,
    @LanguageIds = @Languages;



	SELECt * from MovieMate.Movie
		SELECt * from MovieMate.MovieGenress
