#!/usr/bin/env bash

set -e

backup_sql_file=BronzeSword_$(date +%Y-%m-%d:%H:%M:%S).sql
docker exec -it assembly_mysql_1 mysqldump -u$user -p$password BronzeSword > $backup_sql_file
tail -n +2 $backup_sql_file > $backup_sql_file.tmp && mv $backup_sql_file.tmp $backup_sql_file
