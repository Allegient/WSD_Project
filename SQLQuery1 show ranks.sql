select tipsters.gname AS 'First Name', 
tipsters.sname AS 'Last Name', 
ABS(tips.game1 - results.game1) AS 'Error Points' from tips 
INNER JOIN tipsters ON tips.username = tipsters.username 
INNER JOIN results ON tips.roundID = results.roundID 
WHERE tips.roundID = 2

