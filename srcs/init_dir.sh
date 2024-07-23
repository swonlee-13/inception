#!/bin/bash

MYUSER=$USER

if [ "$(uname)" == "Darwin" ]; then
    # macOS
    BASE_DIR="/Users/$MYUSER/Documents/inception_volume"
else
    # Linux
    BASE_DIR="/home/$MYUSER/data"
fi

if [ "$1" == "--delete" ]; then
    rm -rf "$BASE_DIR"
    rm -rf "$BASE_DIR"
    exit 0
fi

if [ ! -d "$BASE_DIR ]; then
	mkdir -p $BASE_DIR/wordpress/
	mkdir -p $BASE_DIR/mariadb/
fi

if ! grep -q "DATA_PATH=" srcs/.env; then
	if [ -s srcs/.env ] && [ "$(tail -c 1 srcs/.env | wc -l)" -eq 0 ]; then
    echo "" >> srcs/.env
	fi
    echo "DATA_PATH=$BASE_DIR" >> srcs/.env
fi

