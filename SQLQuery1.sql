USE [db_academy_16.04]
GO 

-- 1. Display the number of teachers of the department "Software Development."
SELECT COUNT(*) AS NumberOfTeachers
FROM Teachers t
JOIN Departments d ON t.Id = d.FacultyId
WHERE d.Name = 'Software Development';

-- 2. Display the number of lectures given by the teacher "Dave McQueen."
SELECT COUNT(*) AS NumberOfLectures
FROM Lectures
WHERE TeacherId = (
    SELECT Id FROM Teachers WHERE Name = 'Dave' AND Surname = 'McQueen'
);

-- 3. Display the number of classes that are held in the audience "Room 101."
SELECT COUNT(*) AS NumberOfClasses
FROM Lectures
WHERE LectureRoom = 'Room 101';

-- 4. Display the names of the classrooms and the number of lectures held in them.
SELECT LectureRoom, COUNT(*) AS NumberOfLectures
FROM Lectures
GROUP BY LectureRoom;

-- 5. Display the number of students attending lectures of the teacher "John Doe."
SELECT COUNT(*) AS NumberOfStudents
FROM GroupsLectures gl
JOIN Lectures l ON gl.LectureId = l.Id
JOIN Teachers t ON l.TeacherId = t.Id
WHERE t.Name = 'John' AND t.Surname = 'Doe';

-- 6. Withdraw the average rate of the "Computer Science" faculty.
SELECT AVG(Salary) AS AverageRate
FROM Teachers t
JOIN Departments d ON t.Id = d.FacultyId
JOIN Faculties f ON d.Id = f.Id
WHERE f.Name = 'Computer Science';

-- 7. Withdraw minimum and maximum number of students among all groups.
SELECT MIN(NumberOfStudents) AS MinStudents, MAX(NumberOfStudents) AS MaxStudents
FROM (
    SELECT COUNT(*) AS NumberOfStudents
    FROM GroupsLectures
    GROUP BY GroupId
) AS StudentCounts;

-- 8. Withdraw the average fund for financing departments.
SELECT AVG(Financing) AS AverageFund
FROM Departments;

-- 9. Display full names of teachers and the number of disciplines they teach.
SELECT t.Name + ' ' + t.Surname AS FullName, COUNT(DISTINCT l.SubjectId) AS NumberOfDisciplines
FROM Teachers t
JOIN Lectures l ON t.Id = l.TeacherId
GROUP BY t.Name, t.Surname;

-- 10. Display the number of lectures every day for a week.
SELECT DayOfWeek, COUNT(*) AS NumberOfLectures
FROM GroupsLectures
GROUP BY DayOfWeek;

-- 11. Display the numbers of classrooms and the number of departments whose lectures they read.
SELECT LectureRoom, COUNT(DISTINCT d.Id) AS NumberOfDepartments
FROM Lectures l
JOIN Departments d ON l.SubjectId = d.Id
GROUP BY LectureRoom;

-- 12. Derive the names of the faculties and the number of disciplines that are taught within them.
SELECT f.Name AS FacultyName, COUNT(DISTINCT s.Id) AS NumberOfDisciplines
FROM Faculties f
JOIN Departments d ON f.Id = d.FacultyId
JOIN Subjects s ON d.Id = s.Id
GROUP BY f.Name;

-- 13. Display the number of lectures for each pair of teacher-audience.
SELECT t.Name + ' ' + t.Surname AS TeacherName, l.LectureRoom, COUNT(*) AS NumberOfLectures
FROM Lectures l
JOIN Teachers t ON l.TeacherId = t.Id
GROUP BY t.Name, t.Surname, l.LectureRoom;
