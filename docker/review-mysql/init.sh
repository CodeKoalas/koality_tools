#! /bin/bash

# check to see if the database exists
table=`mysql -B --disable-column-names --host $DB_HOST --user $MYSQL_ROOT_USER -p$MYSQL_MASTER_PASSWORD --execute="select count(*) from information_schema.tables where table_type = 'BASE TABLE' and table_schema = '$DB_DATABASE'"`

# get database dump and import
if [[ $table == 0 ]]; then
    # get dump from targeted DB 
    echo "Fetching database..."
    mysqldump -u $MYSQL_ROOT_USER -p"$MYSQL_MASTER_PASSWORD" -h $DB_HOST $DB_DATABASE > /tmp/database.sql
    # import into local DB using root superuser
    echo "Importing database..."
    mysql -u root -p"$MYSQL_ROOT_PASSWORD" $MYSQL_DATABASE < /tmp/database.sql
fi
