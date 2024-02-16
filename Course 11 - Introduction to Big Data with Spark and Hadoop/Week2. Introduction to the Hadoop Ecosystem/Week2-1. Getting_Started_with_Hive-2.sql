-- create a new table
create table Employee(emp_id string, emp_name string, salary int) row format delimited fields terminated by ',';

-- check if the table is created
show tables;

-- load the data into the table from the emp.csv
LOAD DATA INPATH '/hive_custom_data/emp.csv' INTO TABLE Employee;

-- check if the data has been loaded
SELECT * FROM Employee;

-- quit from the beehive prompt with ctrl+D
