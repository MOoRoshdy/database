--q2
SELECT Name FROM Students
UNION
SELECT Course_Name FROM Courses;

--q3
-- Start a transaction

START TRANSACTION;


INSERT INTO Students (Student_ID, Name, Age, Major)
VALUES (4, 'Sarah Wilson', 19, 'Biology');


INSERT INTO Students (Student_ID, Name, Age, Major)
VALUES (5, 'David Brown', 23, 'Wrong Major');


ROLLBACK;


SELECT * FROM Students;