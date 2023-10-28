#!/bin/bash

set -e

FROM_URL=$1
TO_URL=$2

# Replace LIVE_URL using WP-CLI in wp container
docker compose exec wp sh -c "wp --allow-root search-replace "$FROM_URL" "$TO_URL" --skip-columns=guid"
