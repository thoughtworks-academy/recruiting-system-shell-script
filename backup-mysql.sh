#!/usr/bin/env bash

set -e

backup_sql_file=$backup_path/mysql/BronzeSword_$(date +%Y-%m-%d:%H:%M:%S).sql
backup_mongo_file=$backup_path/mongodb/twars_$(date +%Y-%m-%d:%H:%M:%S).archive
ssh -T $REMOTE_SERVER_IP docker exec -i assembly_mysql_1 "mysqldump -u $user_for_dump -p$password BronzeSword" > $backup_sql_file
ssh -T $REMOTE_SERVER_IP docker exec -i assembly_mongo_1 "mongodump --archive --db twars" > $backup_mongo_file
