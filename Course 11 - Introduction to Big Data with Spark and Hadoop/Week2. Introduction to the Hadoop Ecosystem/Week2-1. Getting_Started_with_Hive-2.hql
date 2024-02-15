// Create a new table
create table Employee(emp_id string, emp_name string, salary int) row format delimited fields terminated by ',';

// Check if the table is created
show tables;

// Load the data into the table from the emp.csv
LOAD DATA INPATH '/hive_custom_data/emp.csv' INTO TABLE Employee;

// Check if the data has been loaded
SELECT * FROM Employee;

// Quit from the beehive prompt with ctrl+D
