SELECT AVG(rating), categories
FROM reviews
GROUP BY categories
ORDER BY avg(rating) DESC
LIMIT 5
