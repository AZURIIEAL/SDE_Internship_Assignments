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
CREATE OR ALTER PROCEDURE AddMovie
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
	DECLARE @MovieId INT = SCOPE_IDENTITY()

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


/*
DECLARE @ScreenData MovieMate.EntityId2;
INSERT INTO @ScreenData ([NAME],Capacity) VALUES ('A',40 );

DECLARE @SeatData MovieMate.EntityId2;
INSERT INTO @SeatData ([NAME{//Seatname}],Capacity{//TypeId}}) VALUES ('A1',1 );
INSERT INTO @SeatData ([NAME{//Seatname}],Capacity{//TypeId}}) VALUES ('A2',1 );
INSERT INTO @SeatData ([NAME{//Seatname}],Capacity{//TypeId}}) VALUES ('A3',1 );
INSERT INTO @SeatData ([NAME{//Seatname}],Capacity{//TypeId}}) VALUES ('A4',1 );
INSERT INTO @SeatData ([NAME{//Seatname}],Capacity{//TypeId}}) VALUES ('A5',1 );
INSERT INTO @SeatData ([NAME{//Seatname}],Capacity{//TypeId}}) VALUES ('B1',2 );
INSERT INTO @SeatData ([NAME{//Seatname}],Capacity{//TypeId}}) VALUES ('B2',2 );
INSERT INTO @SeatData ([NAME{//Seatname}],Capacity{//TypeId}}) VALUES ('B3',2 );
INSERT INTO @SeatData ([NAME{//Seatname}],Capacity{//TypeId}}) VALUES ('B4',2 );
INSERT INTO @SeatData ([NAME{//Seatname}],Capacity{//TypeId}}) VALUES ('B5',2 );
INSERT INTO @SeatData ([NAME{//Seatname}],Capacity{//TypeId}}) VALUES ('C1',3 );
INSERT INTO @SeatData ([NAME{//Seatname}],Capacity{//TypeId}}) VALUES ('C2',3 );
INSERT INTO @SeatData ([NAME{//Seatname}],Capacity{//TypeId}}) VALUES ('C3',3 );
INSERT INTO @SeatData ([NAME{//Seatname}],Capacity{//TypeId}}) VALUES ('C4',3 );
INSERT INTO @SeatData ([NAME{//Seatname}],Capacity{//TypeId}}) VALUES ('C5',3 );
INSERT INTO @SeatData ([NAME{//Seatname}],Capacity{//TypeId}}) VALUES ('D1',4 );
INSERT INTO @SeatData ([NAME{//Seatname}],Capacity{//TypeId}}) VALUES ('D2',4 );
INSERT INTO @SeatData ([NAME{//Seatname}],Capacity{//TypeId}}) VALUES ('D3',4 );
INSERT INTO @SeatData ([NAME{//Seatname}],Capacity{//TypeId}}) VALUES ('D4',4 );
INSERT INTO @SeatData ([NAME{//Seatname}],Capacity{//TypeId}}) VALUES ('D5',4 );

EXEC AddTheatre 
@Name = 'ABC theatre'
@LocationId = 1
@Address = 'XYZ lane tvm'
@ScreenData = ScreenData
@SeatData = SeatData
*/

 CREATE TYPE  MovieMate.SeatType AS TABLE(
	[NAME] VARCHAR(100),
    TypeId int
	);
GO
 CREATE TYPE  MovieMate.ScreenData AS TABLE(
	[NAME] VARCHAR(100),
    Capacity int
	);
GO

CREATE OR ALTER PROCEDURE AddSeat

	@ScreenID INT,
	@SeatData AS MovieMate.SeatType READONLY

	AS 
	BEGIN
	INSERT MovieMate.Seat(SeatName,TypeId,ScreenId)
	SELECT [NAME],TypeId,@ScreenId
	FROM @SeatData
	END;


GO


CREATE OR ALTER PROCEDURE AddScreen
	@TheatreId INT,
	@ScreenData AS MovieMate.ScreenData READONLY,
	@SeatData AS MovieMate.SeatType READONLY

	AS 
	BEGIN
	INSERT MovieMate.Screen([Name],Capacity,TheatreId)
	SELECT [NAME],Capacity,@TheatreId
	FROM @ScreenData
	DECLARE @ScreenId INT = SCOPE_IDENTITY()
	EXEC AddSeat @ScreenId = @ScreenId, @SeatData = @SeatData
	DECLARE @Capacity INT ;
	SET @Capacity =(SELECT COUNT(*) FROM MovieMate.Screen Scr
	LEFT JOIN MovieMate.Seat Sea ON Scr.ScreenId = Sea.ScreenId WHERE Sea.ScreenId=@ScreenId)
	
	UPDATE MovieMate.Screen 
	SET Capacity = @Capacity
	WHERE ScreenId=@ScreenId
	END;
	
GO


--Procedure to add theatres
CREATE OR ALTER PROCEDURE AddTheatre
	@Name VARCHAR(100),
	@LocationId INT,
	@Address VARCHAR(200),
	@ScreenData AS MovieMate.ScreenData READONLY,
	@SeatData AS MovieMate.SeatType READONLY
AS 
BEGIN
	INSERT INTO MovieMate.Theatre([Name],LocationId,[Address]) VALUES(@Name,@LocationId,@Address)
	-- @@Identity 
	DECLARE @TheatreId1 INT =  SCOPE_IDENTITY()
	--Add Screen and seat
	EXEC AddScreen @TheatreId = @TheatreId1 ,@ScreenData = @ScreenData,@SeatData=@SeatData
	DECLARE @ScreenID int
	SELECT @ScreenID = ScreenId
	FROM MovieMate.Screen
	WHERE TheatreId = @TheatreId1
END; 

go
--Add Time Procedure.
CREATE OR ALTER PROCEDURE AddTime
	@Time TIME,
	@ShowTimeTile VARCHAR(100)
	AS
	BEGIN
	INSERT INTO MovieMate.Time([Time],ShowTimeTitle) VALUES(@Time,@ShowTimeTile)
	END

go
	--Add Payment Method.
CREATE OR ALTER PROCEDURE AddPaymentMethod
	@PaymentMethod VARCHAR(100)
	AS
	BEGIN
	INSERT INTO MovieMate.PaymentMethod(PaymentMethod) VALUES(@PaymentMethod)
	END
	
	go
--Add ShowTime Procedure.
CREATE OR ALTER PROCEDURE AddShowTime
	@TimeId INT,
	@ScreenId INT,
	@MovieLanguageId INT,
	@Date DATE

	AS
	BEGIN
	INSERT INTO MovieMate.ShowTime([TimeId],[ScreenId],[MovieLanguageId],[Date]) VALUES(@TimeId,@ScreenId,@MovieLanguageId,@Date)
	END

	go
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



	 





