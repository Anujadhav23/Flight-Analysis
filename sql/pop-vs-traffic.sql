## Cities as Origin - Total Passengers
SELECT 
    c.CITY_NAME,
    c.POPULATION,
    SUM(fm.PASSENGERS) AS TOTAL_PASSENGERS
FROM City c
JOIN Airport a ON a.CITY_NAME = c.CITY_NAME
JOIN Flight f ON f.ORIGIN_AIRPORT_ID = a.AIRPORT_ID
JOIN Flightmetrics fm ON f.FLIGHT_ID = fm.FLIGHT_ID
GROUP BY c.CITY_NAME, c.POPULATION
ORDER BY TOTAL_PASSENGERS DESC;

## Cities as Origin - Passengers-to-Population Ratio
SELECT 
    c.CITY_NAME,
    c.POPULATION,
    SUM(fm.PASSENGERS) AS TOTAL_PASSENGERS,
    round(SUM(fm.PASSENGERS)/c.Population,2) as Pass_Pop_Ratio  
FROM City c
JOIN Airport a ON a.CITY_NAME = c.CITY_NAME
JOIN Flight f ON f.ORIGIN_AIRPORT_ID = a.AIRPORT_ID
JOIN Flightmetrics fm ON f.FLIGHT_ID = fm.FLIGHT_ID
GROUP BY c.CITY_NAME, c.POPULATION
ORDER BY Pass_Pop_ratio DESC;