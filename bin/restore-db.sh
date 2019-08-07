#!/bin/bash

ROOT_DIR="$( cd `dirname $0` ; cd .. ; pwd -P )"
source "$ROOT_DIR/.env"

file=$ROOT_DIR/$1
if [ -z "$file" ]; then
    echo "USAGE: restore-db <filename>"
    exit 1;
fi

# Uncompressing file


# Restore database to db container
cmd='mysql -u"$DB_USER" -p"$DB_PASS" "$DB_NAME"'
docker exec -i $(docker-compose ps -q db) sh -c "$cmd" < $file
