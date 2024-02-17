FROM php:7.4-fpm

# Arguments defined in docker-compose.yml
ARG user=crater-user
ARG uid=1000
ARG APP_VERSION=4.2.0

# Install system dependencies
RUN apt-get update && apt-get install -y \
    git \
    curl \
    libpng-dev \
    libonig-dev \
    libxml2-dev \
    zip \
    unzip \ 
    libzip-dev \ 
    libmagickwand-dev

# Clear cache
RUN apt-get clean && rm -rf /var/lib/apt/lists/*

RUN pecl install imagick \ 
    && docker-php-ext-enable imagick

# Install PHP extensions
RUN docker-php-ext-install pdo_mysql mbstring zip exif pcntl bcmath gd 

# Get latest Composer
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

# Create system user to run Composer and Artisan Commands
RUN useradd -G www-data,root -u $uid -d /home/$user $user
RUN mkdir -p /home/$user/.composer && \
    chown -R $user:$user /home/$user


WORKDIR /crater
RUN mkdir -p /env-files

COPY start.sh /crater/

ADD https://github.com/crater-invoice/crater/archive/refs/tags/${APP_VERSION}.tar.gz /crater/

RUN tar -xzf ${APP_VERSION}.tar.gz --strip-components=1 \
    && rm ${APP_VERSION}.tar.gz \
    && ls -al

RUN chown -R $user /crater \
    && chown -R $user /env-files \
    && ls -al

WORKDIR /var/www
USER $user

ENTRYPOINT [ "/crater/start.sh" ]
