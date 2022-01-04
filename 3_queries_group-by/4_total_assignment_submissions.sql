-- SELECT cohorts.name AS cohort, COUNT(assignment_submissions.id) AS total_submissions
-- FROM cohorts
-- JOIN students ON cohorts.id = students.cohort_id
-- JOIN assignment_submissions ON students.id = assignment_submissions.student_id
-- GROUP BY cohorts.name
-- ORDER BY total_submissions DESC;

SELECT cohorts.name AS cohort, COUNT(assignment_submissions.id) AS total_submissions
FROM assignment_submissions
JOIN students ON assignment_submissions.student_id = students.id
JOIN cohorts ON students.cohort_id = cohorts.id
GROUP BY cohorts.name
ORDER BY total_submissions DESC;