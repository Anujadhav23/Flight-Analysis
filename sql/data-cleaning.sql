use flight_analysis;

-- Create a temporary/staging table City_New to hold city data with population
-- Note: 'all_city_pop' must be pre-loaded with population data for this to work.
create table City_New
(select c.City_id,
        substring_index(c.CityName,',',1) as City_Name,
        c.State_ABR,
        c.State_NM, 
        a.Population
from City c
left join all_city_pop as a
on a.city_name = c.CityName); -- Assuming CityName in 'all_city_pop' is the full name

-- Drop original City table (or rename it if you want a backup)
DROP TABLE City;

-- Rename the clean table to City
Alter table City_New rename City;

-- Update City Name in Airport table for consistency (e.g., stripping state/country info)
SET SQL_Safe_Updates = 0; -- Temporarily disable safe updates for bulk updates
update airport
set City_Name = SUBSTRING_INDEX(city_name,',',1);

-- Clean up City Table: Update CityName to only contain the city name part
-- Note: The logic in City_New already did this, but this is a fail-safe if the original City table was used.
-- The most robust method is to use the City table created above (City_New renamed to City).
-- If City table still has full names, run this:
-- update City
-- set CityName = SUBSTRING_INDEX(cityname,',',1);
SET SQL_Safe_Updates = 1; -- Re-enable safe updates