#!/bin/bash

if [ "$(uname)" == "Darwin" ]; then
    # macOS
    BASE_DIR="/Users/$USER/Documents/volume"
else
    # Linux
    BASE_DIR="/home/$USER/data"
fi

if [ "$1" == "--delete" ]; then
    sed -i.bak '/DATA_PATH=/d' srcs/.env && rm srcs/.env.bak
    rm -rf "$BASE_DIR"
    rm -rf "$BASE_DIR"
    exit 0
fi

if [ ! -d "/Users/seongwol/Documents/volume/wordpress/data" ]; then
	mkdir -p $BASE_DIR/wordpress/data
	mkdir -p $BASE_DIR/mariadb/data
fi

if ! grep -q "DATA_PATH=" srcs/.env; then
	if [ -s srcs/.env ] && [ "$(tail -c 1 srcs/.env | wc -l)" -eq 0 ]; then
    echo "" >> srcs/.env
	fi
    echo "DATA_PATH=$BASE_DIR" >> srcs/.env
fi

