# Start the cassandra server on the terminal
start_cassandra

# Connect to the cassandra server
cqlsh --username cassandra --password yourpassword

# Create a keyspace
CREATE KEYSPACE training
WITH replication = {'class':'SimpleStrategy', 'replication_factor':3};

# List all keyspaces
describe keyspaces

# Describe a keyspace
describe training

# Alter a keyspace
ALTER KEYSPACE training
WITH replication = {'class': 'NetworkTopologyStrategy'};

# Verify the changes
describe training

# Use a keyspace
use training;

# List all tables in the keyspace - empty
describe tables

# Drop a keyspace
drop keyspace training;

# Verify the changes
use system;
describe keyspaces

# Practice excercieses
# 1. Create a keyspace named sales using SimpleStrategy and a replication factor of 1
CREATE KEYSPACE sales
WITH replication = {'class':'SimpleStrategy', 'replication_factor':1};

# 2. Chnage the replication factor to 3 for the sales keyspace
ALTER KEYSPACE sales 
WITH replication = {'class':'SimpleStrategy', 'replication_factor':3};
# Verify the changes
describe sales

# 3. Drop the sales keyspace
DROP KEYSPACE sales;

# 4. Verify that the sales keyspace is dropped
describe keyspaces

# 5. Disconnect from the cassandra server
exit
