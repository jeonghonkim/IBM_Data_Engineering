# start the mongodb server
start_mongo

# connect to the server
mongo -u root -p --authenticationDatabase admin local

# select training database
use training

# create a collection
db.createCollection("bigdata")

# insert documnets
use taining 
for (i=1; i<=200000;i++){print(i);db.bigdata.insert({"account_no":i,"balance":Math.round(Math.random()*1000000)})}

# verify 200000 documnts
db.bigdata.count()

# find the time taken to runt the query
db.bigdata.find({"account_no":58982}).explain("executionStats").executionStats.executionTimeMillis

# create an index on the field account_no
db.bigdata.createIndex({"account_no":1})

# get a list of indexes
db.bigdata.getIndexes()

# find the time taken to runt the query
db.bigdata.find({"account_no":69271}).explain("executionStats").executionStats.executionTimeMillis

# delete the index
db.bigdata.dropIndex({"account_no":1})

# pratice exercise
# create an index on the balance field
db.bigdata.createIndex({"balance":1})

# query for documents
db.bigdata.find({"balance":10000}).explain("executionStats").executionStats.executionTimeMillis

# drop the index you have created
db.bigdata.dropIndex({"balance":1})

# record the time taken
db.bigdata.find({"balance":10000}).explain("executionStats").executionStats.executionTimeMillis

# disconnect the server
exit