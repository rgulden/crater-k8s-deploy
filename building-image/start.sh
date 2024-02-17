#!/usr/bin/env bash

echo "Running entry script..."
whoami 
FILE=/var/www/.env 
if [ ! -f "$FILE" ]; then
    echo "We need to copy over files.. first time.."
    cp -r /crater/. /var/www/
    cp /env-files/.env /var/www/.env
    ls -al
fi

composer install --no-interaction --prefer-dist --optimize-autoloader --ignore-platform-reqs
php artisan storage:link || true 
php artisan key:generate 

php-fpm
