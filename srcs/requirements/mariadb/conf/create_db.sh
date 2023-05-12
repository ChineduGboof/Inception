#!/bin/sh

# Check if the /var/lib/mysql/mysql directory exists.
# If it doesn't exist, initialize the MySQL database.
if [ ! -d "/var/lib/mysql/mysql" ]; then

        # Change ownership of the /var/lib/mysql directory to mysql user and group.
        chown -R mysql:mysql /var/lib/mysql

        # Initialize the MySQL database.
        mysql_install_db --basedir=/usr --datadir=/var/lib/mysql --user=mysql --rpm

        # Create a temporary file.
        tfile=`mktemp`
        if [ ! -f "$tfile" ]; then
                return 1
        fi
fi

# Check if the /var/lib/mysql/wordpress directory exists.
# If it doesn't exist, create a MySQL database for Wordpress.
if [ ! -d "/var/lib/mysql/wordpress" ]; then

        # Create a SQL script to create the database and user.
        cat << EOF > /tmp/create_db.sql
USE mysql;
FLUSH PRIVILEGES;
DELETE FROM     mysql.user WHERE User='';
DROP DATABASE test;
DELETE FROM mysql.db WHERE Db='test';
DELETE FROM mysql.user WHERE User='root' AND Host NOT IN ('localhost', '127.0.0.1', '::1');
ALTER USER 'root'@'localhost' IDENTIFIED BY '${DB_ROOT}';
CREATE DATABASE ${DB_NAME} CHARACTER SET utf8 COLLATE utf8_general_ci;
CREATE USER '${DB_USER}'@'%' IDENTIFIED by '${DB_PASS}';
GRANT ALL PRIVILEGES ON wordpress.* TO '${DB_USER}'@'%';
FLUSH PRIVILEGES;
EOF

        # Run the SQL script to create the database and user.
        /usr/bin/mysqld --user=mysql --bootstrap < /tmp/create_db.sql

        # Remove the SQL script.
        rm -f /tmp/create_db.sql
fi
