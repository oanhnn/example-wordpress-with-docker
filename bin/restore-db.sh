#!/bin/bash

set -e

ROOT_DIR="$( cd `dirname $0` ; cd .. ; pwd -P )"

file=$ROOT_DIR/$1

# Check file existed
if [[ -z "$file" ]]; then
    echo "USAGE: restore-db <filename>"
    exit 1;
fi

# Uncompressing if need
if [[ $file == *.gz ]]; then
    file=${file::-3}
    gunzip -c $file.gz > $file
fi

# Restore database to db container
docker compose exec -T mysql sh -c "MYSQL_PWD=\$MYSQL_PASSWORD mysql -u \$MYSQL_USER \$MYSQL_DATABASE" < $file
