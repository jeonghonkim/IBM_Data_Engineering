# Test if you can reach your Cloudant server
curl $CLOUDANTURL

# Get a list of your database
curl $CLOUDANTURL/_all_dbs

# Create a database named animals
curl -X PUT $CLOUDANTURL/animals

# Delete the database named animals
curl -X DELETE $CLOUDANTURL/animals

# Create a database named planets
curl -X PUT $CLOUDANTURL/planets

# Insert a document in the planets database with _id of "1"
curl -X PUT $CLOUDANTURL/planets/"1" -d '{
    "name": "Mercury",
    "position_from_sum": 1
}'

# Verify by listing the document with the _id "1"
curl -X GET $CLOUDANTURL/planets/1

# Update a document
curl -X PUT $CLOUDANTURL/planets/1 -d'{
    "name": "Mercury",
    "position_from_sum": 1,
    "revolution_time": "88 days",
    "_rev": "1-473b9806b957558dd32d93615e94ec31"
}'

# Update a document
curl -X PUT $CLOUDANTURL/planets/1 -d '{
    "name": "Mercury",
    "position_from_sum": 1,
    "revolution_time": "88 days",
    "rotation_time": "59 days",
    "_rev": "2-c82d0b7f587b2a90f7cb6f6d963b5486"
}'

# Delete a document
curl -X DELETE $CLOUDANTURL/planets/1?rev=3-a6f41a3d464275e74cc75295c85b1162

# Delete an existing database and create a new one
curl -X DELETE $CLOUDANTURL/diamonds
curl -X PUT $CLOUDANTURL/diamonds

# Insert documents
curl -X PUT $CLOUDANTURL/diamonds/1 -d'{
    "carat": 0.31,
    "cut": "Ideal",
    "color": "J",
    "clarity": "SI2",
    "depth": 62.2,
    "table": 54,
    "price": 339
}'

curl -X PUT $CLOUDANTURL/diamonds/2 -d '{
    "carat": 0.2,
    "cut": "Premium",
    "color": "E",
    "clarity": "SI2",
    "depth": 60.2,
    "table": 62,
    "price": 351
}'

curl -X PUT $CLOUDANTURL/diamonds/3 -d '{
    "carat": 0.32,
    "cut": "Premium",
    "color": "E",
    "clarity": "I1",
    "depth": 60.9,
    "table": 58,
    "price": 342
}'

curl -X PUT $CLOUDANTURL/diamonds/4 -d '{
    "carat": 0.3,
    "cut": "Good",
    "color": "J",
    "clarity": "SI1",
    "depth": 63.4,
    "table": 54,
    "price": 349
}'

curl -X PUT $CLOUDANTURL/diamonds/5 -d '{
    "carat": 0.3,
    "cut": "Good",
    "color": "J",
    "clarity": "SI1",
    "depth": 63.8,
    "table": 56,
    "price": 347
}'

curl -X PUT $CLOUDANTURL/diamonds/6 -d '{
    "carat": 0.3,
    "cut": "Very Good",
    "color": "J",
    "clarity": "SI1",
    "depth": 62.7,
    "table": 59,
    "price": 349
}'

curl -X PUT $CLOUDANTURL/diamonds/7 -d '{
    "carat": 0.3,
    "cut": "Good",
    "color": "I",
    "clarity": "SI2",
    "depth": 63.3,
    "table": 56,
    "price": 343
}'

curl -X PUT $CLOUDANTURL/diamonds/8 -d '{
    "carat": 0.23,
    "cut": "Very Good",
    "color": "E",
    "clarity": "VS2",
    "depth": 63.8,
    "table": 55,
    "price": 339
}'
  
curl -X PUT $CLOUDANTURL/diamonds/9 -d '{
    "carat": 0.23,
    "cut": "Very Good",
    "color": "H",
    "clarity": "VS1",
    "depth": 61,
    "table": 57,
    "price": 323
}'
  
curl -X PUT $CLOUDANTURL/diamonds/10 -d '{
    "carat": 0.31,
    "cut": "Very Good",
    "color": "J",
    "clarity": "SI1",
    "depth": 59.4,
    "table": 62,
    "price": 346
}'

# Query for diamond with _id 1
curl -X POST $CLOUDANTURL/diamonds/_find \
-H "Content-Type: application/json" \
-d '{
    "selector": {
        "_id": "1"
    }
}'

# Query for diamonds with carat size of 0.3
curl -X POST $CLOUDANTURL/diamonds/_find \
-H "Content-Type: application/json" \
-d '{
    "selector": {
        "carat": 0.3
    }
}'

# Query for diamonds with price more than 345
curl -X POST $CLOUDANTURL/diamonds/_find \
-H "Content-Type: application/json" \
-d '{
    "selector": {
        "price": {
            "$gt": 345
        }
    }
}'

# Create an index on the key "price"
curl -X POST $CLOUDANTURL/diamonds/_index \
-H"Content-Type: application/json" \
-d'{
    "index": {
        "fields": ["price"]
    }
}'