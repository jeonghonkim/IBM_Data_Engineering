# Practice Exercises
# 1. Set the price of the diamond with id 2 to 352
curl -X GET $CLOUDANTURL/diamonds/2
curl -X PUT $CLOUDANTURL/diamonds/2 -d '{
    "_id": "2",
    "_rev": "1-bb99032cde872d889f41bb4069e23675",
    "carat": 0.2,
    "cut": "Premium",
    "color": "E",
    "clarity": "SI2",
    "depth": 60.2,
    "table": 62,
    "price": 352
}'

# 2. Crete an index on the key "carat"
curl -X POST $CLOUDANTURL/diamonds/_index \
-H"Content-Type: application/json" \
-d'{
    "index": {
        "fields": ["carat"]
    }
}'

# 3. Find all diamonds that are more than 0.3 carats
curl -X POST $CLOUDANTURL/diamonds/_find \
-H"Content-Type: application/json" \
-d'{
    "selector": {
        "carat": {
            "$gt": 0.3
        }
    }
}'

# 4. Find all diamonds that have a premium cut
curl -X POST $CLOUDANTURL/diamonds/_find \
-H"Content-Type: application/json" \
-d'{
    "selector": {
        "cut": "Premium"
    }
}'

# 5. Find all diamonds that are of color 'E'
curl -X POST $CLOUDANTURL/diamonds/_find \
-H"Content-Type: application/json" \
-d'{
    "selector": {
        "color": "E"
    }
}'