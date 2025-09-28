### Compare passenger numbers across origin cities to identify top-performing airports.
## Total Passengers and Total No. of Flights (Origin City)
SELECT 
    a.CITY_NAME AS ORIGIN_CITY,
    SUM(fm.PASSENGERS) AS TOTAL_PASSENGERS,
    COUNT(f.FLIGHT_ID) AS TOTAL_FLIGHTS
FROM Flight f
JOIN Flightmetrics fm ON f.FLIGHT_ID = fm.FLIGHT_ID
JOIN Airport a ON f.ORIGIN_AIRPORT_ID = a.AIRPORT_ID
GROUP BY a.CITY_NAME
ORDER BY Total_Flights DESC;