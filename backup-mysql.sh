#!/usr/bin/env bash

set -e

backup_sql_file=BronzeSword_$(date +%Y-%m-%d:%H:%M:%S).sql
ssh -T $REMOTE_SERVER_IP docker exec -i assembly_mysql_1 "mysqldump -u $user_for_dump -p$password BronzeSword" > $backup_sql_file 
