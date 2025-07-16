#!/bin/bash

ENV_FILE="/challenge/challenge.env"
if [[ -f "$ENV_FILE" ]]; then
    source "$ENV_FILE"
fi

SO_FILE="/challenge/.challenge.so"
COMMAND_NAME="challenge"
TIMEOUT_SECONDS=5

counter_limit=$(echo "$TIMEOUT_SECONDS / 0.1" | bc)
counter=0

while [[ ! -f "$SO_FILE" ]]; do
    if (( counter >= counter_limit )); then
        echo "Error: Timed out after $TIMEOUT_SECONDS seconds waiting for $SO_FILE." >&2
        echo "The .init script may have failed to compile the challenge." >&2
        break
    fi
    sleep 0.1
    ((counter++))
done

if [[ -f "$SO_FILE" ]]; then
    enable -f "$SO_FILE" "$COMMAND_NAME"
fi
