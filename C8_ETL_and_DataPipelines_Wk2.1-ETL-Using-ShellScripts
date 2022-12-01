#!/bin/bash

# Exercise 1 - Extracting data using cut command

# The command below shows how to extract the first four characters.
echo "database" | cut -c1-4

# The command below shows how to extract 5th to 8th characters.
echo "database" | cut -c5-8

# The command below shows how to extract the 1st and 5th characters.
echo "database" | cut -c1,5

# The command below extracts user names (the first field) from /etc/passwd.
cut -d":" -f1 /etc/passwd 

# The command below extracts multiple fields 1st, 3rd, and 6th (username, userid, and home directory) from /etc/passwd.
cut -d":" -f1,3,6 /etc/passwd 

# The command below extracts a range of fields 3rd to 6th (userid, groupid, user description and home directory) from /etc/passwd.
cut -d":" -f3-6 /etc/passwd 



# Exercise 2 - Transforming data using tr

# The command below translates all lower case alphabets to upper case.
echo "Shell Scripting" | tr "[a-z]" "[A-Z]" 
echo "Shell Scripting" | tr "[:lower:]" "[:upper:]" 

# The command below translates all upper case alphabets to lower case.
echo "Shell Scripting" | tr  "[A-Z]" "[a-z]" 

# The command below replaces repeat occurrences of 'space' in the output of ps command with one 'space'.
ps | tr -s " "
ps | tr -s "[:space:]"

# The command below deletes all digits.
echo "My login pin is 5634" | tr -d "[:digit:]"



# Exercise 3 - Start the PostgreSQL database.
start_postgres



# Exercise 4 - Create a table

# Step 1: Connect to the database server
psql --username=postgres --host=localhost

# Step 2: Connect to a database.
\c template1

# Step 3: Create the table
create table users(username varchar(50),userid int,homedirectory varchar(100));

# Step 4: Quit the psql client
\q



# Exercise 5 - Loading data into a PostgreSQL table.

# 5.1. Create a shell script
# This script
# Extracts data from /etc/passwd file into a CSV file.
# The csv data file contains the user name, user id and
# home directory of each user account defined in /etc/passwd.
# Transforms the text delimiter from ":" to ",".
# Loads the data from the CSV file into a table in PostgreSQL database.
# Extract phase
echo "Extracting data"
# Extract the columns 1 (user name), 2 (user id) and
# 6 (home directory path) from /etc/passwd
cut -d":" -f1,3,6 /etc/passwd

# 5.2 Save the file and run the script
bash csv2db.sh

# 5.3. Redirect the extracted output into a file.
# This script
# Extracts data from /etc/passwd file into a CSV file.
# The csv data file contains the user name, user id and
# home directory of each user account defined in /etc/passwd.
# Transforms the text delimiter from ":" to ",".
# Loads the data from the CSV file into a table in PostgreSQL database.
# Extract phase
echo "Extracting data"
# Extract the columns 1 (user name), 2 (user id) and
# 6 (home directory path) from /etc/passwd
cut -d":" -f1,3,6 /etc/passwd > extracted-data.txt

# Save the file and run the script
bash csv2db.sh

# Verify that the file extracted-data.txt is created
cat extracted-data.txt

# 5.4. Transform the data into CSV format
# This script
# Extracts data from /etc/passwd file into a CSV file.
# The csv data file contains the user name, user id and
# home directory of each user account defined in /etc/passwd.
# Transforms the text delimiter from ":" to ",".
# Loads the data from the CSV file into a table in PostgreSQL database.
# Extract phase
echo "Extracting data"
# Extract the columns 1 (user name), 2 (user id) and
# 6 (home directory path) from /etc/passwd
cut -d":" -f1,3,6 /etc/passwd > extracted-data.txt
# Transform phase
echo "Transforming data"
# Read the extracted data and replace the colons with commas.
tr ":" "," < extracted-data.txt > transformed-data.csv

# Save the file and run the script
bash csv2db.sh

# Verify that the file transformed-data.csv is created
cat transformed-data.csv

# 5.5. Load the data into the table 'users' in PostgreSQL
# This script
# Extracts data from /etc/passwd file into a CSV file.
# The csv data file contains the user name, user id and
# home directory of each user account defined in /etc/passwd.
# Transforms the text delimiter from ":" to ",".
# Loads the data from the CSV file into a table in PostgreSQL database.
# Extract phase
echo "Extracting data"
# Extract the columns 1 (user name), 2 (user id) and
# 6 (home directory path) from /etc/passwd
cut -d":" -f1,3,6 /etc/passwd > extracted-data.txt
# Transform phase
echo "Transforming data"
# Read the extracted data and replace the colons with commas.
tr ":" "," < extracted-data.txt > transformed-data.csv
# Load phase
echo "Loading data"
# Send the instructions to connect to 'template1' and
# copy the file to the table 'users' through command pipeline.
echo "\c template1;\COPY users FROM '/home/project/transformed-data.csv' DELIMITERS ',' CSV;" | psql --username=postgres --host=localhost

# Save the file and run the script
bash csv2db.sh

# Verify that the table users is populated with the data.
echo '\c template1; \\SELECT * FROM users;' | psql --username=postgres --host=localhost


