FROM php:8.0-fpm

# Set the default directory inside the container
WORKDIR /var/www/symfony

RUN apt-get update && apt-get install -y
# You can check all possible installation here : https://gist.github.com/chronon/95911d21928cff786e306c23e7d1d3f3
RUN apt-get install -y --no-install-recommends \
    git \
    zlib1g-dev \
    libxml2-dev \
    libzip-dev \
    libpq-dev \
    nano \
    && docker-php-ext-install \
    zip \
    intl \
    pdo \
    mysqli \
    pdo_mysql \
    pgsql \
    pdo_pgsql \
    opcache
# Install Composer !
RUN curl -sS https://getcomposer.org/installer | php && mv composer.phar /usr/local/bin/composer
RUN curl -sS https://get.symfony.com/cli/installer | bash
RUN mv /root/.symfony5/bin/symfony /usr/local/bin/symfony


