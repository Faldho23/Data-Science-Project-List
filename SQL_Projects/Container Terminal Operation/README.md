# Container Operations Management System

## Overview
This project is an academic group project for **IT2002 Database Technology and Management**. The goal is to design and implement a database application to manage container operations at the **Persinggahan terminal**. The application tracks ships arriving at different berths and containers being loaded, unloaded, and transferred within the terminal's yard. The system stores information about containers, ships, berths, and yard locations, and tracks real-time and expected statuses of these entities.

## Project Components

### 1. **Conceptual Design**
   - Create an entity-relationship diagram (ERD) to represent the database schema, including candidate keys and cardinality constraints.

### 2. **Logical Design**
   - Translate the ERD into SQL data definition language (DDL) code, defining tables and integrity constraints.

### 3. **Data Population**
   - Populate the database with realistic fake data to simulate real-world operations.

### 4. **Workload Preparation**
   - Develop a set of SQL data manipulation commands to demonstrate the database's capabilities, including scheduling ships, logging container movements, and generating reports.

### 5. **Constraint Checking**
   - Write SQL queries to ensure that schedules and movements are consistent with defined constraints.

### 6. **Constraint Enforcement**
   - Implement stored functions and triggers to enforce constraints, ensuring data integrity.

## Deliverables
- Entity-Relationship Diagram (ERD)
- SQL DDL Code (for table creation, data population, and queries)
- Video Presentation demonstrating the application's features and justifying design choices.

## Repository Structure
1. **ApasajaClean.sql** : SQL script for cleaning the database
2. **ApasajaSchema.sql** : SQL script for creating the database schema
3. **Container Terminal Operation.pdf** : Documentation or project report
4. **documentation/** : Folder for additional documentation
5. **populate/** : Folder for scripts or data used to populate the database
6. **queries/** : Folder containing SQL queries for workload and testing

## Getting Started
1. Clone the repository.
2. Set up the database by running **ApasajaSchema.sql**, then populate it using the files in the **populate** folder.
3. Run the queries in the **/queries** folder to test the database.
4. The database is now ready to operate and can be used to simulate container terminal operations.
