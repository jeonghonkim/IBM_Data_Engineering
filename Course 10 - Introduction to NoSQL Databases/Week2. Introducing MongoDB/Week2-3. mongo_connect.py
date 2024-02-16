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

# get database list
print("Getting list of databases")
dbs = connection.list_database_names()

# print the database names
for db in dbs:
    print(db)
print("Closing the connection to the mongodb server")

# clsoe the server connection
connection.close()