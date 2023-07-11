--STRING_MANIPULATIONSUBSTRING
--______________________________________________________________________________________
--LEFT.//Returns a specified number of characters from the left side of a string.

SELECT LEFT('Hello World', 5) AS Result;

--RIGHT.//Returns a specified number of characters from the right side of a string.

SELECT RIGHT('Hello World', 5) AS Result;

--LEN.//Returns the length (number of characters) of a string.

SELECT LEN('Hello World') AS Result;

--DATALENGTH.//Returns the length (number of bytes) of a value.

SELECT DATALENGTH('Hello World') AS Result;

--CHARINDEX // Charachter index.//Returns the starting position of a substring within a string.

SELECT CHARINDEX('o', 'Hello World') AS Result;

--PATINDEX // Pattern Index. //Returns the starting position of a pattern within a string.

SELECT PATINDEX('%World%', 'Hello World') AS Result;

--CONCAT.// Concatenates two or more strings together.

SELECT CONCAT('Hello', ' ', 'World') AS Result;

--CONCAT_WS //With Seperator-Concatenates multiple strings together using a specified separator.

SELECT CONCAT_WS(',', 'Apple', 'Banana', 'Orange') AS Result;

--REPLACE.//Replaces all occurrences of a specified string with another string.

SELECT REPLACE('Hello World', 'World', 'Universe') AS Result;

--REPLICATE.//Repeats or duplicates a string a specified number of times.

SELECT REPLICATE('abc', 10) AS Result;

--STUFF //Replaces a specified portion of a string with another string.

SELECT STUFF('Hello World', 7,5, 'Universe') AS Result; --STUFF(string, start, Delete length, new_string)

--UPPER //Converts a string to uppercase.

SELECT UPPER('Hello World') AS Result;

--LOWER //Converts a string to lowercase.

SELECT LOWER('Hello World') AS Result;

--RTRIM //Removes trailing spaces from the right side of a string.

SELECT RTRIM('Hello World     ') AS Result;

--LTRIM //Removes leading spaces from the left side of a string.

SELECT LTRIM('     Hello World') AS Result;

--FORMAT //Formats a value with a specified format pattern.

SELECT FORMAT(GETDATE(), 'yyyy-MM-dd') AS Result;

--STRING_SPLIT //plits a string into a table of values based on a specified separator.

SELECT value FROM STRING_SPLIT('Apple,Banana,Orange', ',');

