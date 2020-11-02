#!/bin/bash

ROOT_DIR="$( cd `dirname $0` ; cd .. ; pwd -P )"
source "$ROOT_DIR/.env"

file=$ROOT_DIR/$1
if [ -z "$file" ]; then
    echo "USAGE: restore-db <filename>"
    exit 1;
fi

# Restore database to db container
cmd='MYSQL_PWD=\$MYSQL_PASSWORD mysql -u \$MYSQL_USER \$MYSQL_DATABASE'
docker-compose exec mysql sh -c "$cmd" < $file
