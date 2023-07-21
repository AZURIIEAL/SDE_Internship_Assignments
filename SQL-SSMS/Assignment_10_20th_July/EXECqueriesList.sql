--Execution queries.

--InsertUser stored procedure
EXEC InsertUser
    @Username = 'Abin',
    @Email = 'test@gmail.com',
    @Password = 'password123',
    @Address = 'ABC TVM';

EXEC InsertUser 'Ashiq' ,'abc@gmail.com', '1234' ,'ASD TVM'
	
--InsertMovie stored procedure
EXEC InsertMovie
    @Title = 'Titanic',
    @Certification = 1,
    @ReleaseDate = '2000-03-26',
    @Duration = 160,
    @PosterLink = 'http://poster.in',
    @TrailerLink = 'http://trailer.com',
	@Description = 'good comedy'