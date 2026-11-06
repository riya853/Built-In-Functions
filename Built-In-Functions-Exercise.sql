DROP DATABASE IF EXISTS training_functions;
CREATE DATABASE training_functions;
USE training_functions;
CREATE TABLE CourseEnrollments (
StudentID INT PRIMARY KEY,
FirstName VARCHAR(40),
LastName VARCHAR(40),
CourseName VARCHAR(40),
Fee DECIMAL(10,2),
EnrollmentDate DATE,
CompletionDate DATE
);
INSERT INTO CourseEnrollments
(StudentID, FirstName, LastName, CourseName, Fee, EnrollmentDate, CompletionDate)
VALUES
(101, 'aman', 'Sharma', 'Python', 12500.75, '2026-01-05', '2026-03-20'),
(102, 'priya', 'Verma', 'MySQL', 9800.40, '2026-01-12', '2026-02-28'),
(103, 'rahul', 'Singh', 'Python', 15750.90, '2026-02-01', '2026-04-15'),
(104, 'neha', 'Gupta', 'Power BI', 11200.25, '2026-02-10', '2026-05-05'),
(105, 'ishita', 'Kapoor', 'MySQL', 8900.60, '2026-03-03', '2026-04-22'),
(106, 'arjun', 'Mehta', 'Python', 13650.15, '2026-03-15', '2026-06-10'),
(107, 'simran', 'Joshi', 'Power BI', 10400.95, '2026-04-01', '2026-06-30'),
(108, 'vikas', 'Rao', 'MySQL', 7600.50, '2026-04-18', '2026-05-29'),
(109, 'kiran', 'Malik', 'Python', 14999.99, '2026-05-02', '2026-07-25'),
(110, 'rohan', 'Sethi', 'Power BI', 11950.35, '2026-05-20', '2026-08-14');
 
SELECT * FROM CourseEnrollments;

SELECT UPPER(CONCAT(FirstName, ' ', lastName)) AS FullName
from CourseEnrollments;

SELECT FirstName,
       CONCAT(
	   UPPER(SUBSTRING(FirstName, 1,1)),
       SUBSTRING(FirstName, 2)
       ) AS FULLNAME
from CourseEnrollments;

SELECT StudentID, 
       CourseName,
       CONCAT(UPPER(LEFT(CourseName, 3)), 
       '-', StudentID) AS StudentCode
from CourseEnrollments;

Select FirstName,
	   REVERSE(FirstName) AS Reversed_Name,
       CHAR_LENGTH(FirstName) AS Original_Length
from CourseEnrollments;

SELECT FirstName,
       LOCATE('a', FirstName) 
from CourseEnrollments;

Select
	  UPPER(REPLACE(FirstName, 'a', 'o') 
       ) AS ReplacedName
from  CourseEnrollments;

SELECT FirstName,
       LPAD(FirstName, 12, '0') AS PaddedFirstName
from CourseEnrollments;

SELECT CourseName,
       FirstName,
       CONCAT(
       RIGHT(CourseName, 2),
       '-', 
       LEFT(FirstName, 2)) AS CourseLabel
from CourseEnrollments;

SELECT FirstName, LastName,
       CONCAT(
       UPPER(SUBSTRING(FirstName, 1, 3)), 
       LOWER(RIGHT(LastName, 2))
       ) AS FUllName
from CourseEnrollments;

SELECT Fee,
       ROUND(Fee, 1) AS RoundedOneDecimal,
       ROUND(Fee, 0) AS RoundedWholeNumber
FROM CourseEnrollments;

Select Fee,
       CEIL(Fee) AS FeeRoundedUpward,
       FLOOR(Fee) AS FeeRoundedDownward
from CourseEnrollments;

Select Fee AS Original_fee,
	   MOD(Fee, 500) AS Remainder
from CourseEnrollments;

Select Fee,
       ABS(Fee - 10000) AS AbsoluteFee
from CourseEnrollments;

Select Fee,
       ROUND(Fee * 1.18, 2) AS RoundedFee
from CourseEnrollments;

Select FORMAT(fee, 2)
       AS new_value
from CourseEnrollments;

Select EnrollmentDate,
       YEAR(EnrollmentDate) AS EnrollmentYear,
       MONTHNAME(EnrollmentDate) AS MonthName, 
       DAYNAME(EnrollmentDate) AS DayName
from CourseEnrollments;

Select EnrollmentDate,
       CompletionDate,
       DATE_FORMAT(EnrollmentDate, '%d/%m/%Y') AS FormattedEnrollmentDate,
       DATE_FORMAT(CompletionDate, '%M %d, %Y') AS FormattedCompletionDate
from CourseEnrollments;

Select TIMESTAMPDIFF
       (
       DAY, EnrollmentDate, CompletionDate)
       AS NumberOfDays
from CourseEnrollments;

Select EnrollmentDate,
       DATE_ADD(
       DATE_ADD(EnrollmentDate, INTERVAL 1 MONTH),
       INTERVAL 10 Day) 
       AS NewEnrollmentDate
from CourseEnrollments;

Select CompletionDate,
	   DATE_ADD(
       CompletionDate, INTERVAL -7 DAY) 
       AS PreviousCompletionDate
from CourseEnrollments;

Select EnrollmentDate, 
       CompletionDate,
       TIMESTAMPDIFF(
       MONTH, EnrollmentDate, CompletionDate)
       AS CompleteMonths
from CourseEnrollments;

SELECT EnrollmentDate, 
       DATE_ADD(DATE_ADD(DATE_ADD(
       EnrollmentDate, Interval 1 YEAR), 
	   INTERVAL 2 MONTH), 
       INTERVAL 5 DAY) AS ShiftedDate
from CourseEnrollments;

SELECT EnrollmentDate, 
       CompletionDate,
       DAYNAME(EnrollmentDate) AS ENROLLMENTDAYNAME,
       DAYNAME(CompletionDate) AS COMPLETIONDAYNAME
from CourseEnrollments;

SELECT StudentID,
       EnrollmentDate,
       CURDATE()
       AS CurrentDate,
       TIMESTAMPDIFF(
       DAY, EnrollmentDate, CURDATE()) 
       AS TotalDays
from CourseEnrollments;

SELECT CompletionDate,
       DATE_FORMAT(
       DATE_ADD(CompletionDate, INTERVAL 15 DAY), 
       '%d/%m/%Y') 
       AS UpdatedCompletionDate
from CourseEnrollments;




