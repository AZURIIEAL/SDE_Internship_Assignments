--Execution queries.

-- Example usage of the InsertUser stored procedure
EXEC InsertUser
    @Username = 'Abin',
    @Email = 'test@gmail.com',
    @Password = 'password123',
    @Address = 'ABC TVM';


	
-- Example usage of the InsertMovie stored procedure
EXEC InsertMovie
    @Title = 'Titanic',
    @Certification = 1,
    @ReleaseDate = '2000-03-26',
    @Duration = 160,
    @PosterLink = 'http://poster.in',
    @TrailerLink = 'http://trailer.com',
    @GenreId = 1,
    @LanguageId = 1,
    @DirectorId = 1;