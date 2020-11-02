#!/bin/bash

ROOT_DIR="$( cd `dirname $0` ; cd .. ; pwd -P )"
source "$ROOT_DIR/.env"

file="ROOT_DIR/${1:-data/dump-$(date +%Y%m%d-%H%M%S).sql}"

# Create dump file
cmd='MYSQL_PWD=\$MYSQL_PASSWORD mysqldump -u \$MYSQL_USER \$MYSQL_DATABASE'
docker-compose exec mysql sh -c "$cmd" > $file

# Remove password warning from the file
# sed -i '.bak' 1,1d $file && rm "$file.bak"

# Compressing dump file
gzip $file > $file.gz && rm "$file"
