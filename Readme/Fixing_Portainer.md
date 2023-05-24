## Creating a Dockerfile for Portainer

As you would have noticed by now, the portainer installation in the previous guide, had no dockerfile because the installation was pretty simple and straightforawrd. However the evaluation guide, requires that we have a dockerfile for each service. So we will abstract the installation process for portainer into a dockerfile and add its section in the docker-compose.yml file. Its really very simple and with just a few commands, we are good.

## PORTAINER DOCKERFILE

        # Use the stable version of Alpine as the base image
        FROM alpine:3.16

        # Install Docker
        RUN apk add --no-cache docker


    ## ADJUSTED DOCKER-COMPOSE.YML FILE

    version: '3'

    services:
    # Nginx service
    nginx:
        # Build the Docker image from the Nginx Dockerfile in requirements/nginx/
        image: nginx
        build:
        context: .
        dockerfile: requirements/nginx/Dockerfile
        # Set a container name
        container_name: nginx
        # Depend on the WordPress service being up and running
        depends_on:
        - wordpress
        # Publish port 443 on the host to port 443 in the container
        ports:
        - "443:443"
        # Attach to the inception network
        networks:
        - inception
        # Mount local directories as volumes in the container
        volumes:
        - wp-volume:/var/www/
        # Always restart the container if it stops
        restart: on-failure

    # MariaDB service
    mariadb:
        # Build the Docker image from the MariaDB Dockerfile in requirements/mariadb/
        image: mariadb
        build:
        context: .
        dockerfile: requirements/mariadb/Dockerfile
        args:
            # Pass arguments for the database name, username, password, and root password
            DB_NAME: ${DB_NAME}
            DB_USER: ${DB_USER}
            DB_PASS: ${DB_PASS}
            DB_ROOT: ${DB_ROOT}
        # Set a container name
        container_name: mariadb
        # Attach to the inception network
        networks:
        - inception
        volumes:
        - db-volume:/var/lib/mysql
        # Always restart the container if it stops
        restart: on-failure

    # WordPress service
    wordpress:
        # Build the Docker image from the WordPress Dockerfile in requirements/wordpress/
        image: wordpress
        env_file:
        - .env
        build:
        context: .
        dockerfile: requirements/wordpress/Dockerfile
        args:
            # Pass arguments for the database name, username, and password
            DB_NAME: ${DB_NAME}
            DB_USER: ${DB_USER}
            DB_PASS: ${DB_PASS}
            DOMAIN_NAME: ${DOMAIN_NAME}
            WPADUSER: ${WPADUSER}
            WPUSER1: ${WPUSER1}
            WPADPASS: ${WPADPASS}
            WPUSER1PASS: ${WPUSER1PASS}
        # Set a container name
        container_name: wordpress
        # Depend on the MariaDB service being up and running
        depends_on:
        - mariadb
        # Always restart the container if it stops
        restart: on-failure
        # Attach to the inception network
        networks:
        - inception
        # Mount the wp-volume volume in the container
        volumes:
        - wp-volume:/var/www/

    redis:
        image: redis
        build:
        context: .
        dockerfile: requirements/bonus/redis/Dockerfile
        container_name: redis
        ports:
        - "6379:6379"
        networks:
        - inception
        restart: on-failure

    vsftpd:
        image: vsftpd
        build:
        context: .
        dockerfile: requirements/bonus/vsftpd/Dockerfile
        args:
            FTP_USR: ${FTP_USR}
            FTP_PWD: ${FTP_PWD}
        container_name: vsftpd
        ports:
        - "21:21"
        volumes:
        - wp-volume:/var/www/
        networks:
        - inception
        restart: on-failure

    adminer:
        image: adminer
        build:
        context: .
        dockerfile: requirements/bonus/adminer/Dockerfile
        container_name: adminer
        depends_on:
        - mariadb
        ports:
        - "8080:8080"
        networks:
        - inception
        restart: on-failure

    website:
        image: website
        build:
        context: .
        dockerfile: requirements/bonus/website/Dockerfile
        container_name: website
        ports:
        - "80:80"
        networks:
        - inception
        restart: on-failure

    portainer:
        image: portainer/portainer-ce:2.9.3
        container_name: portainer
        ports:
        - '8000:8000'
        - '9443:9443'
        networks:
        - inception
        volumes:
        - /var/run/docker.sock:/var/run/docker.sock
        - portainer_data:/data
        restart: on-failure

    # Define Docker volumes
    volumes:
    # wp-volume volume for WordPress files
    wp-volume:
        # Set driver options for the volume
        driver_opts:
        o: bind
        type: none
        device: /home/${USER}/data/wordpress

    # db-volume volume for MariaDB files
    db-volume:
        # Set driver options for the volume
        driver_opts:
        o: bind
        type: none
        device: /home/${USER}/data/mariadb

    portainer_data:  # Added volume for Portainer data persistence

    # Define Docker networks
    networks:
    # inception bridge network
    inception:
        # Set the network driver to bridge
        driver: bridge
