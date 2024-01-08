# Create a directory named data
mkdir /home/project/data

# Change to the directory
cd /home/project/data

# Download emp.csv file
wget https://cf-courses-data.s3.us.cloud-object-storage.appdomain.cloud/IBM-BD0225EN-SkillsNetwork/data/emp.csv

# Use the hive from the docker hub
docker pull apache/hive:4.0.0-alpha-1

# Run the hive server
docker run -d -p 10000:10000 -p 10002:10002 --env SERVICE_NAME=hiveserver2 -v /home/project/data:/hive_custom_data --name myhiveserver apache/hive:4.0.0-alpha-1

# Open and take a look at the Hive server with the GUI

# Access beeline
docker exec -it myhiveserver beeline -u 'jdbc:hive2://localhost:10000/'