-- 1. Perform a Logical Backup and Restore

-- Cloud IDE Terminal
wget https://cf-courses-data.s3.us.cloud-object-storage.appdomain.cloud/IBM-DB0231EN-SkillsNetwork/datasets/World/world_mysql_script.sql
wget https://cf-courses-data.s3.us.cloud-object-storage.appdomain.cloud/IBM-DB0231EN-SkillsNetwork/datasets/World/world_mysql_update_A.sql

-- MySQL CLI
CREATE DATABASE world;
USE world;
SOURCE world_mysql_script.sql;
SHOW TABLES;
SELECT * FROM countrylanguage WHERE countrycode='CAN';
SOURCE world_mysql_update_A.sql;

-- Cloud IDE Terminal
mysqldump --host=127.0.0.1 --port=3306 --user=root --password world countrylanguage > world_countrylanguage_mysql_backup.sql
cat world_countrylanguage_mysql_backup.sql
mysql --host=127.0.0.1 --port=3306 --user=root --password --execute="DROP TABLE world.countrylanguage;"
mysql --host=127.0.0.1 --port=3306 --user=root --password --execute="SHOW TABLES FROM world;"
mysql --host=127.0.0.1 --port=3306 --user=root --password world < world_countrylanguage_mysql_backup.sql
mysql --host=127.0.0.1 --port=3306 --user=root --password --execute="SELECT * FROM world.countrylanguage WHERE countrycode='CAN';"



-- 2. Perform Point-in-Time Backup and Restore

-- Cloud IDE Terminal 
wget https://cf-courses-data.s3.us.cloud-object-storage.appdomain.cloud/IBM-DB0231EN-SkillsNetwork/datasets/World/world_mysql_update_B.sql
mysqldump --host=127.0.0.1 --port=3306 --user=root --password --flush-logs --delete-master-logs  --databases world > world_mysql_full_backup.sql

-- MySQL CLI
USE world;
SHOW TABLES;
SELECT * FROM city WHERE countrycode='CAN';
source world_mysql_update_B.sql;

-- Cloud IDE Terminal 
docker exec mysql_mysql_1 rm -rf /var/lib/mysql/world
docker exec -it mysql_mysql_1 mysqladmin -p shutdown
mysql --host=127.0.0.1 --port=3306 --user=root --password --execute="SELECT * FROM world.city;"
mysql --host=127.0.0.1 --port=3306 --user=root --password --execute="SHOW BINARY LOGS;"
docker exec mysql_mysql_1 mysqlbinlog /var/lib/mysql/binlog.000003 /var/lib/mysql/binlog.000004 > logfile.sql
mysql --host=127.0.0.1 --port=3306 --user=root --password < world_mysql_full_backup.sql
mysql --host=127.0.0.1 --port=3306 --user=root --password --execute="SELECT * FROM world.city WHERE countrycode='CAN';"
mysql --host=127.0.0.1 --port=3306 --user=root --password < logfile.sql



-- 3. Perform Physical Backup and Restore

-- Cloud IDE Terminal 
docker cp mysql_mysql_1:/var/lib/mysql /home/project/mysql_backup
docker cp /home/project/mysql_backup/. mysql_mysql_1:/var/lib/mysql



- 4-1. Excercise - Perform Logical Backup and Restore

-- Cloud IDE Terminal 
wget https://cf-courses-data.s3.us.cloud-object-storage.appdomain.cloud/IBM-DB0231EN-SkillsNetwork/datasets/World/world_mysql_script.sql
wget https://cf-courses-data.s3.us.cloud-object-storage.appdomain.cloud/IBM-DB0231EN-SkillsNetwork/datasets/World/world_mysql_update_1.sql

-- MySQL CLI
CREATE DATABASE world_P1;
USE world_P1;
source world_mysql_script.sql;
SELECT * FROM city WHERE countrycode='BGD';
source world_mysql_update_1.sql;
SELECT * FROM city WHERE countrycode='BGD';

-- Cloud IDE Terminal 
mysqldump --host=127.0.0.1 --port=3306 --user=root --password world_P1 city > world_P1_city_mysql_backup.sql
mysql --host=127.0.0.1 --port=3306 --user=root --password --execute="DROP TABLE world_P1.city;"
mysql --host=127.0.0.1 --port=3306 --user=root --password --execute="SELECT * FROM world_P1.city;"
mysql --host=127.0.0.1 --port=3306 --user=root --password world_P1 < world_P1_city_mysql_backup.sql
mysql --host=127.0.0.1 --port=3306 --user=root --password --execute="SELECT * FROM world_P1.city;"



- 4-2. Excercise - Perform Physical Backup and Restore

-- Cloud IDE Terminal 
wget https://cf-courses-data.s3.us.cloud-object-storage.appdomain.cloud/IBM-DB0231EN-SkillsNetwork/datasets/World/world_mysql_script.sql
wget https://cf-courses-data.s3.us.cloud-object-storage.appdomain.cloud/IBM-DB0231EN-SkillsNetwork/datasets/World/world_mysql_update_2.sql

-- MySQL CLI
CREATE DATABASE world_P2;
USE world_P2;
source world_mysql_script.sql;
SELECT * FROM country WHERE code in ('BGD', 'CAN');
SELECT * FROM countrylanguage WHERE countrycode in ('BGD', 'CAN');
SELECT * FROM city WHERE countrycode in ('BGD', 'CAN');
source world_mysql_update_2.sql;

-- Cloud IDE Terminal
docker cp mysql_mysql_1:/var/lib/mysql/world_P2 /home/project/mysql_world_P2_backup
docker exec mysql_mysql_1 rm -rf /var/lib/mysql/world_P2
docker exec -it mysql_mysql_1 mysqladmin -p shutdown
mysql --host=127.0.0.1 --port=3306 --user=root --password --execute="SELECT * FROM world_P2.city;"
docker cp /home/project/mysql_world_P2_backup/. mysql_mysql_1:/var/lib/mysql/world_P2
docker exec -it mysql_mysql_1 mysqladmin -p shutdown
mysql --host=127.0.0.1 --port=3306 --user=root --password --execute="SELECT * FROM world_P2.city;"
