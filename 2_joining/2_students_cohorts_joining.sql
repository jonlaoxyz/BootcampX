SELECT students.name as student_name, email, cohorts.name as cohort_name
FROM students JOIN cohorts ON cohort_id = cohorts.id;


SELECT students.name as student_name, email, cohorts.name as cohort_name
FROM students INNER JOIN cohorts ON cohorts.id = cohort_id;


--- The LEFT OUTER JOIN will return all of the students, even ones without a cohort_id.
SELECT students.name as student_name, email, cohorts.name as cohort_name
FROM students LEFT OUTER JOIN cohorts ON cohorts.id = cohort_id;

--- The RIGHT OUTER JOIN will return all cohorts, even ones without any students enrolled.
SELECT students.name as student_name, email, cohorts.name as cohort_name
FROM students RIGHT OUTER JOIN cohorts ON cohorts.id = cohort_id;


--- The FULL OUTER JOIN will return all cohorts and all students, even when there is no match.
SELECT students.name as student_name, email, cohorts.name as cohort_name
FROM students FULL OUTER JOIN cohorts ON cohorts.id = cohort_id;

--
-- 1. FROM students LEFT OUTER JOIN cohorts ON cohorts.id = cohort_id;
-- 2. FROM students RIGHT OUTER JOIN cohorts ON cohorts.id = cohort_id;
-- 3. FROM students FULL OUTER JOIN cohorts ON cohorts.id = cohort_id;
-- The first query will return all students because students is to the LEFT of the word JOIN.
-- The second query will return all of the cohorts because cohorts is to the RIGHT of the word JOIN.
-- The third query will return all rows from both tables, even when there is no match.

-- Select all rollover students.

SELECT students.name, cohorts.name, cohorts.start_date as cohort_start_date, students.start_date as student_start_date
FROM students
JOIN cohorts ON cohort_id = cohorts.id
WHERE cohorts.start_date != students.start_date
ORDER BY cohort_start_date;