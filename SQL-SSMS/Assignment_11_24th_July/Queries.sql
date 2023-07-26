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



--3.GetSeatInfoByShowId



