CREATE TABLE Employee (
  intern_id INT PRIMARY KEY,
  intern_name VARCHAR(50),
  joiningdate DATETIMEOFFSET
);
DROP TABLE Employee;

INSERT INTO Employee (intern_id, intern_name, joiningdate)
VALUES
  (1, 'A', GETUTCDATE()),
  (2, 'b', GETUTCDATE()),
  (3, 'c', GETUTCDATE());


  --4. Create an employee table with field “joiningdate” and display the joining date in two time zones - India and New York

  SELECT * FROM SYS.time_zone_info

  SELECT *,joiningdate AT TIME ZONE 'India Standard Time' AS ConvertedDateTimeINDIA,
  joiningdate AT TIME ZONE 'Eastern Standard Time' AS ConvertedDateTimeNewYork
  FROM Employee;

  -- 6. For Employee table: Display the total no. of days each intern has joined

  SELECT *,
    DATEDIFF(DAY, joiningdate, GETDATE()) AS TotalDaysSinceJoin --This function Returns an int,we will use joining date and to grt todays date use GETDATE() and use DATEDIFF fn.
FROM
    Employee