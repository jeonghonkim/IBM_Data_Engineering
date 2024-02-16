# Exercise 2 - Cloudant import/export data
# Set the environment variable
export CLOUDANTURL="YOUR_URL_HERE"
export CLOUDANTURL="https://apikey-v2-xjwqmwoorl0keah8pvpz904us3oyppz1v1bdvwjqfgq:3a8f589942c2b887073e1358de663961@ef6b3184-51f0-4eb1-8503-afd80e317f62-bluemix.cloudantnosqldb.appdomain.cloud"

# Export data from the 'diamonds' database into csv format
couchexport --url $CLOUDANTURL --db diamonds --delimiter ","

# Export data from the 'diamonds' database into csv format and save to a file named 'diamonds.csv'
couchexport --url $CLOUDANTURL --db diamonds --delimiter "," > diamonds.csv

# Export data from the 'diamonds' database into json format
couchexport --url $CLOUDANTURL --db diamonds --type jsonl

# Export data from the 'diamonds' database into json format and save to a file named 'diamonds.json'
couchexport --url $CLOUDANTURL --db diamonds --type jsonl > diamonds.json

# Exercise 3- MongoDB import/export data
# Start the MongoDB server
start_mongo

# import data in 'diamonds.json' into a collection
mongoimport -u root -p MzA2NDAtcnNhbm5h --authenticationDatabase admin --db training --collection diamonds --file diamonds.json

# export data from the 'training' database, 'diamonds' collection into a file
mongoexport -u root -p MzA2NDAtcnNhbm5h --authenticationDatabase admin --db training --collection diamonds --out mongodb_exported_data.json

# Export the fields '_id', 'clarity', 'cut', 'price' from the 'training' database, 'diamonds' collection in to a file
mongoexport -u root -p MzA2NDAtcnNhbm5h --authenticationDatabase admin --db training --collection diamonds --out mongodb_exported_data.csv --type=csv --fields _id,clarity,cut,price

# Exercise 4 - Cassandra import/export data
# Start the Cassandra server
start_cassandra

# Step 1. Login to cqlsh
cqlsh --username cassandra --password MTcxMzQtamVvbmdr

# Step 2. Create a keyspace named 'training'
CREATE KEYSPACE training
WITH replication = {'class':'SimpleStrategy', 'replication_factor':3};

# Step 3. Create a table named 'diamonds' with the schema
use training;
CREATE TABLE diamonds(
    id int PRIMARY KEY,
    clarity text,
    cut text,
    price int
);

# Step 4. Run the below commands
use training;
COPY training.diamonds(id,clarity,cut,price) FROM 'mongodb_exported_data.csv' WITH DELIMITER=',' AND HEADER=TRUE;
COPY diamonds TO 'cassandra-diamonds.csv';

# Exercise 5 - Creating an index on Cassandra
create index price_index on diamonds(price);

# Exercise 6 - Disonnect from the Cassandra server
exit