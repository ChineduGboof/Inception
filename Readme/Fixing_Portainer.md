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

## Notes

Alright, let's dive into the exciting world of Dockerizing Portainer and tinkering with the docker-compose.yml file. But hold on, there are a few things you should know that will make your Docker journey even more delightful!
First things first, we created a super simple dockerfile for Portainer. It's nothing fancy, just the basics to get Portainer up and running smoothly. Easy peasy!. 

Now, let's talk about the changes we made in the docker-compose.yml file.

1. We waved goodbye to the ports in the Mariadb and WordPress sections. Why, you ask? Well, our             subject-mandatory diagram insists that these services should only be accessed through the port 443 (Nginx). It's all about that secure connection, folks!

<img width="750" alt="Inception" src="https://github.com/ChineduGboof/Inception/assets/111196709/da656d14-7677-474f-9336-cb61c465cd11">

2. Next, keep an eye out for the image segment with the service names. We made sure to follow the rule that each Docker image should have the same name as its corresponding service. However, when it comes to Portainer, there's a twist. We need to include the version number as well, like this: "portainer/portainer-ce:2.9.3". Pretty specific, right? Try removing the version number and see your portainer fail!
You could explain this to the evaluator or change your portainer container name to "portainer/portainer-ce:2.9.3", but it makes no sense to me to do that. 

3. Last but not least, we spiced things up by changing "restart: always" to "restart: on-failure" in the docker-compose.yml file. It just feels more appropriate for our project. We want our containers to bounce back like champions when faced with failure!

Now go forth, fellow Docker enthusiast, and embrace the wonders of Portainer and compose files. May your Docker journey be filled with joy, laughter, and flawless container orchestration!






