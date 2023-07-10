--create Table According to needed attributes.
CREATE TABLE UnicodeTable (
    ID INT PRIMARY KEY IDENTITY(1378,7),
    BookName NVARCHAR(100),
	Author NVARCHAR(100),
	Price DECIMAL(5, 2) NOT NULL,
	BookInStock INT NOT NULL
);

-- Insert DummyData(Run multiple times for many data)
INSERT INTO UnicodeTable (BookName,Author,Price,BookInStock)
VALUES ( N'ഖസാക്കിന്റെ ഇതിഹാസം',N'ഒ.വി. വിജയൻ',350.00,123),
( N'റ്റു കിൽ എ മോക്കിങ്ങ്ബേർഡ് (നോവൽ)',N' ഹാർപർ ലീയാണ്‌',225.00,0),
( N'രണ്ടാമൂഴം',N'എം.ടി. വാസുദേവൻ നായർ',300.00,523),
( N'പ്രൈഡ് ആന്റ് പ്രെജുഡിസ് (നോവൽ)',N'ജേൻ ഔസ്റ്റൻ ',150.00,0),
( N'നാലുകെട്ട്',N'എം.ടി. വാസുദേവൻ നായർ',320.00,170);  

--To see the table once
SELECT *FROM UnicodeTable;

--To view the whole table in malayalam 
SELECT [BookName] AS N'പുസ്തകത്തിന്റെ പേര്'  , [Author] AS N'രചയിതാവ്' ,[Price]  AS N'വില' ,[BookInStock]  AS N'ഗോഡൗണിൽ എത്ര പുസ്തകങ്ങളുണ്ട്' ,
    CASE
	--Setting up a condition to see if books are avilable or not
        WHEN BookInStock > 0 THEN N'ഉണ്ട്'
        ELSE N'ഇല്ല'
    END AS N'പുസ്തകങ്ങൾ ഉണ്ടോ'
FROM UnicodeTable;
