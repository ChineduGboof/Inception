# Use Alpine Linux 3.16 as the base image
FROM alpine:3.16

# Set the default PHP version to 8.2.5 and specify some database credentials as build arguments
ARG PHP_VERSION=8 \
    DB_NAME \
    DB_USER \
    DB_PASS \
    WPADPASS \
    WPUSER1PASS

# Update the package repository, upgrade installed packages, and install PHP and some PHP extensions
RUN apk update && apk upgrade && apk add --no-cache \
    php${PHP_VERSION} \
    php${PHP_VERSION}-fpm \
    php${PHP_VERSION}-mysqli \
    php${PHP_VERSION}-json \
    php${PHP_VERSION}-curl \
    php${PHP_VERSION}-dom \
    php${PHP_VERSION}-exif \
    php${PHP_VERSION}-fileinfo \
    php${PHP_VERSION}-mbstring \
    php${PHP_VERSION}-openssl \
    php${PHP_VERSION}-xml \
    php${PHP_VERSION}-zip \
    php${PHP_VERSION}-redis \
    wget \
    curl \
    php-phar \
    unzip && \
    # Configure the PHP-FPM daemon to listen on port 9000
    sed -i "s|listen = 127.0.0.1:9000|listen = 9000|g" \
      /etc/php8/php-fpm.d/www.conf && \
    sed -i "s|;listen.owner = nobody|listen.owner = nobody|g" \
      /etc/php8/php-fpm.d/www.conf && \
    sed -i "s|;listen.group = nobody|listen.group = nobody|g" \
      /etc/php8/php-fpm.d/www.conf && \
    # Clean up the package cache to reduce the image size
    rm -f /var/cache/apk/*
RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
  && chmod +x wp-cli.phar && php wp-cli.phar --info \
  && cp wp-cli.phar /usr/local/bin/wp

# Set the working directory to /var/www and download and extract the latest version of WordPress
WORKDIR /var/www
RUN wget https://wordpress.org/latest.zip && \
    unzip latest.zip && \
    cp -rf wordpress/* . && \
    rm -rf wordpress latest.zip

# Copy a script to the container that generates the WordPress configuration file and run it
COPY ./requirements/wordpress/conf/wp-config-create.sh .
COPY ./requirements/wordpress/conf/setup.sh /usr/local/bin/

# Grant write permission to the wp-content directory to avoid file permission issues
RUN chmod 777 /usr/local/bin/setup.sh
RUN sh wp-config-create.sh && rm wp-config-create.sh && \
    chmod -R 0777 wp-content/

# Run the script to set up the WordPress details
CMD ["/usr/local/bin/setup.sh"]