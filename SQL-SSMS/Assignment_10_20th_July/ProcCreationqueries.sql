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

GO

 --Create Procedure to add theatre.
--Creating a type to set the values.
 CREATE TYPE  MovieMate.EntityId2 AS TABLE(
	[NAME] VARCHAR(100),
    capacity int
	);
GO




CREATE PROCEDURE AddTheatre
	@Name VARCHAR(100),
	@LocationId INT,
	@Address VARCHAR(200),
	@ScreenData AS MovieMate.EntityId2 READONLY,
	@SeatData AS MovieMate.EntityId2 READONLY

	AS 
	BEGIN

	DECLARE @inserted Table (InsertedId INT)


	INSERT INTO MovieMate.Theatre([Name],LocationId,[Address]) VALUES(@Name,@LocationId,@Address)
	-- @@Identity @scope_identity 
	DECLARE @TheatreId INT = @@Identity


	INSERT MovieMate.Screen([Name],Capacity,TheatreId)
	OUTPUT inserted.ScreenID INTO @inserted
	SELECT [NAME],Capacity,@TheatreId
	FROM @ScreenData

	DECLARE @ScreenID INT = @@Identity

	INSERT MovieMate.Seat(ScreenId, TypeId,SeatName)
	SELECT B.InsertedId, [Name],Capacity
	FROM @SeatData A
	CROSS JOIN @inserted B
	END; 



	

	--addd a coloumn.
ALTER TABLE MovieMate.Screen 
ADD TheatreId INT CONSTRAINT FK_Screen_TheatreId  FOREIGN KEY (TheatreId) REFERENCES MovieMate.[Theatre](TheatreId)

ALTER TABLE MovieMate.Seat ADD SeatName VARCHAR(50)




CREATE TYPE  MovieMate.EntityId2 AS TABLE(
	[NAME] VARCHAR(100),
    capacity int
	);
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
CREATE PROCEDURE AddSeat

	@ScreenID INT,
	@SeatData AS MovieMate.EntityId2 READONLY

	AS 
	BEGIN
	INSERT MovieMate.Seat(SeatName,TypeId,ScreenId)
	SELECT [NAME],Capacity,@ScreenId
	FROM @SeatData
	END;


GO
CREATE PROCEDURE AddScreen
	@TheatreId INT,
	@ScreenData AS MovieMate.EntityId2 READONLY

	AS 
	BEGIN
	INSERT MovieMate.Screen([Name],Capacity,TheatreId)
	SELECT [NAME],Capacity,@TheatreId
	FROM @ScreenData
	END;


GO
ALTER PROCEDURE AddTheatre
	@Name VARCHAR(100),
	@LocationId INT,
	@Address VARCHAR(200),
	@ScreenData AS MovieMate.EntityId2 READONLY,
	@SeatData AS MovieMate.EntityId2 READONLY

AS 
BEGIN

	INSERT INTO MovieMate.Theatre([Name],LocationId,[Address]) VALUES(@Name,@LocationId,@Address)
	-- @@Identity 
	DECLARE @TheatreId1 INT = @@Identity


	EXEC AddScreen @TheatreId = @TheatreId1 ,@ScreenData = @ScreenData

	DECLARE @ScreenID int
	SELECT @ScreenID = ScreenId
	FROM MovieMate.Screen
	WHERE TheatreId = @TheatreId1

		--Add Seat
	EXEC AddSeat @ScreenId = @ScreenID, @SeatData = @SeatData
END; 



CREATE PROCEDURE RemoveTheatre
	@TheatreId INT
AS 
BEGIN
	-- Delete seats associated with the theatre's screens
	DELETE FROM MovieMate.Seat
	WHERE ScreenId IN (SELECT ScreenId FROM MovieMate.Screen WHERE TheatreId = @TheatreId)

	-- Delete screens associated with the theatre
	DELETE FROM MovieMate.Screen WHERE TheatreId = @TheatreId

	-- Delete the theatre
	DELETE FROM MovieMate.Theatre WHERE TheatreId = @TheatreId
END;









