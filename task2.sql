-- Courses Table
CREATE TABLE Courses (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT
);

INSERT INTO Courses (name) VALUES
('Mathematics'),
('Science'),
('English');

-- Enrollments Table
CREATE TABLE Enrollments (
    student_id INTEGER,
    course_id INTEGER,
    grade INTEGER,
    FOREIGN KEY(student_id) REFERENCES Students(StudentID),
    FOREIGN KEY(course_id) REFERENCES Courses(id)
);

INSERT INTO Enrollments VALUES
(1,1,85),
(1,2,78),
(1,3,90),
(2,1,76),
(2,2,88),
(2,3,80),
(3,1,92),
(3,2,81),
(3,3,85),
(4,1,89),
(4,2,91),
(4,3,95),
(5,1,35),
(5,2,40),
(5,3,30),
(6,1,78),
(6,2,85),
(6,3,82);
--List all students enrolled in each course
SELECT s.Name AS StudentName,
       c.name AS CourseName,
       e.grade
FROM Enrollments e
JOIN Students s ON e.student_id = s.StudentID
JOIN Courses c ON e.course_id = c.id
ORDER BY c.name;
--Average grade per course
SELECT c.name AS CourseName,
       AVG(e.grade) AS AverageGrade
FROM Enrollments e
JOIN Courses c ON e.course_id = c.id
GROUP BY c.name;
--Top 3 students overall
SELECT s.StudentID,
       s.Name,
       AVG(e.grade) AS AvgGrade
FROM Students s
JOIN Enrollments e
ON s.StudentID = e.student_id
GROUP BY s.StudentID, s.Name
ORDER BY AvgGrade DESC
LIMIT 3;
--Count students who failed (grade < 40)
SELECT COUNT(DISTINCT student_id) AS FailedStudents
FROM Enrollments
WHERE grade < 40;