SELECT avg(total_durations.total_duration) AS averagetotal_duration
FROM (
  SELECT sum(completed_at - started_at) AS total_duration
  FROM assistance_requests
  JOIN students ON assistance_requests.student_id = students.id
  JOIN cohorts ON students.cohort_id = cohorts.id
  GROUP BY cohorts.name
  ORDER BY total_duration) AS total_durations;