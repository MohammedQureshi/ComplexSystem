SELECT COUNT(closed)
FROM places
WHERE closed='False'
AND price = '${var:variable_name}'
