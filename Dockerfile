FROM php:8.4-fpm


ARG user=demo
ARG work_dir=/var/www


WORKDIR ${work_dir}


COPY . ${work_dir}
COPY --from=composer:latest /usr/bin/composer /usr/local/bin/composer


ENV PATH="$PATH:/home/${user}/.composer/vendor/bin"


RUN apt-get update && apt-get upgrade -y && apt-get install -y \
    git \
    zlib1g-dev \
    libzip-dev \
    unzip \
    vim

RUN curl -sL https://deb.nodesource.com/setup_23.x -o /tmp/nodesource_setup.sh
RUN bash /tmp/nodesource_setup.sh
RUN apt-get install -y nodejs

RUN docker-php-ext-install zip
RUN docker-php-ext-install pdo
RUN docker-php-ext-install pdo_mysql


COPY ./docker-configs/php/custom-php.ini /usr/local/etc/php/php.ini-production


RUN useradd -ms /bin/bash ${user}


USER ${user}


RUN composer global require laravel/installer


#docker compose exec app bash
#laravel new example-app