# import modules
from pymongo import MongoClient

# set user
user = 'root'
password = 'YOUR_PASSWORD'
host = 'localhost'

# create the connection url
connecturl = "mongodb://{}:{}@{}:27017/?authSource=admin".format(user,password,host)

# connect to mongodb server
print("Connecting to mongodb server")
connection = MongoClient(connecturl)

# select 'training' database
db = connection.training

# select 'python' collection
collection = db.python

# create a sample document
doc = {"lab":"Accessing mongodb using python", "Subject":"No SQL Databases"}

# insert a sample documnet
print("Inserting a document into collection.")
db.collection.insert_on(doc)

# query for all documents
docs = db.collection.find()
print("Printing the documents in the collection.")
for document in docs:
    print(document)

# disconnect the server connection
print("Closing the connection.")
connection.close()
