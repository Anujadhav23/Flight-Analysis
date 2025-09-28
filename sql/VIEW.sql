CREATE VIEW V_AIR_TRAFFIC_INSIGHTS AS
SELECT 
    c.CityName,
    c.STATE_ABR,
    c.Population,
    
    -- Metrics for City as Origin
    COALESCE(SUM(CASE WHEN f.ORIGIN_AIRPORT_ID = a.AIRPORT_ID THEN fm.PASSENGERS ELSE 0 END), 0) AS Total_Outgoing_Passengers,
    ROUND(COALESCE(SUM(CASE WHEN f.ORIGIN_AIRPORT_ID = a.AIRPORT_ID THEN fm.PASSENGERS ELSE 0 END), 0) / NULLIF(c.Population, 0), 2) AS Origin_Pass_Pop_Ratio,

    -- Metrics for City as Destination
    COALESCE(SUM(CASE WHEN f.DEST_AIRPORT_ID = a.AIRPORT_ID THEN fm.PASSENGERS ELSE 0 END), 0) AS Total_Incoming_Passengers,
    ROUND(COALESCE(SUM(CASE WHEN f.DEST_AIRPORT_ID = a.AIRPORT_ID THEN fm.PASSENGERS ELSE 0 END), 0) / NULLIF(c.Population, 0), 2) AS Dest_Pass_Pop_Ratio
    
FROM 
    City c
JOIN 
    Airport a ON a.CITY_NAME = c.CityName -- Link City to its Airport(s)
LEFT JOIN 
    Flight f ON f.ORIGIN_AIRPORT_ID = a.AIRPORT_ID OR f.DEST_AIRPORT_ID = a.AIRPORT_ID -- Link Airport to Flights
LEFT JOIN 
    FlightMetrics fm ON f.FLIGHT_ID = fm.FLIGHT_ID
GROUP BY 
    c.CityName, c.STATE_ABR, c.Population
ORDER BY 
    Origin_Pass_Pop_Ratio DESC;
    
    
    SELECT * FROM V_AIR_TRAFFIC_INSIGHTS;
    
    # ### Busiest Routes View (V_BUSIEST_ROUTES_BY_FLIGHTS) ✈️
    CREATE VIEW V_BUSIEST_ROUTES_BY_FLIGHTS AS
SELECT 
    a1.CITY_NAME AS ORIGIN_CITY,
    a2.CITY_NAME AS DEST_CITY,
    COUNT(*) AS FLIGHT_COUNT
FROM 
    Flight f
JOIN 
    Airport a1 ON f.ORIGIN_AIRPORT_ID = a1.AIRPORT_ID
JOIN 
    Airport a2 ON f.DEST_AIRPORT_ID = a2.AIRPORT_ID
GROUP BY 
    a1.CITY_NAME, a2.CITY_NAME
ORDER BY 
    FLIGHT_COUNT DESC
LIMIT 10;
SELECT * FROM V_BUSIEST_ROUTES_BY_FLIGHTS;

####  Busiest Cities View (V_BUSIEST_CITIES_BY_PASSENGERS) 🏙️

CREATE VIEW V_BUSIEST_CITIES_BY_PASSENGERS AS
SELECT 
    a.CITY_NAME,
    a.STATE_ABR,
    SUM(fm_out.PASSENGERS) AS Total_Outgoing_Passengers,
    SUM(fm_in.PASSENGERS) AS Total_Incoming_Passengers,
    SUM(fm_out.PASSENGERS) + SUM(fm_in.PASSENGERS) AS Grand_Total_Passengers
FROM 
    Airport a
LEFT JOIN 
    Flight f_out ON a.AIRPORT_ID = f_out.ORIGIN_AIRPORT_ID
LEFT JOIN 
    FlightMetrics fm_out ON f_out.FLIGHT_ID = fm_out.FLIGHT_ID
LEFT JOIN 
    Flight f_in ON a.AIRPORT_ID = f_in.DEST_AIRPORT_ID
LEFT JOIN 
    FlightMetrics fm_in ON f_in.FLIGHT_ID = fm_in.FLIGHT_ID
GROUP BY 
    a.CITY_NAME, a.STATE_ABR
ORDER BY 
    Grand_Total_Passengers DESC;
    
    CREATE VIEW V_BUSIEST_CITIES_BY_PASSENGERS AS
SELECT 
    a.CITY_NAME,
    a.STATE_ABR,
    SUM(fm_out.PASSENGERS) AS Total_Outgoing_Passengers,
    SUM(fm_in.PASSENGERS) AS Total_Incoming_Passengers,
    SUM(fm_out.PASSENGERS) + SUM(fm_in.PASSENGERS) AS Grand_Total_Passengers
FROM 
    Airport a
LEFT JOIN 
    Flight f_out ON a.AIRPORT_ID = f_out.ORIGIN_AIRPORT_ID
LEFT JOIN 
    FlightMetrics fm_out ON f_out.FLIGHT_ID = fm_out.FLIGHT_ID
LEFT JOIN 
    Flight f_in ON a.AIRPORT_ID = f_in.DEST_AIRPORT_ID
LEFT JOIN 
    FlightMetrics fm_in ON f_in.FLIGHT_ID = fm_in.FLIGHT_ID
GROUP BY 
    a.CITY_NAME, a.STATE_ABR
ORDER BY 
    Grand_Total_Passengers DESC;