#!/usr/bin/env bash


#### TODO
# Since /var/www is persisted... when we upgrade the version
# we need to clean the directory, but make sure we keep the important locations.
# like the storage and boostrap folders... and of course .env.
# question is, how do we determine when a new is running?
# 
#

echo "Running entry script..."
whoami 
FILE=/var/www/.env 
if [ ! -f "$FILE" ]; then
    echo "We need to copy over files.. first time.."
    cp -r /crater/. /var/www/
    cp /env-files/.env /var/www/.env
    ls -al
fi

composer install --no-interaction --prefer-dist --optimize-autoloader
php artisan storage:link || true 
php artisan key:generate 

chmod -R 775 storage/framework/ storage/logs/ bootstrap/cache/

php-fpm
