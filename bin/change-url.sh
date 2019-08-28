#!/bin/bash

FROM_URL=$1
TO_URL=$2

# Replace LIVE_URL using WP-CLI in wp container
cmd='wp --allow-root search-replace "$FROM_URL" "$TO_URL" --skip-columns=guid'
docker-compose exec wp sh -c "$cmd"
