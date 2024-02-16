# Task 1 - Replicate a local database into your
# Cloudant instance

# Task 2 - Create an index for the 'Director' key, 
# on the 'movies' database using the HTTP API
curl -X POST $CLOUDANTURL/movies/_index \
-H"Content-Type: application/json" \
-d'{
    "index":{
        "fields":["Director"]
    }
}'

# Task 3 - Write a query to find all movies directed by
# 'Richard Gage' using the HTTP API
curl -X POST $CLOUDANTURL/movies/_find \
-H"Content-Type: application/json" \
-d'{
    "selector":{
        "Director":"Richard Gage"
    }
}'

# Task 4 - Create an index for the 'title' key on the
# 'movies' database using the HTTP API
curl -X POST $CLOUDANTURL/movies/_index \
-H"Content-Type: application/json" \
-d'{
    "index":{
        "fields":["title"]
    }
}'

# Task 5 - Write a query to list only the 'year' and
# 'Director' keys for the 'Top Dog' movies using the 
# HTTP API
curl -X POST $CLOUDANTURL/movies/_find \
-H"Content-Type: application/json" \
-d'{
    "selector":{
        "title":"Top Dog"
    },
    "fields":[
        "year", "Director"
    ]
}'

# Task 6 - Export the data from the 'movies' database
# into a file named 'movies.json'
couchexport --url $CLOUDANTURL --db movies --type jsonl > movies.json

# Task 7 - Import 'movies.json' into mongodb server
# into a database named 'entertainment' and a collection named 'movies'
mongoimport -u root -p NDU0OC1qZW9uZ2tp --authenticationDatabase admin --db entertainment --collection movies --file movies.json

# Task 10 - Write a query to find out the average
# votes for movies released in 2007
db.movies.aggregate([
    {
        "$match":{
            "year":2007
            }
            },
    {
        "$group":{
            "_id":"$year",
            "average":{
                "$avg":"$Votes"}
    }
    }
])

# Task 11 - Export the fields '_id', 'title', 'year',
# 'rating', and 'director' from the 'movies' collection
# into a file named 'partial_data.csv'
mongoexport -u root -p NDU0OC1qZW9uZ2tp --authenticationDatabase admin --db entertainment --collection movies --out partial_data.csv --type=csv --fields id,title,year,rating,director

# Task 12 - Import 'partial_data.csv' into cassandra server
# into a keyspace named 'entertainment' and a table named 'movies'
CREATE KEYSPACE entertainment  
WITH replication = {'class':'SimpleStrategy', 'replication_factor' : 3};
use entertainment;
CREATE TABLE movies(
id text PRIMARY KEY,
title text,
year text,
rating text,
director text
);
COPY entertainment.movies(id,title,year,rating,director) FROM 'partial_data.csv' WITH DELIMITER=',' AND HEADER=TRUE;

# Task 13 - Write a cql query to count the number of rows
# in the 'movies' table
SELECT count(*) FROM movies;

# Task 14 - Create an index for the 'rating' column
# in the 'movies' table using cql
CREATE index rating_index ON movies(rating);

# Task 15 - Write a cql query to count the number of
# movies that are rated 'G'
SELECT count(*) FROM movies WHERE rating='G';
