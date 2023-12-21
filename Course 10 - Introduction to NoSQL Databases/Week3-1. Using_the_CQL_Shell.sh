# Start the cassandra server
start_cassandra
cqlsh --username cassandra --password yourpassword

# show details and version of the server
show host
show version

# print a list of keyspaces
describe keyspaces

# clear cqlsh screen
cls

# disconnect server
exit