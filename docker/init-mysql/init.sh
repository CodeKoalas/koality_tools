#! /bin/bash
pass="$(openssl rand -base64 12)"

# check to see if the database exists
table=`mysql -B --disable-column-names --host ck-db-staging.ceyq1mgp86tm.us-west-2.rds.amazonaws.com --execute="select count(*) from information_schema.tables where table_type = 'BASE TABLE' and table_schema = '$site'"`

#create mysql database and user information
if [ $table == 0 ]; then
        mysql --host ck-db-staging.ceyq1mgp86tm.us-west-2.rds.amazonaws.com --execute="CREATE DATABASE $site;"
        mysql --host ck-db-staging.ceyq1mgp86tm.us-west-2.rds.amazonaws.com --execute="CREATE USER '$user'@'%' IDENTIFIED BY '$pass';"
        mysql --host ck-db-staging.ceyq1mgp86tm.us-west-2.rds.amazonaws.com --execute="GRANT ALL on $site.* TO '$user'@'%';"
fi