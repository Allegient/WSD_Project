select fixtures.home2, CASE WHEN results.game2 > 0 THEN 'Wins' WHEN results.game2 = 0 THEN 'Draws with' WHEN results.game2 < 0 THEN 'Loses to'END AS Result, fixtures.away2, ABS(results.game2) AS Margin from fixtures INNER JOIN results on fixtures.roundID = results.roundID where fixtures.roundID = 2



