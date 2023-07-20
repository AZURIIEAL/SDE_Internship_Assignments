 -- Create the MovieMate database
CREATE DATABASE MovieMate;
USE MovieMate;

-- Create the schema MovieMate
CREATE SCHEMA MovieMate;

 -- Create the MovieMate database
CREATE DATABASE MovieMate;
USE MovieMate;

-- Create the schema MovieMate
CREATE SCHEMA MovieMate;


-- Language table
CREATE TABLE MovieMate.[Language] (
    LanguageId INT IDENTITY(1,1) CONSTRAINT PK_Language_LanguageId  PRIMARY KEY ,
    [Language] VARCHAR(50) NOT NULL
);

-- Genre table
CREATE TABLE MovieMate.[Genre] (
    GenreId INT CONSTRAINT PK_Genre_GenreId PRIMARY KEY IDENTITY(1,1),
    Genre VARCHAR(50) NOT NULL
);

-- Certification table
CREATE TABLE MovieMate.[Certification] (
    CertificationId INT CONSTRAINT PK_Certification_CertificationId PRIMARY KEY IDENTITY(1,1),
    Certification VARCHAR(50) NOT NULL
);

-- Location table
CREATE TABLE MovieMate.[Location] (
    LocationId INT CONSTRAINT PK_Location_LocationId PRIMARY KEY IDENTITY(1,1),
    Zipcode INT NOT NULL,
    [Name] VARCHAR(100)
);

-- SeatCategory table
CREATE TABLE MovieMate.[SeatCategory] (
    TypeId INT CONSTRAINT PK_SeatCategory_TypeId PRIMARY KEY IDENTITY(1,1),
    TypeName VARCHAR(50) NOT NULL,
    Price DECIMAL(10,2) NOT NULL
);

-- Screen table
CREATE TABLE MovieMate.[Screen] (
    ScreenId INT CONSTRAINT PK_Screen_ScreenId PRIMARY KEY IDENTITY(1,1),
    [Name] VARCHAR(100) NOT NULL,
    Capacity INT NOT NULL
);
-- Time table
CREATE TABLE MovieMate.[Time] (
    TimeId INT CONSTRAINT PK_Time_TimeId PRIMARY KEY IDENTITY(1,1),
    ShowTimeTitle VARCHAR(100) NOT NULL
);


-- Director table
CREATE TABLE MovieMate.[Director] (
    DirectorId INT CONSTRAINT PK_Director_DirectorId PRIMARY KEY IDENTITY(1,1),
    DirectorName VARCHAR(255) NOT NULL
);

-- User table
CREATE TABLE MovieMate.[User] (
    UserId INT CONSTRAINT PK_User_UserId PRIMARY KEY IDENTITY(1,1),
    Username VARCHAR(100) NOT NULL UNIQUE,
    Email VARCHAR(100) NOT NULL UNIQUE,
    [Password] VARCHAR(100) NOT NULL,
    RegistrationDate DATETIME NOT NULL DEFAULT GETDATE(),
    [Address] VARCHAR(255)
);

-- Theatre table
CREATE TABLE MovieMate.[Theatre] (
    TheatreId INT CONSTRAINT PK_Theatre_TheatreId PRIMARY KEY IDENTITY(1,1),
    [Name] VARCHAR(100) NOT NULL,
    LocationId INT CONSTRAINT FK_Theatre_LocationId FOREIGN KEY (LocationId) REFERENCES MovieMate.[Location](LocationId),
    [Address] VARCHAR(200) NOT NULL,
    RegistrationDate DATETIME NOT NULL DEFAULT GETDATE()   
);

-- Movie table
CREATE TABLE MovieMate.[Movie] (
    MovieId INT CONSTRAINT PK_Movie_MovieId PRIMARY KEY IDENTITY(1,1),
    Title VARCHAR(100) NOT NULL,
    Certification INT,
    ReleaseDate DATE NOT NULL,
    Duration INT NOT NULL,
    PosterLink VARCHAR(200),
    TrailerLink VARCHAR(200),
    [Description] TEXT,
    CreatedAt DATETIME NOT NULL DEFAULT GETDATE(),
);

-- MovieGenre table
CREATE TABLE MovieMate.[MovieGenre] (
    MovieGenreId INT CONSTRAINT PK_MovieGenre_GenreMovieId PRIMARY KEY IDENTITY(1,1),
    MovieId INT CONSTRAINT FK_MovieGenre_MovieId FOREIGN KEY (MovieId) REFERENCES MovieMate.Movie(MovieId),
    GenreId INT CONSTRAINT FK_MovieGenre_GenreId FOREIGN KEY (GenreId) REFERENCES MovieMate.Genre(GenreId)
);

-- Seat table
CREATE TABLE MovieMate.[Seat] (
    SeatId INT CONSTRAINT PK_Seat_SeatId PRIMARY KEY IDENTITY(1,1),
    TypeId INT CONSTRAINT FK_Seat_TypeId NOT NULL FOREIGN KEY (TypeId) REFERENCES MovieMate.SeatCategory(TypeId),
    ScreenId INT CONSTRAINT FK_Seat_ScreenId FOREIGN KEY (ScreenId) REFERENCES MovieMate.Screen(ScreenId),    
);


-- DirectorMovie table
CREATE TABLE MovieMate.[DirectorMovie] (
    DirectorMovieId INT CONSTRAINT PK_DirectorMovie_DirectorMovieId PRIMARY KEY IDENTITY(1,1),
    MovieId INT CONSTRAINT FK_DirectorMovie_MovieId FOREIGN KEY (MovieId) REFERENCES MovieMate.Movie(MovieId),
    DirectorId INT CONSTRAINT FK_DirectorMovie_DirectorId FOREIGN KEY (DirectorId) REFERENCES MovieMate.Director(DirectorId)
);
-- ShowTime table
CREATE TABLE MovieMate.[ShowTime] (
    TsId INT CONSTRAINT PK_ShowTime_TsId PRIMARY KEY IDENTITY(1,1),
    TimeId INT CONSTRAINT FK_ShowTime_TimeId FOREIGN KEY (TimeId) REFERENCES MovieMate.[Time](TimeId),
    ScreenId INT CONSTRAINT FK_ShowTime_ScreenId FOREIGN KEY (ScreenId) REFERENCES MovieMate.Screen(ScreenId),
    MovieId INT CONSTRAINT FK_ShowTime_MovieId FOREIGN KEY (MovieId) REFERENCES MovieMate.Movie(MovieId),
	[Date] DATE,
	DirectorMovieId INT CONSTRAINT FK_ShowTime_DirectorMovieId FOREIGN KEY (DirectorMovieId) REFERENCES MovieMate.[DirectorMovie](DirectorMovieId),
	MovieGenreId INT CONSTRAINT FK_ShowTime_MovieGenreId FOREIGN KEY (MovieGenreId) REFERENCES MovieMate.[MovieGenre](MovieGenreId),
    LanguageId INT CONSTRAINT FK_ShowTime_LanguageId FOREIGN KEY (LanguageId) REFERENCES MovieMate.[Language](LanguageId),
    CreatedAt DATETIME DEFAULT GETDATE()  
);
-- PaymentMethod table
CREATE TABLE MovieMate.[PaymentMethod] (
    PaymentMethodId INT CONSTRAINT PK_PaymentMethod_PaymentMethodId PRIMARY KEY,
    PaymentMethod VARCHAR(100) NOT NULL
);

-- BookingHeader table
CREATE TABLE MovieMate.[BookingHeader] (
    BookingId INT CONSTRAINT PK_BookingHeader_BookingId PRIMARY KEY IDENTITY(1,1),
    UserId INT CONSTRAINT FK_BookingHeader_UserId FOREIGN KEY (UserId) REFERENCES MovieMate.[User](UserId),
    TsId INT CONSTRAINT FK_BookingHeader_TsId FOREIGN KEY (TsId) REFERENCES MovieMate.ShowTime(TsId),
    NumTickets INT,
    TotalAmount DECIMAL(10,2),
    BookingDate DATETIME NOT NULL DEFAULT GETDATE(),
    PaymentMethod INT CONSTRAINT FK_BookingHeader_PaymentMethod FOREIGN KEY (PaymentMethod) REFERENCES MovieMate.PaymentMethod(PaymentMethodId)   
);

-- BookingDetails table
CREATE TABLE MovieMate.[BookingDetails] (
    BookingDetailsId INT CONSTRAINT PK_BookingDetails_BookingDetailsId PRIMARY KEY IDENTITY(1,1),
    BookingId INT CONSTRAINT FK_BookingDetails_BookingId FOREIGN KEY (BookingId) REFERENCES MovieMate.BookingHeader(BookingId),
    SeatId INT CONSTRAINT FK_BookingDetails_SeatId FOREIGN KEY (SeatId) REFERENCES MovieMate.Seat(SeatId)
);








