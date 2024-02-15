# ETL and Data Pipelines<br/>

## Assignment 1 - ETL <br/>

### Scenario <br/>
You are a data engineer at an e-commerce company. You need to keep data synchronized between different databases/data warehouses as a part of your daily routine. One task that is routinely performed is the sync up of staging data warehouse and production data warehouse. Automating this sync up will save you a lot of time and standardize your process. You will be given a set of python scripts to start with. You will use/modify them to perform the incremental data load from MySQL server which acts as a staging warehouse to the IBM DB2 or PostgreSQL which is a production data warehouse. This script will be scheduled by the data engineers to sync up the data between the staging and production data warehouse. <br>

### Objectives <br/>
* Connect to IBM DB2 or PostgreSQL data warehouse and identify the last row on it.
* Connect to MySQL staging data warehouse and find all rows later than the last row on the datawarehouse.
* Insert the new data in the MySQL staging data warehouse into the IBM DB2 or PostgreSQL production data warehouse.

### Tools / Software <br/>
* MySQL Server
* IBM DB2 or PostgreSQL

## Assignment 2 - Data Pipelines using Apache AirFlow<br/>

### Scenario <br/>
Write a pipeline that analyzes the web server log file, extracts the required lines(ending with html) and fields(time stamp, size ) and transforms (bytes to mb) and load (append to an existing file.) <br/>

### Objectives <br/>
* Extract data from a web server log file
* Transform the data
* Load the transformed data into a tar file

### Tools / Software <br/>
* Apache AirFlow
