SELECT AVG(rating), categories
FROM reviews
GROUP BY categories
