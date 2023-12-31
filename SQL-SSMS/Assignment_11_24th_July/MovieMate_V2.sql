USE [MovieMate]
GO
/****** Object:  Schema [MovieMate]    Script Date: 25-07-2023 09:02:54 ******/
CREATE SCHEMA [MovieMate]
GO
/****** Object:  UserDefinedTableType [MovieMate].[EntityId]    Script Date: 25-07-2023 09:02:54 ******/
CREATE TYPE [MovieMate].[EntityId] AS TABLE(
	[Id] [int] NULL
)
GO
/****** Object:  UserDefinedTableType [MovieMate].[EntityId2]    Script Date: 25-07-2023 09:02:54 ******/
CREATE TYPE [MovieMate].[EntityId2] AS TABLE(
	[Name] [varchar](100) NULL,
	[Capacity] [int] NULL
)
GO
/****** Object:  Table [MovieMate].[BookingDetails]    Script Date: 25-07-2023 09:02:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [MovieMate].[BookingDetails](
	[BookingDetailsId] [int] IDENTITY(1,1) NOT NULL,
	[BookingId] [int] NULL,
	[SeatId] [int] NULL,
 CONSTRAINT [PK_BookingDetails_BookingDetailsId] PRIMARY KEY CLUSTERED 
(
	[BookingDetailsId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [MovieMate].[BookingHeader]    Script Date: 25-07-2023 09:02:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [MovieMate].[BookingHeader](
	[BookingId] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NULL,
	[TsId] [int] NULL,
	[NumTickets] [int] NULL,
	[TotalAmount] [decimal](10, 2) NULL,
	[BookingDate] [datetime] NOT NULL,
	[PaymentMethod] [int] NULL,
 CONSTRAINT [PK_BookingHeader_BookingId] PRIMARY KEY CLUSTERED 
(
	[BookingId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [MovieMate].[Certification]    Script Date: 25-07-2023 09:02:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [MovieMate].[Certification](
	[CertificationId] [int] IDENTITY(1,1) NOT NULL,
	[Certification] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Certification_CertificationId] PRIMARY KEY CLUSTERED 
(
	[CertificationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [MovieMate].[Director]    Script Date: 25-07-2023 09:02:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [MovieMate].[Director](
	[DirectorId] [int] IDENTITY(1,1) NOT NULL,
	[DirectorName] [varchar](255) NOT NULL,
 CONSTRAINT [PK_Director_DirectorId] PRIMARY KEY CLUSTERED 
(
	[DirectorId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [MovieMate].[DirectorMovie]    Script Date: 25-07-2023 09:02:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [MovieMate].[DirectorMovie](
	[DirectorMovieId] [int] IDENTITY(1,1) NOT NULL,
	[MovieId] [int] NULL,
	[DirectorId] [int] NULL,
 CONSTRAINT [PK_DirectorMovie_DirectorMovieId] PRIMARY KEY CLUSTERED 
(
	[DirectorMovieId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [MovieMate].[Genre]    Script Date: 25-07-2023 09:02:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [MovieMate].[Genre](
	[GenreId] [int] IDENTITY(1,1) NOT NULL,
	[Genre] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Genre_GenreId] PRIMARY KEY CLUSTERED 
(
	[GenreId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [MovieMate].[Language]    Script Date: 25-07-2023 09:02:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [MovieMate].[Language](
	[LanguageId] [int] IDENTITY(1,1) NOT NULL,
	[Language] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Language_LanguageId] PRIMARY KEY CLUSTERED 
(
	[LanguageId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [MovieMate].[Location]    Script Date: 25-07-2023 09:02:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [MovieMate].[Location](
	[LocationId] [int] IDENTITY(1,1) NOT NULL,
	[Zipcode] [int] NOT NULL,
	[Name] [varchar](100) NULL,
 CONSTRAINT [PK_Location_LocationId] PRIMARY KEY CLUSTERED 
(
	[LocationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[Zipcode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [MovieMate].[Movie]    Script Date: 25-07-2023 09:02:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [MovieMate].[Movie](
	[MovieId] [int] IDENTITY(1,1) NOT NULL,
	[Title] [varchar](100) NOT NULL,
	[Certification] [int] NULL,
	[ReleaseDate] [date] NOT NULL,
	[Duration] [int] NOT NULL,
	[PosterLink] [varchar](200) NULL,
	[TrailerLink] [varchar](200) NULL,
	[Description] [text] NULL,
	[CreatedAt] [datetime] NOT NULL,
 CONSTRAINT [PK_Movie_MovieId] PRIMARY KEY CLUSTERED 
(
	[MovieId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [MovieMate].[MovieGenre]    Script Date: 25-07-2023 09:02:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [MovieMate].[MovieGenre](
	[MovieGenreId] [int] IDENTITY(1,1) NOT NULL,
	[MovieId] [int] NULL,
	[GenreId] [int] NULL,
 CONSTRAINT [PK_MovieGenre_GenreMovieId] PRIMARY KEY CLUSTERED 
(
	[MovieGenreId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [MovieMate].[MovieLanguage]    Script Date: 25-07-2023 09:02:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [MovieMate].[MovieLanguage](
	[MovieLanguageId] [int] IDENTITY(1,1) NOT NULL,
	[MovieId] [int] NULL,
	[LanguageId] [int] NULL,
 CONSTRAINT [PK_MovieLanguage_MovieLanguageId] PRIMARY KEY CLUSTERED 
(
	[MovieLanguageId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [MovieMate].[PaymentMethod]    Script Date: 25-07-2023 09:02:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [MovieMate].[PaymentMethod](
	[PaymentMethodId] [int] NOT NULL,
	[PaymentMethod] [varchar](100) NOT NULL,
 CONSTRAINT [PK_PaymentMethod_PaymentMethodId] PRIMARY KEY CLUSTERED 
(
	[PaymentMethodId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [MovieMate].[Screen]    Script Date: 25-07-2023 09:02:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [MovieMate].[Screen](
	[ScreenId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](100) NOT NULL,
	[Capacity] [int] NOT NULL,
	[TheatreId] [int] NULL,
 CONSTRAINT [PK_Screen_ScreenId] PRIMARY KEY CLUSTERED 
(
	[ScreenId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [MovieMate].[Seat]    Script Date: 25-07-2023 09:02:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [MovieMate].[Seat](
	[SeatId] [int] IDENTITY(1,1) NOT NULL,
	[TypeId] [int] NOT NULL,
	[ScreenId] [int] NULL,
	[SeatName] [varchar](50) NULL,
 CONSTRAINT [PK_Seat_SeatId] PRIMARY KEY CLUSTERED 
(
	[SeatId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [MovieMate].[SeatCategory]    Script Date: 25-07-2023 09:02:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [MovieMate].[SeatCategory](
	[TypeId] [int] IDENTITY(1,1) NOT NULL,
	[TypeName] [varchar](50) NOT NULL,
	[Price] [decimal](10, 2) NOT NULL,
 CONSTRAINT [PK_SeatCategory_TypeId] PRIMARY KEY CLUSTERED 
(
	[TypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [MovieMate].[ShowTime]    Script Date: 25-07-2023 09:02:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [MovieMate].[ShowTime](
	[TsId] [int] IDENTITY(1,1) NOT NULL,
	[TimeId] [int] NULL,
	[ScreenId] [int] NULL,
	[MovieLanguageId] [int] NULL,
	[Date] [date] NULL,
	[CreatedAt] [datetime] NULL,
 CONSTRAINT [PK_ShowTime_TsId] PRIMARY KEY CLUSTERED 
(
	[TsId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [MovieMate].[Theatre]    Script Date: 25-07-2023 09:02:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [MovieMate].[Theatre](
	[TheatreId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](100) NOT NULL,
	[LocationId] [int] NULL,
	[Address] [varchar](200) NOT NULL,
	[RegistrationDate] [datetime] NOT NULL,
 CONSTRAINT [PK_Theatre_TheatreId] PRIMARY KEY CLUSTERED 
(
	[TheatreId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [MovieMate].[Time]    Script Date: 25-07-2023 09:02:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [MovieMate].[Time](
	[TimeId] [int] IDENTITY(1,1) NOT NULL,
	[ShowTimeTitle] [varchar](100) NOT NULL,
 CONSTRAINT [PK_Time_TimeId] PRIMARY KEY CLUSTERED 
(
	[TimeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [MovieMate].[User]    Script Date: 25-07-2023 09:02:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [MovieMate].[User](
	[UserId] [int] IDENTITY(1,1) NOT NULL,
	[Username] [varchar](100) NOT NULL,
	[Email] [varchar](100) NOT NULL,
	[Password] [varchar](100) NOT NULL,
	[RegistrationDate] [datetime] NOT NULL,
	[Address] [varchar](255) NULL,
 CONSTRAINT [PK_User_UserId] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[Username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [MovieMate].[BookingHeader] ADD  DEFAULT (getdate()) FOR [BookingDate]
GO
ALTER TABLE [MovieMate].[Movie] ADD  DEFAULT (getdate()) FOR [CreatedAt]
GO
ALTER TABLE [MovieMate].[ShowTime] ADD  DEFAULT (getdate()) FOR [CreatedAt]
GO
ALTER TABLE [MovieMate].[Theatre] ADD  DEFAULT (getdate()) FOR [RegistrationDate]
GO
ALTER TABLE [MovieMate].[User] ADD  DEFAULT (getdate()) FOR [RegistrationDate]
GO
ALTER TABLE [MovieMate].[BookingDetails]  WITH CHECK ADD  CONSTRAINT [FK_BookingDetails_BookingId] FOREIGN KEY([BookingId])
REFERENCES [MovieMate].[BookingHeader] ([BookingId])
GO
ALTER TABLE [MovieMate].[BookingDetails] CHECK CONSTRAINT [FK_BookingDetails_BookingId]
GO
ALTER TABLE [MovieMate].[BookingDetails]  WITH CHECK ADD  CONSTRAINT [FK_BookingDetails_SeatId] FOREIGN KEY([SeatId])
REFERENCES [MovieMate].[Seat] ([SeatId])
GO
ALTER TABLE [MovieMate].[BookingDetails] CHECK CONSTRAINT [FK_BookingDetails_SeatId]
GO
ALTER TABLE [MovieMate].[BookingHeader]  WITH CHECK ADD  CONSTRAINT [FK_BookingHeader_PaymentMethod] FOREIGN KEY([PaymentMethod])
REFERENCES [MovieMate].[PaymentMethod] ([PaymentMethodId])
GO
ALTER TABLE [MovieMate].[BookingHeader] CHECK CONSTRAINT [FK_BookingHeader_PaymentMethod]
GO
ALTER TABLE [MovieMate].[BookingHeader]  WITH CHECK ADD  CONSTRAINT [FK_BookingHeader_TsId] FOREIGN KEY([TsId])
REFERENCES [MovieMate].[ShowTime] ([TsId])
GO
ALTER TABLE [MovieMate].[BookingHeader] CHECK CONSTRAINT [FK_BookingHeader_TsId]
GO
ALTER TABLE [MovieMate].[BookingHeader]  WITH CHECK ADD  CONSTRAINT [FK_BookingHeader_UserId] FOREIGN KEY([UserId])
REFERENCES [MovieMate].[User] ([UserId])
GO
ALTER TABLE [MovieMate].[BookingHeader] CHECK CONSTRAINT [FK_BookingHeader_UserId]
GO
ALTER TABLE [MovieMate].[DirectorMovie]  WITH CHECK ADD  CONSTRAINT [FK_DirectorMovie_DirectorId] FOREIGN KEY([DirectorId])
REFERENCES [MovieMate].[Director] ([DirectorId])
GO
ALTER TABLE [MovieMate].[DirectorMovie] CHECK CONSTRAINT [FK_DirectorMovie_DirectorId]
GO
ALTER TABLE [MovieMate].[DirectorMovie]  WITH CHECK ADD  CONSTRAINT [FK_DirectorMovie_MovieId] FOREIGN KEY([MovieId])
REFERENCES [MovieMate].[Movie] ([MovieId])
GO
ALTER TABLE [MovieMate].[DirectorMovie] CHECK CONSTRAINT [FK_DirectorMovie_MovieId]
GO
ALTER TABLE [MovieMate].[MovieGenre]  WITH CHECK ADD  CONSTRAINT [FK_MovieGenre_GenreId] FOREIGN KEY([GenreId])
REFERENCES [MovieMate].[Genre] ([GenreId])
GO
ALTER TABLE [MovieMate].[MovieGenre] CHECK CONSTRAINT [FK_MovieGenre_GenreId]
GO
ALTER TABLE [MovieMate].[MovieGenre]  WITH CHECK ADD  CONSTRAINT [FK_MovieGenre_MovieId] FOREIGN KEY([MovieId])
REFERENCES [MovieMate].[Movie] ([MovieId])
GO
ALTER TABLE [MovieMate].[MovieGenre] CHECK CONSTRAINT [FK_MovieGenre_MovieId]
GO
ALTER TABLE [MovieMate].[MovieLanguage]  WITH CHECK ADD  CONSTRAINT [FK_MovieLanguage_LanguageId] FOREIGN KEY([LanguageId])
REFERENCES [MovieMate].[Language] ([LanguageId])
GO
ALTER TABLE [MovieMate].[MovieLanguage] CHECK CONSTRAINT [FK_MovieLanguage_LanguageId]
GO
ALTER TABLE [MovieMate].[MovieLanguage]  WITH CHECK ADD  CONSTRAINT [FK_MovieLanguage_MovieId] FOREIGN KEY([MovieId])
REFERENCES [MovieMate].[Movie] ([MovieId])
GO
ALTER TABLE [MovieMate].[MovieLanguage] CHECK CONSTRAINT [FK_MovieLanguage_MovieId]
GO
ALTER TABLE [MovieMate].[Screen]  WITH CHECK ADD  CONSTRAINT [FK_Screen_TheatreId] FOREIGN KEY([TheatreId])
REFERENCES [MovieMate].[Theatre] ([TheatreId])
GO
ALTER TABLE [MovieMate].[Screen] CHECK CONSTRAINT [FK_Screen_TheatreId]
GO
ALTER TABLE [MovieMate].[Seat]  WITH CHECK ADD FOREIGN KEY([TypeId])
REFERENCES [MovieMate].[SeatCategory] ([TypeId])
GO
ALTER TABLE [MovieMate].[Seat]  WITH CHECK ADD  CONSTRAINT [FK_Seat_ScreenId] FOREIGN KEY([ScreenId])
REFERENCES [MovieMate].[Screen] ([ScreenId])
GO
ALTER TABLE [MovieMate].[Seat] CHECK CONSTRAINT [FK_Seat_ScreenId]
GO
ALTER TABLE [MovieMate].[ShowTime]  WITH CHECK ADD  CONSTRAINT [FK_ShowTime_MovieLanguageId] FOREIGN KEY([MovieLanguageId])
REFERENCES [MovieMate].[MovieLanguage] ([MovieLanguageId])
GO
ALTER TABLE [MovieMate].[ShowTime] CHECK CONSTRAINT [FK_ShowTime_MovieLanguageId]
GO
ALTER TABLE [MovieMate].[ShowTime]  WITH CHECK ADD  CONSTRAINT [FK_ShowTime_ScreenId] FOREIGN KEY([ScreenId])
REFERENCES [MovieMate].[Screen] ([ScreenId])
GO
ALTER TABLE [MovieMate].[ShowTime] CHECK CONSTRAINT [FK_ShowTime_ScreenId]
GO
ALTER TABLE [MovieMate].[ShowTime]  WITH CHECK ADD  CONSTRAINT [FK_ShowTime_TimeId] FOREIGN KEY([TimeId])
REFERENCES [MovieMate].[Time] ([TimeId])
GO
ALTER TABLE [MovieMate].[ShowTime] CHECK CONSTRAINT [FK_ShowTime_TimeId]
GO
ALTER TABLE [MovieMate].[Theatre]  WITH CHECK ADD  CONSTRAINT [FK_Theatre_LocationId] FOREIGN KEY([LocationId])
REFERENCES [MovieMate].[Location] ([LocationId])
GO
ALTER TABLE [MovieMate].[Theatre] CHECK CONSTRAINT [FK_Theatre_LocationId]
GO
/****** Object:  StoredProcedure [dbo].[AddCertification]    Script Date: 25-07-2023 09:02:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--Create the stored procedure to insert data into the Certification  table
CREATE PROCEDURE [dbo].[AddCertification]
    @Certification VARCHAR(50)
AS
BEGIN
    INSERT INTO MovieMate.[Certification] ([Certification])
    VALUES (@Certification);
END;

GO
/****** Object:  StoredProcedure [dbo].[AddDirector]    Script Date: 25-07-2023 09:02:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--Create the stored procedure to insert data into the Director table
CREATE PROCEDURE [dbo].[AddDirector]
	@DirectorName VARCHAR(255)
AS
BEGIN
    INSERT INTO MovieMate.[Director]([DirectorName])
    VALUES (@DirectorName);
END;

GO
/****** Object:  StoredProcedure [dbo].[AddGenre]    Script Date: 25-07-2023 09:02:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--Create the stored procedure to insert data into the Genre  table
CREATE PROCEDURE [dbo].[AddGenre]
    @Genre VARCHAR(50)
AS
BEGIN
    INSERT INTO MovieMate.[Genre] ([Genre])
    VALUES (@Genre);
END;

GO
/****** Object:  StoredProcedure [dbo].[AddLanguage]    Script Date: 25-07-2023 09:02:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[AddLanguage] 
    @Language VARCHAR(50)
AS
BEGIN
    INSERT INTO MovieMate.[Language] ([Language])
    VALUES (@Language);
END;

GO
/****** Object:  StoredProcedure [dbo].[AddLocation]    Script Date: 25-07-2023 09:02:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--Create the stored procedure to insert data into the Location table
CREATE PROCEDURE [dbo].[AddLocation] 
    @Zipcode INT,
	@Name VARCHAR(50)
AS
BEGIN
    INSERT INTO MovieMate.[Location]([Zipcode],[Name])
    VALUES (@Zipcode,@Name);
END;

GO
/****** Object:  StoredProcedure [dbo].[AddMovie]    Script Date: 25-07-2023 09:02:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- Create the stored procedure to insert data into the Movie table
CREATE PROCEDURE [dbo].[AddMovie]
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
/****** Object:  StoredProcedure [dbo].[AddScreen]    Script Date: 25-07-2023 09:02:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[AddScreen]
	@TheatreId INT,
	@ScreenData AS MovieMate.EntityId2 READONLY

	AS 
	BEGIN
	INSERT MovieMate.Screen([Name],Capacity,TheatreId)
	SELECT [NAME],Capacity,@TheatreId
	FROM @ScreenData

	END
GO
/****** Object:  StoredProcedure [dbo].[AddSeat]    Script Date: 25-07-2023 09:02:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[AddSeat]

	@ScreenID INT,
	@SeatData AS MovieMate.EntityId2 READONLY

	AS 
	BEGIN
	INSERT MovieMate.Seat(SeatName,TypeId,ScreenId)
	SELECT [NAME],Capacity,@ScreenId
	FROM @SeatData
	END;


GO
/****** Object:  StoredProcedure [dbo].[AddSeatCategory]    Script Date: 25-07-2023 09:02:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--Create the stored procedure to insert data into the SeatCategory table
CREATE PROCEDURE [dbo].[AddSeatCategory]
	@TypeName VARCHAR(50),
	@Price DECIMAL(10,2)
AS
BEGIN
    INSERT INTO MovieMate.[SeatCategory](TypeName,Price)
    VALUES (@TypeName ,@Price);
END;

GO
/****** Object:  StoredProcedure [dbo].[AddTheatre]    Script Date: 25-07-2023 09:02:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[AddTheatre]
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
GO
/****** Object:  StoredProcedure [dbo].[AddTime]    Script Date: 25-07-2023 09:02:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--Create the stored procedure to insert data into the Time table
CREATE PROCEDURE [dbo].[AddTime]
	@ShowTimeTitle VARCHAR(50)
AS
BEGIN
    INSERT INTO MovieMate.[Time](ShowTimeTitle)
    VALUES (@ShowTimeTitle);
END;

GO
/****** Object:  StoredProcedure [dbo].[AddUser]    Script Date: 25-07-2023 09:02:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- Create the stored procedure to insert data into the User table
CREATE PROCEDURE [dbo].[AddUser] 
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
/****** Object:  StoredProcedure [dbo].[DeleteMovie]    Script Date: 25-07-2023 09:02:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DeleteMovie]
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
/****** Object:  StoredProcedure [dbo].[RemoveTheatre]    Script Date: 25-07-2023 09:02:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[RemoveTheatre]
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

GO
