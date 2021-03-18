FROM docker.io/library/alpine:3.13

LABEL 'com.github.actions.name'='Psalm static code analysis'
LABEL 'com.github.actions.description'='PHP static code analysis using Psalm'

RUN apk --no-cache add \
  php7=~7.4 \
  php7-ctype=~7.4 \
  php7-curl=~7.4 \
  php7-dom=~7.4 \
  php7-fileinfo=~7.4 \
  php7-intl=~7.4 \
  php7-json=~7.4 \
  php7-mbstring=~7.4 \
  php7-mysqli=~7.4 \
  php7-pcntl=~7.4 \
  php7-pdo=~7.4 \
  php7-phar=~7.4 \
  php7-posix=~7.4 \
  php7-session=~7.4 \
  php7-simplexml=~7.4 \
  php7-sockets=~7.4 \
  php7-tokenizer=~7.4 \
  php7-xml=~7.4 \
  php7-xmlwriter=~7.4

RUN wget -q -O /usr/local/bin/psalm 'https://github.com/vimeo/psalm/releases/download/4.6.3/psalm.phar' \
  && chmod +x /usr/local/bin/psalm

COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT [ "/entrypoint.sh" ]

WORKDIR /app
