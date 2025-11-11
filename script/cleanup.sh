#!/bin/sh

set -euo pipefail

binary="docker"
CONTAINER_NAME=${STATE_container_id:-}

if [ -n "$CONTAINER_NAME" ]; then
    echo "Stopping and removing the container $CONTAINER_NAME ..."
    $binary rm -f "$CONTAINER_NAME"
else
    echo "Container state not found, skipping cleanup."
fi

exit 0
