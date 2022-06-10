FROM wordpress:php8.1-fpm-alpine

# Install xdebug and Less
RUN set -eux; \
    apk add --update --no-cache curl less; \
    apk add --update --no-cache --virtual .build-deps $PHPIZE_DEPS ; \
    pecl update-channels; \
    pecl install xdebug; \
    docker-php-ext-enable xdebug; \
    rm -rf /tmp/pear ~/.pearrc; \
    runDeps="$( \
        scanelf --needed --nobanner --format '%n#p' --recursive /usr/local \
            | tr ',' '\n' \
            | sort -u \
            | awk 'system("[ -e /usr/local/lib/" $1 " ]") == 0 { next } { print "so:" $1 }' \
    )"; \
    apk add --update --no-cache --virtual .run-deps $runDeps; \
    apk del .build-deps; \
    php --version

# Install WP-CLI
COPY --from=wordpress:cli-php8.1 /usr/local/bin/wp /usr/local/bin/wp
