#!/bin/bash

VOLUME_NAME=$1
ENV_FILE="srcs/.env"


if [ "$(uname)" == "Darwin" ]; then
    # macOS
    BASE_DIR="/Users/$USER/Documents/$VOLUME_NAME"
else
    # Linux
    BASE_DIR="/home/$USER/data"
fi

if [ "$2" == "--delete" ]; then
    echo "Deleting volume..."
    rm -rf "$BASE_DIR"
    rm -rf "$BASE_DIR"
    echo "Delete COMPLETE!!!"

    if [ -f "$ENV_FILE" ]; then
        sed -i '' '/^DATA_PATH=/d' "$ENV_FILE"
    else
        echo ".env file not found. Skipping DATA_PATH removal."
    fi
    exit 0
fi

if [ ! -d "$BASE_DIR" ]; then
    echo "Add volumes..."
	mkdir -p $BASE_DIR/wordpress/
	mkdir -p $BASE_DIR/mariadb/
    echo "Add COMPLETE!!!"
fi

if ! grep -q "DATA_PATH=" srcs/.env; then
	if [ -s srcs/.env ] && [ "$(tail -c 1 srcs/.env | wc -l)" -eq 0 ]; then
    echo "" >> srcs/.env
	fi
    echo "DATA_PATH=$BASE_DIR" >> srcs/.env
fi
