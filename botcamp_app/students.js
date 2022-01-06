const { Pool } = require('pg');

const pool = new Pool ({
  user: 'vagrant',
  password: '123',
  host: 'localhost',
  database: 'bootcampx'
});

const cohortName = process.argv[2];
const limit = process.argv[3];

pool.query(`
SELECT s.id, s.name AS student_name, c.name AS cohort_name
FROM students AS s
JOIN cohorts as c ON s.cohort_id = c.id
WHERE c.name LIKE $1
LIMIT $2;
`, [`%${cohortName}%`, limit])
.then(res => {
  res.rows.forEach(user => {
    console.log(`${user.student_name} has an id of ${user.id} and was in the ${user.cohort_name} cohort`);
  })
})
.catch(err => console.log('query error', err.stack));
