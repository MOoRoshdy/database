--q1 Database Creation and Data Insertion
CREATE TABLE Students (
    Student_ID INT PRIMARY KEY,
    Name VARCHAR(50) NOT NULL,
    Age INT NOT NULL,
    Major VARCHAR(50) NOT NULL
);


CREATE TABLE Courses (
    Course_ID INT PRIMARY KEY,
    Course_Name VARCHAR(50) NOT NULL,
    Instructor VARCHAR(50) NOT NULL,
    Credit_Hours INT NOT NULL
);


INSERT INTO Students (Student_ID, Name, Age, Major)
VALUES (1, 'John Doe', 20, 'Computer Science'),
       (2, 'Jane Smith', 22, 'Business Administration'),
       (3, 'Michael Johnson', 21, 'Electrical Engineering');


INSERT INTO Courses (Course_ID, Course_Name, Instructor, Credit_Hours)
VALUES (101, 'Introduction to Programming', 'Dr. Williams', 3),
       (102, 'Data Structures', 'Dr. Garcia', 4),
       (103, 'Principles of Marketing', 'Dr. Thompson', 3);