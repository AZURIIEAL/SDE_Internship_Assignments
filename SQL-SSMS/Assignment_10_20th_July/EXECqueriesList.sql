--Execution queries.



--AddGenre queries.
EXEC AddGenre 'Action';
GO
EXEC AddGenre 'Comedy';
GO
EXEC AddGenre 'Drama';
GO
EXEC AddGenre 'Thriller';
GO
EXEC AddGenre 'Sci-Fi';
GO

DELETE  FROM MovieMate.Genre
select * FROM MovieMate.Genre



--AddDirector queries.
EXEC AddDirector 'Christopher Nolan';
GO
EXEC AddDirector 'John Smith';
GO
EXEC AddDirector 'Jane Doe';
GO
EXEC AddDirector 'Michael Johnson';
GO
EXEC AddDirector 'Emily Anderson';
GO

DELETE  FROM MovieMate.Director
select * FROM MovieMate.Director


-- Create a table variable to hold GenreIds
DECLARE @Genres MovieMate.EntityId;
INSERT INTO @Genres (Id) VALUES (1); -- GenreId for 'Action'
INSERT INTO @Genres (Id) VALUES (3); -- GenreId for 'Drama'
INSERT INTO @Genres (Id) VALUES (4); -- GenreId for 'Thriller'
INSERT INTO @Genres (Id) VALUES (5); -- GenreId for 'Sci-Fi'

delete MovieMate.Movie


-- Create a table variable to hold GenreIds
DECLARE @Genres MovieMate.EntityId;
INSERT INTO @Genres (Id) VALUES (1); -- GenreId for 'Action'
INSERT INTO @Genres (Id) VALUES (3); -- GenreId for 'Drama'
INSERT INTO @Genres (Id) VALUES (4); -- GenreId for 'Thriller'
INSERT INTO @Genres (Id) VALUES (5); -- GenreId for 'Sci-Fi'

-- Create a table variable to hold DirectorIds
DECLARE @Directors MovieMate.EntityId;
INSERT INTO @Directors (Id) VALUES (1); -- DirectorId for 'Christopher Nolan'

-- Create a table variable to hold LanguageIds
DECLARE @Languages MovieMate.EntityId;
INSERT INTO @Languages (Id) VALUES (10); -- LanguageId for 'English'

-- Insert Christopher Nolan's movies into the database

-- Movie 1: Following
EXEC AddMovie
    @Title = 'Following',
    @Certification = 2,
    @ReleaseDate = '1998-09-12',
    @Duration = 70,
    @PosterLink = 'http://example.com/following_poster.jpg',
    @TrailerLink = 'http://example.com/following_trailer.mp4',
    @Description = 'A mysterious thriller about a young writer who follows strangers for inspiration.',
    @GenreIds = @Genres,
    @DirectorIds = @Directors,
    @LanguageIds = @Languages;

