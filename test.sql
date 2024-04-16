-- 4
select a.AssignmentID, avg(s.POINTS), max(s.POINTS), min(s.POINTS) from ASSIGNMENT a, SCORE s where a.AssignmentID=2 AND s.AssignmentID=a.AssignmentID;

-- 5
select s.FirstName from STUDENT s where s.StudentID in (select e.StudentID from ENROLLMENT e where e.CourseID=85675);
select s.StudentID, s.FirstName from STUDENT s JOIN ENROLLMENT e where e.CourseID = 85675 and s.StudentID = e.StudentID;


-- 6


SELECT DISTINCT pt.StudentID, st.FirstName, st.LastName, pt.CourseID,pt.AssignmentID, pt.CategoryName, pt.Points, pt.PointsPossible, pt.Percentage
FROM (
    SELECT STUDENT.StudentID, AssignmentID, FirstName, LastName, CourseID, Points
    FROM STUDENT JOIN ENROLLMENT JOIN SCORE
    WHERE STUDENT.StudentID = ENROLLMENT.StudentID
    AND STUDENT.StudentID = SCORE.StudentID) st
JOIN

(SELECT StudentID, CourseID, CategoryName, ASSIGNMENT.AssignmentID, Points, ASSIGNMENT.PointsPossible, DISTRIBUTION.Percentage
    FROM DISTRIBUTION JOIN ASSIGNMENT JOIN SCORE
    WHERE DISTRIBUTION.DistributionID = ASSIGNMENT.DistributionID
    AND ASSIGNMENT.AssignmentID = SCORE.AssignmentID) pt
WHERE st.AssignmentID = pt.AssignmentID


-- 7
-- Add an assignment to a course
INSERT INTO Assignment (ASSIGNMENT.AssignmentID, CourseID, CategoryName, Points, PointsPossible);     
VALUES (1, 1, 'Assignment 1', 10, 10);


-- 8
-- Change the percentages of the categories for a course;
UPDATE DISTRIBUTION
SET Percentage = 50
WHERE CourseID = 1;


-- 9 
-- Add two points to the score of each student on an assignment
UPDATE SCORE
SET Points = Points + 2
WHERE AssignmentID = 1;

-- 10
-- Add 2 points just to those students who last name begins with a 'Q'
UPDATE SCORE
SET Points = Points + 2
WHERE StudentID IN (
    SELECT StudentID
    FROM STUDENT
    WHERE LastName LIKE 'Q%');

-- 11 
-- Compute the grade for a student
SELECT FirstName, LastName, Points, PointsPossible, (Points/PointsPossible)*100 AS Grade
FROM STUDENT JOIN SCORE
WHERE STUDENT.StudentID = SCORE.StudentID;

-- 12
-- Compute the grade for a student, where the lowest score for a given category is dropped.
SELECT FirstName, LastName, Points, PointsPossible, (Points/PointsPossible)*100 AS Grade
FROM STUDENT JOIN SCORE
WHERE STUDENT.StudentID = SCORE.StudentID
GROUP BY FirstName, LastName, Points, PointsPossible;

