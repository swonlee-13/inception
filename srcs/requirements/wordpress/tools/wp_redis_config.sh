#!/bin/sh

CONFIG_FILE="/var/www/html/wp-config.php"

add_config() {
    if ! grep -q "$1" "$CONFIG_FILE"; then
        echo "$1" >> "$CONFIG_FILE"
    fi
}

add_config "define('WP_CACHE', true);"
add_config "define('WP_REDIS_HOST', 'redis');"
add_config "define('WP_REDIS_PORT', 6379);"
add_config "define('FS_METHOD', 'direct');"