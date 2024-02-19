ARG WORDPRESS_VERSION=6
ARG PHP_VERSION=8.2

FROM wordpress:${WORDPRESS_VERSION}-php${PHP_VERSION}-fpm-alpine

WORKDIR /var/www/html

RUN set -eux; \
    \
    apk add --update --no-cache --virtual .build-deps \
        linux-headers \
        $PHPIZE_DEPS \
    ; \
    \
    pecl update-channels; \
    pecl install \
        xdebug \
    ; \
    docker-php-ext-enable xdebug; \
    rm -rf /tmp/pear ~/.pearrc; \
    \
    runDeps="$( \
        scanelf --needed --nobanner --format '%n#p' --recursive /usr/local \
            | tr ',' '\n' \
            | sort -u \
            | awk 'system("[ -e /usr/local/lib/" $1 " ]") == 0 { next } { print "so:" $1 }' \
    )"; \
    apk add --update --no-cache --virtual .run-deps $runDeps; \
    apk del .build-deps; \
    \
    php --version

RUN apk add --update --no-cache \
        curl \
        less \
    ;

# Install WP-CLI
COPY --from=wordpress:cli-php${PHP_VERSION} /usr/local/bin/wp /usr/local/bin/wp
