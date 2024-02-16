# start mongodb server
start_mongo

# connect to the server
mongo -u root -p --authenticationDabase admin local

# check the version
db.version()

# print a lit of the database
show dbs

# create a new database
use training

# create a collection
db.createCollection("mycollection")

# print a list of collection
show collections

# insert json document
db.mycollection.insert({"color":"white","example":"milk"})
db.mycollection.insert({"color":"blue","example":"sky"})

# count the number of documnets in the collection
db.mycollection.count()

# list all the documents in the collection
db.mycollection.find()

# exit the server
exit