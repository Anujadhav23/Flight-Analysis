✈️ Flight Analysis Project
📄 Project Description

This project analyzes flight data to explore patterns in passenger traffic, airport performance, flight frequency, and the relationship between city population and air traffic. The dataset includes airlines, airports, flights, and metrics.

💻 Tech Stack: SQL (MySQL 8.0+)

🗂 Folder Structure
flight-analysis/
│
├─ sql/
│  ├─ db-and-table-create.sql               # Create database and tables
│  ├─ data-insert.sql                       # Insert data into tables from MetaData
│  ├─ data-cleaning.sql                     # Clean and prepare the data
│  ├─ city-pop-insert.sql                   # City table cleaning & population integration
│  ├─ analysis-queries.sql                  # Flight frequency & busiest routes
│  ├─ city-airport-performance.sql          # Origin & destination city performance
│  ├─ high-traffic-corridors.sql            # High-traffic flight corridors
│  ├─ total-pass-served-over-time.sql       # Passengers served over time
│  ├─ pop-vs-traffic.sql                    # Population vs. air traffic analysis (part 1)
│  ├─ pop-vs-traffic-part2.sql              # Population vs. air traffic analysis (part 2)
│  └─ VIEW.sql                              # Final aggregated views (run last)

⚡ Requirements

MySQL 8.0+ installed

MySQL Workbench or other MySQL client

MetaData.csv pre-loaded into the MetaData table

Optional: all_city_pop table for population analysis

🏃‍♂️ How to Run
Step 1 – Create Database and Tables 🏗️
-- Run first
db-and-table-create.sql

Step 2 – Import MetaData CSV & Insert Data 📥

Before running data-insert.sql, import MetaData.csv into the MetaData table.

Using MySQL Workbench Import Wizard:

Open MySQL Workbench → Select your database → Right-click MetaData table → Table Data Import Wizard.

Select your MetaData.csv file.

Ensure CSV columns match table columns.

Click Next → Finish to load the data.

Once imported, run:

data-insert.sql

Step 3 – Clean and Prepare Data 🧹
data-cleaning.sql


Cleans raw data and prepares tables for analysis.

Step 4 – City Table Cleaning & Population Integration 🏙️
city-pop-insert.sql


Creates City_New staging table with population from all_city_pop

Cleans city names (removes extra text like state/country)

Updates Airport table for consistency

Renames City_New to City

Step 5 – Flight Frequency & Route Analysis 📈
analysis-queries.sql


Busiest routes by total passengers

Flight count for high-traffic corridors

Step 6 – City & Airport Performance 📊
city-airport-performance.sql


Passenger totals and flight counts for origin and destination cities

Step 7 – Total Passengers Over Time 🕒
total-pass-served-over-time.sql


Summarizes total passengers monthly and yearly

Step 8 – Population vs Traffic Analysis 🧑‍✈️
pop-vs-traffic.sql
pop-vs-traffic-part2.sql


Part 1: Total passengers vs city population

Part 2: Passengers-to-population ratio (origin & destination cities)

Step 9 – Final Views 🏁
VIEW.sql


Aggregates final results for reporting

💡 Notes

Always follow the steps in the given order to avoid foreign key or dependency errors.

Each SQL file focuses on one analysis step, keeping the project modular.

Use the final VIEW.sql to generate aggregated views for reporting.

🌟 Tips for Users

Always double-check CSV columns when importing.

Make backups of tables if you want to test modifications.

Use LIMIT in queries if your dataset is very large for testing.