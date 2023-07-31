--1
SELECT COUNT(*) AS NumberOfTeachers
FROM Teachers T
JOIN Lectures L ON T.Id = L.TeacherId
JOIN Subjects S ON L.SubjectId = S.Id
JOIN Departments D ON S.Id = D.Id
WHERE D.Name = 'Software Development'


--2
SELECT COUNT(*) AS NumberOfLectures
FROM Lectures L
JOIN Teachers T ON L.TeacherId = T.Id
WHERE CONCAT(T.Name, ' ', T.Surname) = 'Dave McQueen'


--3
SELECT COUNT(*) AS NumberOfClasses
FROM Lectures
WHERE LectureRoom = 'D201'


--4
SELECT LectureRoom, COUNT(*) AS NumberOfLectures
FROM Lectures
GROUP BY LectureRoom


--5
SELECT COUNT(DISTINCT GroupsLectures.GroupId) AS NumberOfStudents
FROM GroupsLectures
JOIN Lectures ON GroupsLectures.LectureId = Lectures.Id
JOIN Teachers ON Lectures.TeacherId = Teachers.Id
WHERE CONCAT(Teachers.Name, ' ', Teachers.Surname) = 'Jack Underhill'


--6
SELECT AVG(Salary) AS AverageSalary
FROM Teachers
WHERE Id IN (
    SELECT TeacherId
    FROM Lectures
    JOIN Subjects ON Lectures.SubjectId = Subjects.Id
    JOIN Departments ON Subjects.Id = Departments.Id
    JOIN Faculties ON Departments.FacultyId = Faculties.Id
    WHERE Faculties.Name = 'Computer Science'
)


--7
SELECT MIN(NumOfStudents) AS MinNumberOfStudents, MAX(NumOfStudents) AS MaxNumberOfStudents
FROM (
    SELECT COUNT(*) AS NumOfStudents
    FROM GroupsLectures
    GROUP BY GroupId
) T


--8
SELECT AVG(Financing) AS AverageFinancing
FROM Departments


--9
SELECT CONCAT(T.Name, ' ', T.Surname) AS FullName, COUNT(DISTINCT L.SubjectId) AS NumOfSubjects
FROM Lectures L
JOIN Teachers T ON L.TeacherId = T.Id
GROUP BY T.Id, T.Name, T.Surname


--10
SELECT DayOfWeek, COUNT(*) AS NumberOfLectures
FROM Lectures
GROUP BY DayOfWeek


--11.
SELECT LectureRoom, COUNT(DISTINCT Departments.Id) AS NumberOfDepartments
FROM Lectures
JOIN Subjects ON Lectures.SubjectId = Subjects.Id
JOIN Departments ON Subjects.Id = Departments.Id
GROUP BY LectureRoom


--12. 
SELECT Faculties.Name, COUNT(DISTINCT Lectures.SubjectId) AS NumberOfSubjects
FROM Lectures
JOIN Subjects ON Lectures.SubjectId = Subjects.Id
JOIN Departments ON Subjects.Id = Departments.Id
JOIN Faculties ON Departments.FacultyId = Faculties.Id
GROUP BY Faculties.Name


--13. 
SELECT CONCAT(T.Name, ' ', T.Surname) AS FullName, L.LectureRoom, COUNT(*) AS NumberOfLectures
FROM Lectures L
JOIN Teachers T ON L.TeacherId = T.Id
GROUP BY T.Id, T.Name, T.Surname, L.LectureRoom