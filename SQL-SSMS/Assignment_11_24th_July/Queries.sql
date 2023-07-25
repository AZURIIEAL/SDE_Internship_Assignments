--1. GetMoviesByLanguages , Place , Genres
CREATE TYPE MovieMate.FilterItems AS TABLE(
[Items] INT
);
GO
CREATE PROCEDURE FilterMovies
	@Location INT,
	@Genre AS MovieMate.FilterItems READONLY ,
	@Language AS MovieMate.FilterItems READONLY

	AS 
		BEGIN
			SELECT * 
			FROM 
			 (
				SELECT L.* 
				FROM MovieMate.[Location] L
				LEFT JOIN MovieMate.Theatre T ON L.LocationId = T.LocationId AND L.LocationId = @Location
				LEFT JOIN MovieMate.Screen S ON T.TheatreId =S.TheatreId
				LEFT JOIN MovieMate.ShowTime ST ON S.ScreenId = ST.ScreenId
				LEFT JOIN MovieMate.MovieLanguage ML ON ST.MovieLanguageId = ML.MovieLanguageId 
				LEFT JOIN MovieMate.MovieGenre MG ON MG.MovieId = ML.MovieId 
				WHERE
				(@Location IS NULL OR L.LocationId = @Location)
				AND (NOT EXISTS(SELECT 1 FROM @Genre) OR MG.MovieGenreId IN (SELECT Items FROM @Genre))
				AND (NOT EXISTS(SELECT 1 FROM @Language) OR ML.MovieLanguageId IN (SELECT Items FROM @Language))	
			)temp
	END;


-- LocationId
-- Genre
-- 




