SELECT users.gplususerid, reviews.reviewtext, users.jobs
FROM users
INNER JOIN reviews ON reviews.gplususerid=users.gplususerid
WHERE users.jobs = 'IT Specialist'
