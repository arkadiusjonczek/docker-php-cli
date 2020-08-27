FROM php:7.4-cli
 
RUN apt-get update \
    && apt-get install libldap2-dev -y \
    && rm -rf /var/lib/apt/lists/* \
    && apt-get clean \
    && docker-php-source extract \
    && docker-php-ext-install pdo_mysql \
    && docker-php-ext-configure ldap --with-libdir=lib/x86_64-linux-gnu/ \
    && docker-php-ext-install ldap \
    && docker-php-source delete
