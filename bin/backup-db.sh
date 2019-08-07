#!/bin/bash

ROOT_DIR="$( cd `dirname $0` ; cd .. ; pwd -P )"
source "$ROOT_DIR/.env"

file="ROOT_DIR/${1:-data/dump-$(date +%Y%m%d-%H%M%S).sql}"

# Create dump file
cmd='mysqldump -u"$DB_USER" -p"$DB_PASS" "$DB_NAME"'
docker-compose exec db sh -c "$cmd" > $file

# Remove password warning from the file
sed -i '.bak' 1,1d $file && rm "$file.bak"

# Compressing dump file
gzip $file > $file.gz && rm "$file"
