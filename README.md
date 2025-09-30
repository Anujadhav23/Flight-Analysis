# ✈️ Flight Analysis Project

## 📄 Project Description
This project analyzes flight data to explore patterns in passenger traffic, airport performance, flight frequency, and the relationship between city population and air traffic.  
**💻 Tech Stack:** SQL (MySQL 8.0+)

## 📂 Folder Structure

```bash
flight-analysis/
├── sql/
│   ├── db-and-table-create.sql
│   ├── data-insert.sql
│   ├── data-cleaning.sql
│   ├── city-pop-insert.sql
│   ├── analysis-queries.sql
│   ├── city-airport-performance.sql
│   ├── high-traffic-corridors.sql
│   ├── total-pass-served-over-time.sql
│   ├── pop-vs-traffic.sql
│   ├── pop-vs-traffic-part2.sql
│   └── VIEW.sql
├── data/
│   ├── meta_data.csv
│   └── all_city_pop.csv
└── README.md


---

## ⚡ Requirements
- MySQL 8.0+ installed  
- MySQL Workbench or any MySQL client  
- **MetaData.csv** pre-loaded into `MetaData` table  
- Optional: `all_city_pop` table for population analysis  

---

## 🏃‍♂️ How to Run

 Step 1 – Create Database and Tables 🏗️
```sql
db-and-table-create.sql

Step 2 – Import MetaData CSV & Insert Data 📥

Open MySQL Workbench → Select database → Right-click MetaData → Table Data Import Wizard

Select MetaData.csv

Ensure columns match

Click Next → Finish

Then run:

data-insert.sql

Step 3 – Clean and Prepare Data 🧹

data-cleaning.sql

Step 4 – City Table Cleaning & Population Integration 🏙️

city-pop-insert.sql

Step 5 – Flight Frequency & Route Analysis 📈

analysis-queries.sql

Step 6 – City & Airport Performance 📊

city-airport-performance.sql

Step 7 – Total Passengers Over Time 🕒

total-pass-served-over-time.sql

Step 8 – Population vs Traffic Analysis 🧑‍✈️

pop-vs-traffic.sql
pop-vs-traffic-part2.sql

Step 9 – Final Views 🏁

VIEW.sql

💡 Notes

Follow steps in order to avoid dependency errors

Each SQL file is modular

Use VIEW.sql for final reporting

🌟 Tips for Users

Double-check CSV columns

Make backups if modifying tables
Use LIMIT in queries for testing large datasets


---

### **Step 3 – Save README**
- Save the file in VS Code (**Ctrl + S**).  

---

### **Step 4 – Commit & Push**
```bash
git add README.md
git commit -m "Add structured README with proper markdown"
git push origin main
