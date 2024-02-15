# get the latest code
git clone https://github.com/big-data-europe/docker-spark.git

# change the directory
cd docker-spark

# start the cluster
docker-compose up

# create a Python script
touch submit.py

# copy the code to the file and save

# upgrade pip installer
rm -r ~/.cache/pip/selfcheck/
pip3 install --upgrade pip
pip install --upgrade distro-info

# download spark environment
wget https://archive.apache.org/dist/spark/spark-3.3.3/spark-3.3.3-bin-hadoop3.tgz && tar xf spark-3.3.3-bin-hadoop3.tgz && rm -rf spark-3.3.3-bin-hadoop3.tgz

# set up JAVA_HOME and SPARK_HOME
export JAVA_HOME=/usr/lib/jvm/java-1.11.0-openjdk-amd64
export SPARK_HOME=/home/project/spark-3.3.3-bin-hadoop3

# install packages
pip install pyspark
python3 -m pip install findspark

# execute python script
python3 submit.py

