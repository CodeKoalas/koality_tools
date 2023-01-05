#! /bin/bash

# check to see if the database exists
table=`mysql -B --disable-column-names --host $DB_HOST --user $MYSQL_USER -p$MYSQL_MASTER_PASSWORD --execute="select count(*) from information_schema.tables where table_type = 'BASE TABLE' and table_schema = '$DB_DATABASE'"`

#create mysql database and user information
if [[ $table == 0 ]]; then
        mysql --host $DB_HOST --user $MYSQL_USER -p$MYSQL_MASTER_PASSWORD --execute="CREATE DATABASE $DB_DATABASE;"
        mysql --host $DB_HOST --user $MYSQL_USER -p$MYSQL_MASTER_PASSWORD --execute="CREATE USER '$DB_USERNAME'@'%' IDENTIFIED BY '$DB_PASSWORD';"
        mysql --host $DB_HOST --user $MYSQL_USER -p$MYSQL_MASTER_PASSWORD --execute="GRANT ALL on $DB_DATABASE.* TO '$DB_USERNAME'@'%';"
fi