#!/bin/bash
if [ -f /.mysql_db_created ]; 
then
        exec supervisord -n
        exit 1
fi

sleep 5
DB_EXISTS=$(mysql -u$DB_USER -p$DB_PASS -h$DB_HOST -e "SHOW DATABASES LIKE '$DB_NAME';" | grep "$DB_NAME" > /dev/null; echo "$?")

if [[ DB_EXISTS -eq 1 ]]; 
then
        echo "=> Creating db $DB_NAME"
        RET=1
        while [[ RET -ne 0 ]]; do
                sleep 5
                mysql -u$DB_USER -p$DB_PASS -h$DB_HOST -e "CREATE DATABASE $DB_NAME"
                RET=$?
        done
        echo "=> Done!"
else
        echo "=> Skipped creation of database $DB_NAME - it already exists."
fi

touch /.mysql_db_created
exec supervisord -n
