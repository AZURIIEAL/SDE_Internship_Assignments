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


--AddDirector queries.
EXEC AddLanguage 'English';
GO
EXEC AddLanguage 'Malayalam';
GO
EXEC AddLanguage 'Hindi';
GO
EXEC AddLanguage 'Tamil';
GO
EXEC AddLanguage 'Telugu';
GO

--AddCertification queries.
EXEC AddCertification 'A';
GO
EXEC AddCertification 'U/A';
GO
EXEC AddCertification 'U';
GO



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
INSERT INTO @Languages (Id) VALUES (1); -- LanguageId for 'English'

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

	SELECT * FROM MovieMate.Movie
	SELECT * FROM MovieMate.MovieGenre
	SELECT * FROM MovieMate.DirectorMovie
	sELECT * FROM MovieMate.MovieLanguage


-- Movie 2: Memento
	
-- Create a table variable to hold GenreIds
DECLARE @Genres MovieMate.EntityId;
INSERT INTO @Genres (Id) VALUES (1); -- GenreId for 'Action'
INSERT INTO @Genres (Id) VALUES (4); -- GenreId for 'Thriller'


-- Create a table variable to hold DirectorIds
DECLARE @Directors MovieMate.EntityId;
INSERT INTO @Directors (Id) VALUES (1); -- DirectorId for 'Christopher Nolan'

-- Create a table variable to hold LanguageIds
DECLARE @Languages MovieMate.EntityId;
INSERT INTO @Languages (Id) VALUES (1); -- LanguageId for 'English'

-- Insert Christopher Nolan's movies into the database

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

DECLARE @Genres MovieMate.EntityId;
INSERT INTO @Genres (Id) VALUES (3); -- GenreId for 'Drama'
INSERT INTO @Genres (Id) VALUES (4); -- GenreId for 'Thriller'

-- Create a table variable to hold DirectorIds
DECLARE @Directors MovieMate.EntityId;
INSERT INTO @Directors (Id) VALUES (1); -- DirectorId for 'Christopher Nolan'

-- Create a table variable to hold LanguageIds
DECLARE @Languages MovieMate.EntityId;
INSERT INTO @Languages (Id) VALUES (1); -- LanguageId for 'English'
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


	
-- Movie 4: Batman Begins'

-- Create a table variable to hold GenreIds
DECLARE @Genres MovieMate.EntityId;
INSERT INTO @Genres (Id) VALUES (1); -- GenreId for 'Action'
INSERT INTO @Genres (Id) VALUES (4); -- GenreId for 'Thriller'
INSERT INTO @Genres (Id) VALUES (5); -- GenreId for 'Sci-Fi'

-- Create a table variable to hold DirectorIds
DECLARE @Directors MovieMate.EntityId;
INSERT INTO @Directors (Id) VALUES (1); -- DirectorId for 'Christopher Nolan'

-- Create a table variable to hold LanguageIds
DECLARE @Languages MovieMate.EntityId;
INSERT INTO @Languages (Id) VALUES (1); -- LanguageId for 'English'
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

-- Create a table variable to hold GenreIds
DECLARE @Genres MovieMate.EntityId;
INSERT INTO @Genres (Id) VALUES (1); -- GenreId for 'Action'
INSERT INTO @Genres (Id) VALUES (3); -- GenreId for 'Drama'
INSERT INTO @Genres (Id) VALUES (4); -- GenreId for 'Thriller'

-- Create a table variable to hold DirectorIds
DECLARE @Directors MovieMate.EntityId;
INSERT INTO @Directors (Id) VALUES (1); -- DirectorId for 'Christopher Nolan'

-- Create a table variable to hold LanguageIds
DECLARE @Languages MovieMate.EntityId;
INSERT INTO @Languages (Id) VALUES (1); -- LanguageId for 'English'
EXEC AddMovie
    @Title = 'The Prestige',
    @Certification = 1,
    @ReleaseDate = '2006-10-20',
    @Duration = 130,
    @PosterLink = 'http://example.com/the_prestige_poster.jpg',
    @TrailerLink = 'http://example.com/the_prestige_trailer.mp4',
    @Description = 'A thrilling tale of rivalry between two magicians in Victorian-era London.',
    @GenreIds = @Genres,
    @DirectorIds = @Directors,
    @LanguageIds = @Languages;

	

-- Movie 6: The Dark Knight

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
INSERT INTO @Languages (Id) VALUES (1); -- LanguageId for 'English'
EXEC AddMovie
    @Title = 'The Dark Knight',
    @Certification = 1,
    @ReleaseDate = '2008-07-18',
    @Duration = 152,
    @PosterLink = 'http://example.com/the_dark_knight_poster.jpg',
    @TrailerLink = 'http://example.com/the_dark_knight_trailer.mp4',
    @Description = 'The Joker wreaks havoc in Gotham City, challenging Batman to the ultimate test of morality.',
    @GenreIds = @Genres,
    @DirectorIds = @Directors,
    @LanguageIds = @Languages;



-- Movie 7: Inception
	-- Create a table variable to hold GenreIds
DECLARE @Genres MovieMate.EntityId;
INSERT INTO @Genres (Id) VALUES (1); -- GenreId for 'Action'
INSERT INTO @Genres (Id) VALUES (3); -- GenreId for 'Drama'
INSERT INTO @Genres (Id) VALUES (4); -- GenreId for 'Thriller'

-- Create a table variable to hold DirectorIds
DECLARE @Directors MovieMate.EntityId;
INSERT INTO @Directors (Id) VALUES (1); -- DirectorId for 'Christopher Nolan'

-- Create a table variable to hold LanguageIds
DECLARE @Languages MovieMate.EntityId;
INSERT INTO @Languages (Id) VALUES (1); -- LanguageId for 'English'

EXEC AddMovie
    @Title = 'Inception',
    @Certification = 1,
    @ReleaseDate = '2010-07-16',
    @Duration = 148,
    @PosterLink = 'http://example.com/inception_poster.jpg',
    @TrailerLink = 'http://example.com/inception_trailer.mp4',
    @Description = 'A mind-bending heist film set within the realm of dreams.',
    @GenreIds = @Genres,
    @DirectorIds = @Directors,
    @LanguageIds = @Languages;



	
-- Movie 8: The Dark Knight Rises
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
INSERT INTO @Languages (Id) VALUES (1); -- LanguageId for 'English'

EXEC AddMovie
    @Title = 'The Dark Knight Rises',
    @Certification = 1,
    @ReleaseDate = '2012-07-20',
    @Duration = 165,
    @PosterLink = 'http://example.com/the_dark_knight_rises_poster.jpg',
    @TrailerLink = 'http://example.com/the_dark_knight_rises_trailer.mp4',
    @Description = 'Batman returns to face the formidable Bane, who plans to destroy Gotham City.',
    @GenreIds = @Genres,
    @DirectorIds = @Directors,
    @LanguageIds = @Languages;




	
-- Movie 9: Interstellar
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
INSERT INTO @Languages (Id) VALUES (1); -- LanguageId for 'English'
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
DECLARE @Genres MovieMate.EntityId;
INSERT INTO @Genres (Id) VALUES (1); -- GenreId for 'Action'
INSERT INTO @Genres (Id) VALUES (3); -- GenreId for 'Drama'

-- Create a table variable to hold DirectorIds
DECLARE @Directors MovieMate.EntityId;
INSERT INTO @Directors (Id) VALUES (1); -- DirectorId for 'Christopher Nolan'

-- Create a table variable to hold LanguageIds
DECLARE @Languages MovieMate.EntityId;
INSERT INTO @Languages (Id) VALUES (1); -- LanguageId for 'English'
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


SELECT * FROM MovieMate.Movie

-- Adding theatre info and seat info.

--AddDirector queries.
EXEC AddSeatCategory
	@TypeName = 'Economy',
	@Price = 250.00
GO


EXEC AddSeatCategory
	@TypeName = 'Executive',
	@Price = 350.00
GO
EXEC AddSeatCategory
	@TypeName = 'Gold',
	@Price = 500.00
GO

EXEC AddSeatCategory
	@TypeName = 'Balcony',
	@Price = 600.00
GO

EXEC AddSeatCategory
	@TypeName ='Luxury',
	@Price = 800.00
GO
SElect * from MovieMate.SeatCategory




DECLARE @ScreenData MovieMate.ScreenData;
INSERT INTO @ScreenData ([NAME],Capacity) VALUES ('Screen1',40 );

DECLARE @SeatData MovieMate.SeatType;
INSERT INTO @SeatData ([NAME],TypeId) VALUES ('A1',1 );
INSERT INTO @SeatData ([NAME],TypeId) VALUES ('A2',1 );
INSERT INTO @SeatData ([NAME],TypeId) VALUES ('A3',1 );
INSERT INTO @SeatData ([NAME],TypeId) VALUES ('A4',1 );
INSERT INTO @SeatData ([NAME],TypeId) VALUES ('A5',1 );
INSERT INTO @SeatData ([NAME],TypeId) VALUES ('B1',2 );
INSERT INTO @SeatData ([NAME],TypeId) VALUES ('B2',2 );
INSERT INTO @SeatData ([NAME],TypeId) VALUES ('B3',2 );
INSERT INTO @SeatData ([NAME],TypeId) VALUES ('B4',2 );
INSERT INTO @SeatData ([NAME],TypeId) VALUES ('B5',2 );
INSERT INTO @SeatData ([NAME],TypeId) VALUES ('C1',3 );
INSERT INTO @SeatData ([NAME],TypeId) VALUES ('C2',3 );
INSERT INTO @SeatData ([NAME],TypeId) VALUES ('C3',3 );
INSERT INTO @SeatData ([NAME],TypeId) VALUES ('C4',3 );
INSERT INTO @SeatData ([NAME],TypeId) VALUES ('C5',3 );
INSERT INTO @SeatData ([NAME],TypeId) VALUES ('D1',4 );
INSERT INTO @SeatData ([NAME],TypeId) VALUES ('D2',4 );
INSERT INTO @SeatData ([NAME],TypeId) VALUES ('D3',4 );
INSERT INTO @SeatData ([NAME],TypeId) VALUES ('D4',4 );
INSERT INTO @SeatData ([NAME],TypeId) VALUES ('D5',4 );

EXEC AddTheatre 
	@Name = 'Krishna Theatre',
	@LocationId = 80,
	@Address = 'NH 47 Bypass Road, near Bhima Theatre, Kazhakkoottam, Kerala',
	@ScreenData = @ScreenData,
	@SeatData = @SeatData



	
DECLARE @ScreenData MovieMate.ScreenData;
INSERT INTO @ScreenData ([NAME],Capacity) VALUES ('Screen1',40 );

DECLARE @SeatData MovieMate.SeatType;
INSERT INTO @SeatData ([NAME],TypeId) VALUES ('A1',1 );
INSERT INTO @SeatData ([NAME],TypeId) VALUES ('A2',1 );
INSERT INTO @SeatData ([NAME],TypeId) VALUES ('A3',1 );
INSERT INTO @SeatData ([NAME],TypeId) VALUES ('A4',1 );
INSERT INTO @SeatData ([NAME],TypeId) VALUES ('A5',1 );
INSERT INTO @SeatData ([NAME],TypeId) VALUES ('B1',2 );
INSERT INTO @SeatData ([NAME],TypeId) VALUES ('B2',2 );
INSERT INTO @SeatData ([NAME],TypeId) VALUES ('B3',2 );
INSERT INTO @SeatData ([NAME],TypeId) VALUES ('B4',2 );
INSERT INTO @SeatData ([NAME],TypeId) VALUES ('B5',2 );
INSERT INTO @SeatData ([NAME],TypeId) VALUES ('C1',3 );
INSERT INTO @SeatData ([NAME],TypeId) VALUES ('C2',3 );
INSERT INTO @SeatData ([NAME],TypeId) VALUES ('C3',3 );
INSERT INTO @SeatData ([NAME],TypeId) VALUES ('C4',3 );
INSERT INTO @SeatData ([NAME],TypeId) VALUES ('C5',3 );
INSERT INTO @SeatData ([NAME],TypeId) VALUES ('D1',4 );
INSERT INTO @SeatData ([NAME],TypeId) VALUES ('D2',4 );
INSERT INTO @SeatData ([NAME],TypeId) VALUES ('D3',4 );
INSERT INTO @SeatData ([NAME],TypeId) VALUES ('D4',4 );
INSERT INTO @SeatData ([NAME],TypeId) VALUES ('D5',4 );

EXEC AddScreen @TheatreId =2008 ,@ScreenData = @ScreenData,@seatData =@SeatData



	SELECT * FROM MovieMate.Theatre
	SELECT * FROM MovieMate.Screen
	SELECT * FROM MovieMate.Seat


EXEC RemoveTheatre @TheatreId = 4; 

EXEC AddTime @ShowTimeTile ='Morning Show',@Time= '10:00';
EXEC AddTime @ShowTimeTile ='Matinee Show',@Time= '14:00';
EXEC AddTime @ShowTimeTile ='Evening Show',@Time= '16:00';
EXEC AddTime @ShowTimeTile ='Second Show',@Time= '20:00';


EXEC AddShowTime 
@TimeId=5  ,
	@ScreenId=2 ,
	@MovieLanguageId =1,
	@Date='2023-07-26'

EXEC AddPaymentMethod @PaymentMethod = 'UPI Transaction'


EXEC AddUser 
    @Username = 'AZURIIEAL' ,
    @Email = 'Abinbinu678@gmail.com',
    @Password = '12345' ,
    @Address = 'ABC veed' 



DECLARE @Seats MovieMate.BookMovieMultipleSeat
INSERT INTO @Seats (SeatId) VALUES (2102); 
INSERT INTO @Seats (SeatId) VALUES (2103); 

EXEC BookMovie
@UserId = 1,
@TsId=1002,
@PaymentMethod = 1,
@seats =@Seats


SELECT * FROM MovieMate.BookingHeader
SELECT * FROM MovieMate.BookingDetails
SELECT * FROM MovieMate.[Language]
SELECT * FROM MovieMate.MovieLanguage
SELECT * FROM MovieMate.MovieGenre
SELECT * FROM MovieMate.Screen
SELECT * FROM MovieMate.[User]
SELECT * FROM MovieMate.ShowTime
SELECT * FRom MovieMate.[Time]
SELECT * FROM MovieMate.Seat
SELECT * FROM MovieMate.SeatCategory
SELECT * from MovieMate.Theatre
select * from MovieMate.[Location]
 
------
DELETE MovieMate.Theatre
DELETE MovieMate.Seat
DELETE MovieMate.Screen
DELETe MovieMate.BookingDetails
DELETE MovieMate.ShowTime
DELETE MovieMate.BookingHeader

EXEC AddShowTime
	@TimeId=5,
	@ScreenId=2008,
	@MovieLanguageId = 5,
	@Date ='2023-07-27'
EXEC AddShowTime
	@TimeId=6,
	@ScreenId=2008,
	@MovieLanguageId = 6,
	@Date ='2023-07-27'
EXEC AddShowTime
	@TimeId=7,
	@ScreenId=2008,
	@MovieLanguageId = 7,
	@Date ='2023-07-27'
EXEC AddShowTime
	@TimeId=8,
	@ScreenId=2008,
	@MovieLanguageId = 8,
	@Date ='2023-07-27'


	select * FROM MovieMate.[User]
	select * FROM MovieMate.ShowTime
	select * FROM MovieMate.PaymentMethod
	select * FROM MovieMate.Seat



