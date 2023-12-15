#!/bin/bash

# Task 1: Start the Postgres server.
start_postgres


# Task 2: Create the table.
# Connect to the database server
psql --username=postgres --host=localhost
# Connect to a database
\c template1;
# Create the table
CREATE TABLE access_log(timestamp TIMESTAMP, latitude float, longitude float, visitor_id char(37));
# Quit the psql client
\q


# Task 3. Create a shell script named cp-access-log.sh and add commands to complete the remaining tasks to extract and copy the data to the database.
# cp-access-log.sh
# This script downloads the file 'web-server-access-log.txt.gz'
# from "https://cf-courses-data.s3.us.cloud-object-storage.appdomain.cloud/IBM-DB0250EN-SkillsNetwork/labs/Bash%20Scripting/ETL%20using%20shell%20scripting/".
# The script then extracts the .txt file using gunzip.
# The .txt file contains the timestamp, latitude, longitude
# and visitor id apart from other data.
# Transforms the text delimeter from "#" to "," and saves to a csv file.
# Loads the data from the CSV file into the table 'access_log' in PostgreSQL database.


# Task 4. Download the access log file.
# Download the access log file
wget "https://cf-courses-data.s3.us.cloud-object-storage.appdomain.cloud/IBM-DB0250EN-SkillsNetwork/labs/Bash%20Scripting/ETL%20using%20shell%20scripting/web-server-access-log.txt.gz"


# Task 5. Unzip the gzip file.
# Unzip the file to extract the .txt file.
gunzip -f web-server-access-log.txt.gz


# Task 6. Extract required fields from the file.
# Extract the columns 1 (timestamp), 2 (latitude), 3 (longitude) and 4 (visitorid)
cut -d"#" -f1-4 web-server-access-log.txt


# Task 7. Redirect the extracted output into a file.
# cp-access-log.sh
# This script downloads the file 'web-server-access-log.txt.gz'
# from "https://cf-courses-data.s3.us.cloud-object-storage.appdomain.cloud/IBM-DB0250EN-SkillsNetwork/labs/Bash%20Scripting/ETL%20using%20shell%20scripting/".
# The script then extracts the .txt file using gunzip.
# The .txt file contains the timestamp, latitude, longitude
# and visitor id apart from other data.
# Transforms the text delimeter from "#" to "," and saves to a csv file.
# Loads the data from the CSV file into the table 'access_log' in PostgreSQL database.
# Download the access log file
wget "https://cf-courses-data.s3.us.cloud-object-storage.appdomain.cloud/IBM-DB0250EN-SkillsNetwork/labs/Bash%20Scripting/ETL%20using%20shell%20scripting/web-server-access-log.txt.gz"
# Unzip the file to extract the .txt file.
gunzip -f web-server-access-log.txt.gz
# Extract phase
echo "Extracting data"
# Extract the columns 1 (timestamp), 2 (latitude), 3 (longitude) and 4 (visitorid)
cut -d"#" -f1-4 web-server-access-log.txt > extracted-data.txt

# Save the file and run the script
bash cp-access-log.sh

# Verify that the file extracted-data.txt is created
cat extracted-data.txt


# Task 8. Transform the data into CSV format.
# cp-access-log.sh
# This script downloads the file 'web-server-access-log.txt.gz'
# from "https://cf-courses-data.s3.us.cloud-object-storage.appdomain.cloud/IBM-DB0250EN-SkillsNetwork/labs/Bash%20Scripting/ETL%20using%20shell%20scripting/".
# The script then extracts the .txt file using gunzip.
# The .txt file contains the timestamp, latitude, longitude
# and visitor id apart from other data.
# Transforms the text delimeter from "#" to "," and saves to a csv file.
# Loads the data from the CSV file into the table 'access_log' in PostgreSQL database.
# Download the access log file
wget "https://cf-courses-data.s3.us.cloud-object-storage.appdomain.cloud/IBM-DB0250EN-SkillsNetwork/labs/Bash%20Scripting/ETL%20using%20shell%20scripting/web-server-access-log.txt.gz"
# Unzip the file to extract the .txt file.
gunzip -f web-server-access-log.txt.gz
# Extract phase
echo "Extracting data"
# Extract the columns 1 (timestamp), 2 (latitude), 3 (longitude) and 4 (visitorid)
cut -d"#" -f1-4 web-server-access-log.txt > extracted-data.txt
# Transform phase
echo "Transforming data"
# Read the extracted data and replace the 
tr "#" "," < extracted-data.txt > transformed-data.csv

# Save the file and run the script
bash cp-access-log.sh

# Verify that the file extracted-data.txt is created
cat transformed-data.csv


# Task 9. Load the data into the table access_log in PostgreSQL
# cp-access-log.sh
# This script downloads the file 'web-server-access-log.txt.gz'
# from "https://cf-courses-data.s3.us.cloud-object-storage.appdomain.cloud/IBM-DB0250EN-SkillsNetwork/labs/Bash%20Scripting/ETL%20using%20shell%20scripting/".
# The script then extracts the .txt file using gunzip.
# The .txt file contains the timestamp, latitude, longitude
# and visitor id apart from other data.
# Transforms the text delimeter from "#" to "," and saves to a csv file.
# Loads the data from the CSV file into the table 'access_log' in PostgreSQL database.
# Download the access log file
wget "https://cf-courses-data.s3.us.cloud-object-storage.appdomain.cloud/IBM-DB0250EN-SkillsNetwork/labs/Bash%20Scripting/ETL%20using%20shell%20scripting/web-server-access-log.txt.gz"
# Unzip the file to extract the .txt file.
gunzip -f web-server-access-log.txt.gz
# Extract phase
echo "Extracting data"
# Extract the columns 1 (timestamp), 2 (latitude), 3 (longitude) and 4 (visitorid)
cut -d"#" -f1-4 web-server-access-log.txt > extracted-data.txt
# Transform phase
echo "Transforming data"
# Read the extracted data and replace the 
tr "#" "," < extracted-data.txt > transformed-data.csv
# Load phase
echo "Loading data"
# Send the instructions to connect to 'template1' and
# copy the file to the table 'access_log' through command pipeline.
echo "\c template1;\COPY access_log FROM '/home/project/transformed-data.csv' DELIMITERS ',' CSV HEADER;" | psql --username=postgres --host=localhost


# Task 10. Execute the final script.
bash cp-access-log.sh


# Task 11. Verify by querying the database.
# Run the command below at the shell prompt to verify that the table accesss_log is populated with the data.
echo '\c template1; \\SELECT * FROM access_log;' | psql --username=postgres --host=localhost

