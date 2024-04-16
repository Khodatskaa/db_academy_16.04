USE [db_academy_16.04]
GO 

INSERT INTO Faculties (Name) VALUES
('Computer Science'),
('Mathematics'),
('Physics');

INSERT INTO Departments (Financing, Name, FacultyId) VALUES
(50000, 'Software Development', 1),
(60000, 'Data Science', 1),
(55000, 'Algorithms', 2),
(52000, 'Pure Mathematics', 2),
(48000, 'Theoretical Physics', 3),
(51000, 'Experimental Physics', 3);

INSERT INTO Groups (Name, Year, DepartmentId) VALUES
('Group A', 1, 1),
('Group B', 2, 1),
('Group C', 3, 2),
('Group D', 4, 2),
('Group E', 1, 3),
('Group F', 2, 3);

INSERT INTO Subjects (Name) VALUES
('Introduction to Programming'),
('Linear Algebra'),
('Quantum Mechanics');

INSERT INTO Teachers (Name, Salary, Surname) VALUES
('John', 60000, 'Doe'),
('Jane', 55000, 'Smith'),
('Dave', 58000, 'McQueen');

INSERT INTO Lectures (LectureRoom, SubjectId, TeacherId) VALUES
('Room 101', 1, 1),
('Room 202', 2, 2),
('Room 303', 3, 3);

INSERT INTO GroupsLectures (DayOfWeek, GroupId, LectureId) VALUES
(1, 1, 1),
(2, 2, 2),
(3, 3, 3);
