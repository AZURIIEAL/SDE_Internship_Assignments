--Shop-Customer-Bookselling Table
--To Show Primary key (Automatic Increment and Created on)
CREATE TABLE StudentData (
  StudentID INT IDENTITY(1,1) PRIMARY KEY,  --IDENTITY is used (start,increment)
  StudentName VARCHAR(50) NOT NULL,
  Attendence VARCHAR(50),
  English INT,
  GeneralKnowledge INT,
  Mathematics INT,
  Science INT,
  CreatedOn DATETIME DEFAULT GETDATE()
);


--Insert Dummy data
INSERT INTO StudentData (StudentName,English,GeneralKnowledge,Mathematics,Science,Attendence) VALUES ('Raju',12,24,21,7,'Present');



--See the data
SELECT * FROM StudentData;


--Final Data Visualization
SELECT *,
    CASE WHEN (English + GeneralKnowledge + Mathematics + Science) / 4 > 40 THEN 'PASSED'
    ELSE 'FAILED'
  END AS RESULT,
  CASE WHEN Attendence IS NULL THEN 'N/A'
  ELSE CONCAT((English + GeneralKnowledge + Mathematics + Science) / 4, '%') 
  END AS Percentage 
FROM StudentData;


--Query to get Names of Students Absent:
SELECT StudentID,StudentName
FROM StudentData
WHERE Attendence = 'Absent' OR Attendence IS NULL;

--Query to get Failed students due to being absen0.t/getting low marks
SELECT StudentID, StudentName,
    CASE
        WHEN Attendence = 'Absent' OR Attendence IS NULL THEN 'Attendance'
        WHEN (English + GeneralKnowledge + Mathematics + Science)/4 < 40 THEN 'Marks'
    END AS Reason
FROM StudentData
WHERE Attendence = 'Absent' OR Attendence IS NULL OR (English + GeneralKnowledge + Mathematics + Science)/4 < 40;


