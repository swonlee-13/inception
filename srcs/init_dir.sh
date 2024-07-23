#!/bin/bash

if [ "$(uname)" == "Darwin" ]; then
    # macOS
    BASE_DIR="/Users/$USER/Documents/"$1""
else
    # Linux
    BASE_DIR="/home/$USER/data"
fi

if [ "$2" == "--delete" ]; then
    echo "Deleting volume..."
    rm -rf "$BASE_DIR"
    rm -rf "$BASE_DIR"
    echo "Delete COMPLETE!!!"
    exit 0
fi

if [ ! -d "$BASE_DIR" ]; then
	mkdir -p $BASE_DIR/wordpress/
	mkdir -p $BASE_DIR/mariadb/
fi

if ! grep -q "DATA_PATH=" srcs/.env; then
	if [ -s srcs/.env ] && [ "$(tail -c 1 srcs/.env | wc -l)" -eq 0 ]; then
    echo "" >> srcs/.env
	fi
    echo "DATA_PATH=$BASE_DIR" >> srcs/.env
fi
