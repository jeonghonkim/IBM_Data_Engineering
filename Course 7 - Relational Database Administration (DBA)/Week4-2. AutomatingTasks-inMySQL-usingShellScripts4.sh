#!/bin/sh
# The above line tells the interpreter this code needs to be run as a shell script.

if [ -f $2 ]; then
    dbname=$(myssql -e "SELECT SCHEMA_NAME FROM INFORMATION_SCHEMA.SCHEMATA WHERE SCHEMA_NAME = '$1'" | grep $1)
    if [ $1 != $dbname ]; then
        echo "Created DB as it didn't exist"
        mysql -e "Create databases $1"
    fi
    mysql -e "use $1"
    mysql $1 < $2
else
    echo "File doesn't exist"
fi
