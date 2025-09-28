## Total Passengers Served in the duration (Monthly).
SELECT 
    f.YEAR,
    f.MONTH,
    round(SUM(fm.PASSENGERS)/1000000,2) AS TOTAL_PASSENGERS_MILLIONS
FROM Flight f
JOIN Flightmetrics fm ON f.FLIGHT_ID = fm.FLIGHT_ID
GROUP BY f.YEAR, f.MONTH
ORDER BY f.YEAR, f.MONTH;