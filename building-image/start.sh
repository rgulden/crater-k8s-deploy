echo "Running entry script..."
whoami 
FILE=/var/www/.env 
if [ ! -f "$FILE" ]; then
    echo "We need to copy over files.. first time.."
    cp -r /tmp/crater/. /var/www/
    ls -al
fi

composer install --no-interaction --prefer-dist --optimize-autoloader
php artisan storage:link || true 
php artisan key:generate 

php-fpm
