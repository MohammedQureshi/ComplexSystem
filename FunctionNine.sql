SELECT COUNT(gplusplaceid), gplusplaceid
FROM reviews
GROUP BY gplusplaceid
HAVING COUNT(gplusplaceid) >= 3
