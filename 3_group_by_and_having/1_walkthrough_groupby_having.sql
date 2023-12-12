-- calculate the total number of assignment_submissions for all students, the count aggregate function is perfect.

SELECT count(assignment_submissions.*) as total_submissions
FROM assignment_submissions;

SELECT students.name as student, count(assignment_submissions.*) as total_submissions
FROM assignment_submissions
JOIN students ON students.id = student_id
GROUP BY students.name;

-- only return currently enrolled students. A currently enrolled student has a null end_date.
SELECT students.name as student, count(assignment_submissions.*) as total_submissions
FROM assignment_submissions
JOIN students ON students.id = student_id
WHERE students.end_date IS NULL
GROUP BY students.name;


-- HAVING // The HAVING clause is like WHERE but works on aggregated data. Our WHERE clause works on
-- normal data students.end_date and our HAVING clause works on the aggregated data count(assignment_submissions.*).

SELECT students.name as student, count(assignment_submissions.*) as total_submissions
FROM assignment_submissions
JOIN students ON students.id = student_id
WHERE students.end_date IS NULL
GROUP BY students.name
HAVING count(assignment_submissions.*) < 100;