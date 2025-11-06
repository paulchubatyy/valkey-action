#!/bin/sh

set -euo pipefail

binary="docker"

cmd_run="$binary run -d -p $INPUT_HOST_PORT:$INPUT_CONTAINER_PORT docker.io/valkey/valkey:$INPUT_VALKEY_VERSION"

CONTAINER_NAME=$(eval "$cmd_run")

echo "$CONTAINER_NAME" > /tmp/valkey_container_id

echo "Starting the container $CONTAINER_NAME ..."

while true; do
    STATUS=$($binary inspect --format='{{.State.Status}}' "$CONTAINER_NAME" 2>/dev/null)
    
    if [ "$STATUS" == "running" ]; then
        echo "The container $CONTAINER_NAME is up and running!"
        break
    elif [ "$STATUS" == "exited" || "$STATUS" == "dead" ]; then
        echo "Failed to start the container $CONTAINER_NAME"
        exit 1
    else
        echo "The container $CONTAINER_NAME is still starting"
        sleep 1
    fi 
done

exit 0
