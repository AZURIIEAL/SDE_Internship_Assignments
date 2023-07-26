--1. GetMoviesByLanguages , Place , Genres
CREATE TYPE MovieMate.FilterItems AS TABLE(
[Items] INT
);
GO
CREATE OR ALTER PROCEDURE FilterMovies
	@Location INT,
	@Genre AS MovieMate.FilterItems READONLY ,
	@Language AS MovieMate.FilterItems READONLY

	AS 
		BEGIN
			SELECT DISTINCT ST.* 
				FROM MovieMate.[Location] L
				LEFT JOIN MovieMate.Theatre T ON L.LocationId = T.LocationId 
				LEFT JOIN MovieMate.Screen S ON T.TheatreId =S.TheatreId
				LEFT JOIN MovieMate.ShowTime ST ON S.ScreenId = ST.ScreenId AND ST.Date > CAST(GETDATE() AS DATE)
				LEFT JOIN MovieMate.MovieLanguage ML ON ST.MovieLanguageId = ML.MovieLanguageId 
				LEFT JOIN MovieMate.MovieGenre MG ON MG.MovieId = ML.MovieId 
				WHERE
				(L.LocationId = @Location)
				AND ( MG.MovieGenreId IN (SELECT Items FROM @Genre))
				AND ( ML.MovieLanguageId IN (SELECT Items FROM @Language))	

	END;

	--EXEC---

	DECLARE @i MovieMate.FilterItems --For Genre
	INSERT INTO @i ([Items]) VALUES ( 1);
	INSERT INTO @i ([Items]) VALUES ( 3);
	INSERT INTO @i ([Items]) VALUES (4 );


	DECLARE @j MovieMate.FilterItems --For Language
	INSERT INTO @j ([Items]) VALUES ( 1);
	EXEC FilterMovies
	@Location =2,
	@Genre =  @i,
	@Language =@j

go


--2. GetShowDetails by Movie Language Id
CREATE OR ALTER PROCEDURE FilterByLanguageId
	@LanguageId AS MovieMate.FilterItems READONLY
	AS 
		BEGIN 
			SELECT * FROM MovieMate.ShowTime ST
			LEFT JOIN MovieMate.MovieLanguage ML ON ML.MovieLanguageId = ST.MovieLanguageId
			WHERE  ML.LanguageId IN (SELECT [Items] FROM @LanguageId);

	END;

	--EXEC---
	DECLARE @i MovieMate.FilterItems --For Genre
	INSERT INTO @i ([Items]) VALUES ( 1);

	EXEC FilterByLanguageId
	@LanguageId = @i


go
--3.GetSeatInfoByShowId
CREATE OR ALTER PROCEDURE GetSeatInfoByShowId
@ShowId INT
	AS
		BEGIN
			SELECT ScreenId,SeatName,
			CASE
				WHEN SeatId IN(SELECT BD.SeatId FROM MovieMate.BookingDetails BD
				LEFT JOIN MovieMate.Seat S ON S.SeatId = BD.SeatId )
			THEN 'Booked'
				 ELSE 'NotBooked'
			END AS Status

			FROM (SELECT * FROM MovieMate.Seat WHERE ScreenId IN (SELECT ScreenId FROM MovieMate.ShowTime WHERE TsId=1002))t;


			
	END;

GO
--4. Book Tickets ( Adding a new entry to booking table)  



	--Creating a type
CREATE TYPE MovieMate.BookMovieMultipleSeat AS TABLE(
    [SeatId] int 
);
GO
--Booking Procedures
CREATE OR ALTER PROCEDURE BookMovie
	@UserId INT,
	@TsId INT,
	@Paymentmethod INT,
	@Seats AS MovieMate.BookMovieMultipleSeat READONLY
	AS
	BEGIN
	INSERT INTO MovieMate.BookingHeader(UserId,TsId,PaymentMethod) VALUES(@UserId,@TsId,@Paymentmethod);
	DECLARE @BookingId INT = SCOPE_IDENTITY();
	INSERT  MovieMate.BookingDetails(BookingId,SeatId) 
	SELECT @BookingId, [SeatId]
	FROM @Seats;
	--Total Tickets
	DECLARE @TotalTickets INT;
	SET @TotalTickets = (SELECT COUNT(BookingId) FROM MovieMate.BookingDetails);
	--Total Price
	DECLARE @TotalPrice INT;
	SET @TotalPrice = (SELECT SUM(Price) FROM MovieMate.BookingDetails BD 
	LEFT JOIN MovieMate.Seat S ON BD.SeatId=S.SeatId
	LEFT JOIN MovieMate.SeatCategory SC ON S.TypeId = SC.TypeId)

	UPDATE MovieMate.BookingHeader
	SET TotalAmount = @TotalPrice,NumTickets = @TotalTickets
	WHERE BookingId=@BookingId
	END

GO
--5. sp to get booked ticket details

CREATE OR ALTER PROCEDURE TicketDetails
@BookingId INT
AS
BEGIN
SELECT M.Title,T.[Name],L.[Language],S.[Name],BH.NumTickets,BH.TotalAmount FROM MovieMate.ShowTime ST
INNER JOIN  MovieMate.MovieLanguage ML ON ML.MovieLanguageId=ST.MovieLanguageId
INNER JOIN MovieMate.Movie M ON ML.MovieId = M.MovieId
INNER JOIN MovieMate.[Language] L ON L.LanguageId = ML.LanguageId
INNER JOIN MovieMate.BookingHeader BH ON ST.TsId = BH.TsId
INNER JOIN MovieMate.Screen S ON S.ScreenId = ST.ScreenId
INNER JOIN MovieMate.Theatre T ON S.TheatreId = T.TheatreId
INNER JOIN MovieMate.BookingDetails BD ON BH.BookingId = BD.BookingId
INNER JOIN MovieMate.Seat SE ON BD.SeatId = SE.ScreenId
WHERE BH.BookingId = @BookingId
END

SELECT * FROM MovieMate.BookingHeader
EXEC TicketDetails @BookingId = 7





