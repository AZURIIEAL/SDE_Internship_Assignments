 -- Create the MovieMate database
CREATE DATABASE MovieMate;
USE MovieMate;

-- Create the schema MovieMate
CREATE SCHEMA MovieMate;

-- Create the User table
CREATE TABLE MovieMate.[User] (
    UserId INT PRIMARY KEY IDENTITY(1,1),
    Username VARCHAR(50) NOT NULL UNIQUE,
    Email VARCHAR(100) NOT NULL UNIQUE,
    Password VARCHAR(100) NOT NULL,
    RegistrationDate DATETIME NOT NULL DEFAULT GETDATE(),
    Address VARCHAR(255)
);

-- Create the Theatre table
CREATE TABLE MovieMate.Theatre (
    TheatreId INT PRIMARY KEY IDENTITY(1,1),
    Name VARCHAR(100) NOT NULL,
    LocationId INT,
    Address VARCHAR(200) NOT NULL,
    RegistrationDate DATETIME NOT NULL DEFAULT GETDATE(),
    FOREIGN KEY (LocationId) REFERENCES MovieMate.[Location](LocationId)
);

-- Create the Language table
CREATE TABLE MovieMate.Language (
    LanguageId INT PRIMARY KEY IDENTITY(1,1),
    Language VARCHAR(50) NOT NULL
);

-- Create the MovieGenre table
CREATE TABLE MovieMate.MovieGenre (
    GenreMovieId INT PRIMARY KEY IDENTITY(1,1),
    MovieId INT,
    GenreId INT,
    FOREIGN KEY (MovieId) REFERENCES MovieMate.[Movie](MovieId),
    FOREIGN KEY (GenreId) REFERENCES MovieMate. [Genre](GenreId)
);

-- Create the Screen table
CREATE TABLE MovieMate.Screen (
    ScreenId INT PRIMARY KEY IDENTITY(1,1),
    Name VARCHAR(50) NOT NULL,
    Capacity INT NOT NULL
);
-- Create the Genre table
CREATE TABLE MovieMate.Genre (
    GenreId INT PRIMARY KEY IDENTITY(1,1),
    Genre VARCHAR(50) NOT NULL
);

-- Create the MovieGenre table
CREATE TABLE MovieMate.MovieGenre (
    GenreMovieId INT PRIMARY KEY IDENTITY(1,1),
    MovieId INT,
    GenreId INT,
    FOREIGN KEY (MovieId) REFERENCES MovieMate.Movie(MovieId),
    FOREIGN KEY (GenreId) REFERENCES MovieMate.Genre(GenreId)
);


-- Create the Movie table
CREATE TABLE MovieMate.Movie (
    MovieId INT PRIMARY KEY IDENTITY(1,1),
    Title VARCHAR(100) NOT NULL,
    Certification INT,
    ReleaseDate DATE NOT NULL,
    Duration INT NOT NULL,
    PosterLink VARCHAR(200),
    TrailerLink VARCHAR(200),
    CreatedAt DATETIME NOT NULL DEFAULT GETDATE(),
    GenreId INT,
    FOREIGN KEY (GenreId) REFERENCES MovieMate.[Genre](GenreId),
    LanguageId INT,
    FOREIGN KEY (LanguageId) REFERENCES MovieMate.[Language](LanguageId),
    DirectorId INT,
    FOREIGN KEY (DirectorId) REFERENCES MovieMate.[Director](DirectorId)
);

-- Create the PaymentMethod table
CREATE TABLE MovieMate.PaymentMethod (
    PaymentMethodId INT PRIMARY KEY,
    PaymentMethod VARCHAR(50) NOT NULL
);

-- Create the Certification table
CREATE TABLE MovieMate.Certification (
CertificationId INT PRIMARY KEY IDENTITY(1,1),
    Certification VARCHAR(50) NOT NULL
);

-- Create the Location table      
CREATE TABLE MovieMate.Location (
    LocationId INT PRIMARY KEY IDENTITY(1,1),
    Zipcode INT NOT NULL
);

-- Create the SeatCategory table
CREATE TABLE MovieMate.SeatCategory (
    TypeId INT PRIMARY KEY IDENTITY(1,1),
    TypeName VARCHAR(50) NOT NULL,
    Price DECIMAL(10,2) NOT NULL
);

-- Create the Seat table
CREATE TABLE MovieMate.Seat (
    SeatId INT PRIMARY KEY IDENTITY(1,1),
    LocationId INT NOT NULL,
    TypeId INT NOT NULL,
    ScreenId INT,
    FOREIGN KEY (LocationId) REFERENCES MovieMate.Location(LocationId),
    FOREIGN KEY (TypeId) REFERENCES MovieMate.SeatCategory(TypeId),
    FOREIGN KEY (ScreenId) REFERENCES MovieMate.Screen(ScreenId)
);

-- Create the ShowTime table
CREATE TABLE MovieMate.ShowTime (
    TsId INT PRIMARY KEY IDENTITY(1,1),
    MovieId INT,
    LanguageId INT,
    ScreenId INT,
    TimeId INT,
    FOREIGN KEY (MovieId) REFERENCES MovieMate.Movie(MovieId),
    FOREIGN KEY (LanguageId) REFERENCES MovieMate.Language(LanguageId),
    FOREIGN KEY (ScreenId) REFERENCES MovieMate.Screen(ScreenId),
    FOREIGN KEY (TimeId) REFERENCES MovieMate.[Time](TimeId)
);
-- Create the DirectorMovie table
CREATE TABLE MovieMate.DirectorMovie (
    DirectorMovieId INT PRIMARY KEY IDENTITY(1,1),
    MovieId INT,
    DirectorId INT,
    FOREIGN KEY (MovieId) REFERENCES MovieMate.Movie(MovieId),
    FOREIGN KEY (DirectorId) REFERENCES MovieMate.Director(DirectorId)
);


-- Create the Director table
CREATE TABLE MovieMate.Director (
    DirectorId INT PRIMARY KEY IDENTITY(1,1),
    DirectorName VARCHAR(50) NOT NULL
);

-- Create the Time table
CREATE TABLE MovieMate.Time (
    TimeId INT PRIMARY KEY IDENTITY(1,1),
    ShowTimeTitle VARCHAR(100) NOT NULL
);

-- Create the BookingHeader table
CREATE TABLE MovieMate.BookingHeader (
    BookingId INT PRIMARY KEY IDENTITY(1,1),
    UserId INT,
    TotalAmount DECIMAL(10,2),
    BookingDate DATETIME NOT NULL DEFAULT GETDATE(),
    PaymentMethod INT,
    FOREIGN KEY (UserId) REFERENCES MovieMate.[User](UserId),
    FOREIGN KEY (PaymentMethod) REFERENCES MovieMate.PaymentMethod(PaymentMethodId)
);

-- Create the BookingDetails table
CREATE TABLE MovieMate.BookingDetails (
    BookingDetailsId INT PRIMARY KEY IDENTITY(1,1),
    BookingId INT,
    SeatId INT,
    TsId INT,
    FOREIGN KEY (BookingId) REFERENCES MovieMate.BookingHeader(BookingId),
    FOREIGN KEY (SeatId) REFERENCES MovieMate.Seat(SeatId),
    FOREIGN KEY (TsId) REFERENCES MovieMate.ShowTime(TsId)
);

-- Create the BookingDetails table
CREATE TABLE MovieMate.BookingDetails (
    BookingDetailsId INT PRIMARY KEY IDENTITY(1,1),
    BookingId INT,
    SeatId INT,
    FOREIGN KEY (BookingId) REFERENCES MovieMate.BookingHeader(BookingId),
    FOREIGN KEY (SeatId) REFERENCES MovieMate.Seat(SeatId)
);










