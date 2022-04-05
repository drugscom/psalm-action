FROM alpine:3.15.4

LABEL 'com.github.actions.name'='Psalm static code analysis'
LABEL 'com.github.actions.description'='PHP static code analysis using Psalm'

RUN apk --no-cache add \
    php8=~8.0 \
    php8-ctype=~8.0 \
    php8-curl=~8.0 \
    php8-dom=~8.0 \
    php8-fileinfo=~8.0 \
    php8-intl=~8.0 \
    php8-mbstring=~8.0 \
    php8-mysqli=~8.0 \
    php8-pcntl=~8.0 \
    php8-pdo=~8.0 \
    php8-pecl-memcached=~3 \
    php8-phar=~8.0 \
    php8-posix=~8.0 \
    php8-soap=~8.0 \
    php8-session=~8.0 \
    php8-simplexml=~8.0 \
    php8-sockets=~8.0 \
    php8-tokenizer=~8.0 \
    php8-xml=~8.0 \
    php8-xmlwriter=~8.0 \
    php8-zip=~8.0 \
    && ln -s /usr/bin/php8 /usr/local/bin/php

RUN wget -q -O /usr/local/bin/psalm 'https://github.com/vimeo/psalm/releases/download/v4.14.0/psalm.phar' \
    && chmod +x /usr/local/bin/psalm

COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT [ "/entrypoint.sh" ]

WORKDIR /app
