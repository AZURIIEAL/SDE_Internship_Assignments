--Replacement for Add theatre

CREATE TYPE ScreenInfo AS TABLE(
	ScreenName VARCHAR(100)
);
CREATE TYPE SeatInfo AS TABLE(
	ScreenId INT,
	SeatName VARCHAR(100),
	typeId INT
);

DROP TYPE  SeatInfo
CREATE OR ALTER PROCEDURE AddTheatre
	@Name VARCHAR(100),
	@LocationId INT,
	@Address VARCHAR(200),
	@ScreenName AS ScreenInfo READONLY,
    @Seat AS SeatInfo READONLY
	
AS 
BEGIN
	INSERT INTO MovieMate.Theatre([Name],LocationId,[Address]) VALUES(@Name,@LocationId,@Address)
	-- @@Identity 
	DECLARE @TheatreId1 INT =  SCOPE_IDENTITY()
	DECLARE @middleTable TABLE(
    middleTableID INT,
    middleTableName VARCHAR(100))

	INSERT MovieMate.Screen([Name],TheatreId)
	--Using output to capture the values.
    OUTPUT inserted.ScreenId,inserted.[Name] INTO @middleTable
    SELECT ScreenName,@TheatreId1
    FROM @ScreenName 

    INSERT  MovieMate.Seat(SeatName,TypeId,ScreenId)
    SELECT Sea.SeatName,Sea.typeId,Mt.middleTableID
    FROM @Seat Sea
    INNER JOIN @middleTable Mt
    ON Mt.middleTableID = Sea.ScreenId

	
END; 

go
SELECT * FROM MovieMate.Seat