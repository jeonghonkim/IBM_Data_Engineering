# Download Hadoop
curl https://dlcdn.apache.org/hadoop/common/hadoop-3.3.6/hadoop-3.3.6.tar.gz --output hadoop-3.3.6.tar.gz

# Extract the tar file
tar -xvf hadoop-3.3.6.tar.gz

# Navigate to the hadoop directory
cd hadoop-3.3.6

# Check the hadoop command
bin/hadoop

# Download data.txt
curl https://cf-courses-data.s3.us.cloud-object-storage.appdomain.cloud/IBM-BD0225EN-SkillsNetwork/labs/data/data.txt --output data.txt

# Run the Map reduce and store the output in /user/root/output
bin/hadoop jar share/hadoop/mapreduce/hadoop-mapreduce-examples-3.3.6.jar wordcount data.txt output

# See the output
ls output

# See the word count output
cat output/part-r-00000

# Delete the data.txt and output folder
rm data.txt
rm -rf output

# Run the Map reduce with the new data.txt and store the output in the same location
bin/hadoop jar share/hadoop/mapreduce/hadoop-mapreduce-examples-3.3.6.jar wordcount data.txt output

# See the output
ls output

# See the word count output
cat output/part-r-00000
