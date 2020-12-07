#!/bin/bash

set -e

ROOT_DIR="$( cd `dirname $0` ; cd .. ; pwd -P )"

file="$ROOT_DIR/${1:-data/dump-$(date +%Y%m%d-%H%M%S).sql}"

# Create dump file
docker-compose exec mysql sh -c "MYSQL_PWD=\$MYSQL_PASSWORD mysqldump -u \$MYSQL_USER \$MYSQL_DATABASE" > $file

# Remove password warning from the file
sed -i "/mysqldump: Error:/d" $file

# Compressing dump file
gzip $file
