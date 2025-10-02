# Formula1_SQL
## About the Project
This project analyzes a rich Formula 1 race dataset stored in a SQLite database. It demonstrates advanced SQL techniques such as complex joins, aggregations, window functions, and CTEs to explore drivers', constructors', and circuits' performance across multiple seasons.

## General Project Description
The database includes detailed tables capturing race results, qualifying data, lap times, circuits, drivers, and constructors. This enables comprehensive exploration of Formula 1 trends and statistics through SQL queries.

## Physical Model
The database schema represents entities such as races, drivers, constructors, and circuits in separate related tables. The core relations link race results with driver and constructor information, allowing detailed performance analysis.

## Physical Model Diagram
[Include an image diagram of the database schema here]
Comments: The primary keys and foreign keys connect results to races, drivers to constructors, and lap times to specific races, ensuring referential integrity.

## Use Cases
- Analyze driver win counts by season
- Track constructor points accumulation annually
- Identify fastest laps and qualifying performance by circuit
- Compare driver championship standings across years
- How to Run and Test the Project
- Download and open the SQLite database file in any SQL client.
- Run provided SQL scripts sequentially to explore different analytical queries.
- Validate outputs by checking known historical F1 results or use sample test queries included.

## Scripts
01_schema.sql: Creates or documents the database schema structure.
02_data_exploration.sql: Runs basic exploration and summary queries.
03_driver_analysis.sql: Analyzes driver stats and rankings.
04_constructor_analysis.sql: Examines constructor points and wins.
05_lap_times.sql: Investigates lap time distributions and fastest laps.

Each script builds on the previous, providing increasingly detailed insights. Scripts expect the original dataset schema and complete data download.

## Potential Applications
- Sports analytics dashboards
- Historical F1 performance research
- Data science model training on racing data
- Educational tool in advanced SQL querying
