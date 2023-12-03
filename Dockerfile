FROM php:8.3.0-fpm-alpine3.18 AS basic

COPY --from=composer:2.5 /usr/bin/composer /usr/bin/composer
COPY --from=mlocati/php-extension-installer:2.1.28 /usr/bin/install-php-extensions /usr/local/bin/
COPY --from=surnet/alpine-wkhtmltopdf:3.16.2-0.12.6-full /bin/wkhtmltopdf /bin/libwkhtmltox.so /bin/
COPY --chmod=777 ./bin/install_datadog_extension.sh /usr/local/bin/install_datadog_extension

RUN curl -o /usr/local/etc/AmazonRootCA1.pem https://www.amazontrust.com/repository/AmazonRootCA1.pem \
    && apk update \
    && apk add --no-cache libstdc++ libx11 libxrender libxext libssl1.1 ca-certificates fontconfig freetype ttf-droid ttf-freefont ttf-liberation \
    && /usr/local/bin/install-php-extensions pdo_pgsql zip gd intl amqp opcache \
    && /usr/local/bin/install_datadog_extension \
    && rm /usr/local/bin/install_datadog_extension

COPY ./php/config/php_prod.ini /usr/local/etc/php/php.ini
COPY ./php/config/opcache_prod.ini /usr/local/etc/php/conf.d/opcache.ini
COPY ./php/config/www.conf /usr/local/etc/php-fpm.d/www.conf

USER www-data