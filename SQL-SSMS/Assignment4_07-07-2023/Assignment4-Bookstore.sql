CREATE TABLE Employee (
  intern_id INT PRIMARY KEY,
  intern_name VARCHAR(50),
  joiningdate DATETIMEOFFSET
);
DROP TABLE Employee;

INSERT INTO Employee (intern_id, intern_name, joiningdate)
VALUES
  (1, 'A', SYSDATETIMEOFFSET()),
  (2, 'b', SYSDATETIMEOFFSET()),
  (3, 'c', SYSDATETIMEOFFSET());


  --4. Create an employee table with field “joiningdate” and display the joining date in two time zones - India and New York
  SELECT * FROM Employee
SELECT
  intern_id,
  intern_name,
  joiningdate AS joiningdate_india,
  SWITCHOFFSET(joiningdate, '+05:30') AS joiningdate_in_india, -- +5:30 in india  
  SWITCHOFFSET(joiningdate, '-04:00') AS joiningdate_in_new_york  -- -4:00 in NY  
FROM
  Employee;


  -- 6. For Employee table: Display the total no. of days each intern has joined

  SELECT *,
    DATEDIFF(DAY, joiningdate, GETDATE()) AS TotalDaysSinceJoin --This function Returns an int,we will use joining date and to grt todays date use GETDATE() and use DATEDIFF fn.
FROM
    Employee