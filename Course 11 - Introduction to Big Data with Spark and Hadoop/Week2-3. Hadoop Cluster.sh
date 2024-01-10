# Clone the repository to your theia env
git clone https://github.com/ibm-developer-skills-network/ooxwv-docker_hadoop.git

# Navigate to the directory
cd ooxwv-docker_hadoop

# Compose the docker application
docker-compose up -d

# Run the namenode 
docker exec -it namenode /bin/bash

# See the xml files
ls /opt/hadoop-3.2.1/etc/hadoop/*.xml

# Create a directory structure in the HDFS
hdfs dfs -mkdir -p /user/root/input

# Copy all the hadoop configuration xml files 
hdfs dfs -put $HADOOP_HOME/etc/hadoop/*.xml /user/root/input

# Create a data.txt
curl https://raw.githubusercontent.com/ibm-developer-skills-network/ooxwv-docker_hadoop/master/SampleMapReduce.txt --output data.txt

# Copy the data.txt 
hdfs dfs -put data.txt /user/root/

# Check the file
hdfs dfs -cat /user/root/data.txt