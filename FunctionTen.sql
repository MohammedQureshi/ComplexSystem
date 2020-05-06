SELECT COUNT(reviews.gplusplaceid), reviews.gplusplaceid, places.name
FROM reviews
INNER JOIN places
ON reviews.gplusplaceid=places.gplusplaceid
GROUP BY gplusplaceid, places.name 
ORDER BY COUNT(gplusplaceid) DESC LIMIT 1;
