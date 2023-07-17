--DATE AND TIME FUNCTIONS:
-->----------------------------------------------------------------------------------------------------------
--GETDATE
SELECT GETDATE() AS CurrentDateTime;


--GETUTCDATE
SELECT GETUTCDATE() AS CurrentUTCDateTime;


--AT TIME ZONE
SELECT GETDATE() AT TIME ZONE 'Pacific Standard Time' AS CurrentDateTimePST;

--DATEADD
SELECT DATEADD(DAY, 7, GETDATE()) AS NewDate;


--DATEDIFF
SELECT DATEDIFF(DAY, '2023-07-01', '2023-07-11') AS DaysDifference;


--DATEPART
SELECT DATEPART(YEAR, GETDATE()) AS CurrentYear;


--YEAR
SELECT YEAR(GETDATE()) AS CurrentYear;

--ISDATE
SELECT ISDATE('2023-53-11') AS IsDateValid;

--EOMONTH
SELECT EOMONTH(GETDATE()) AS LastDayOfMonth;


--CURRENT_TIMESTAMP
SELECT CURRENT_TIMESTAMP AS CurrentDateTime;


--SYSDATETIME
SELECT SYSDATETIME() AS CurrentSystemDateTime;

--SYSUTCDATETIME
SELECT SYSUTCDATETIME() AS CurrentSystemUTCDateTime;


--SYSDATETIMEOFFSET
SELECT SYSDATETIMEOFFSET() AS CurrentSystemDateTimeOffset;

--MONTH
SELECT MONTH(GETDATE()) AS CurrentMonth;

--DAY
SELECT DAY(GETDATE()) AS CurrentDay;


--DATENAME
SELECT DATENAME(MONTH, GETDATE()) AS CurrentMonthName;


--DATEFROMPARTS
SELECT DATEFROMPARTS(2023, 7, 11) AS CustomDate;
