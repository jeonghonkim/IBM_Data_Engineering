# Download the smaple data set
wget https://cf-courses-data.s3.us.cloud-object-storage.appdomain.cloud/IBM-BD0225EN-SkillsNetwork/labs/data/cars.csv

# Stop any previously running containers
for i in `docker ps | awk '{print $1}' | grep -v CONTAINER`; do docker kill $i; done

# Ignore any errors that say "No such container"
docker rm spark-master spark-worker-1 spark-worker-2

# Start the Spark Master server
docker run \
    --name spark-master \
    -h spark-master \
    -e ENABLE_INIT_DAEMON=false \
    -p 4040:4040 \
    -p 8080:8080 \
    -v 'pwd':/home/root \
    -d bde2020/spark-master:3.1.1-hadoop3.2

# Start a Spark Worker that will connect to the Master
docker run \
    --name spark-worker-1 \
    --link spark-master:spark-master \
    -e ENABLE_INIT_DAEMON=false \
    -p 8081:8081 \
    -v 'pwd':/home/root \
    -d bde2020/spark-worker:3.1.1-hadoop3.2

# Launch a PySpark
docker exec \
    -it `docker ps | grep spark-master | awk '{print $1}'` \
    /spark/bin/pyspark \
    --master spark://spark-master:7077

# Create a DataFrame
df = spark.read.csv("/home/root/cars.csv", header=True, inferSchema=True) \
    .repartition(32) \
    .cache()

# Add a second worker
docker run \
    --name spark-worker-2 \
    --link spark-master:spark-master \
    -e ENABLE_INIT_DAEMON=false \
    -p 8082:8082 \
    -d bde2020/spark-worker:3.1.1-hadoop3.2