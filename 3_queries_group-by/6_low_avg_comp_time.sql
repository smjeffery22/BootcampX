SELECT students.name AS student, avg(assignment_submissions.duration) AS average_assignment_duration, avg(assignments.duration) AS average_estimated_duration
FROM assignments
JOIN assignment_submissions ON assignments.id = assignment_submissions.assignment_id
JOIN students ON assignment_submissions.student_id = students.id
WHERE students.end_date IS NULL
GROUP BY student
HAVING avg(assignment_submissions.duration) < avg(assignments.duration)
ORDER BY avg(assignment_submissions.duration);

-- SELECT student_id, avg(duration)
-- FROM assignment_submissions
-- WHERE student_id = '170'
-- GROUP BY student_id;

-- SELECT avg(duration)
-- FROM assignments