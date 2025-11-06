#!/bin/sh

set -euo pipefail

binary="docker"
container_id_file="/tmp/valkey_container_id"

if [ -f "$container_id_file" ]; then
    CONTAINER_NAME=$(cat "$container_id_file")
    echo "Stopping and removing the container $CONTAINER_NAME ..."
    $binary rm -f "$CONTAINER_NAME"
    rm "$container_id_file"
else
    echo "Container ID file not found, skipping cleanup."
fi

exit 0
