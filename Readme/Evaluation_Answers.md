# INCEPTION QUESTIONS

## How Does Docker and Docker-Compose work?

Docker is a tool that lets developers package their applications and dependencies into small, portable containers that can run consistently across different environments. Docker-compose is a tool that makes it easy to manage multiple containers that make up an application, allowing developers to define their infrastructure and services as code in a simple YAML file. Together, Docker and docker-compose enable developers to build, ship, and run applications anywhere with ease.

## Difference between a Docker image used with docker-compose and without docker-compose?

A Docker image is a lightweight, standalone, and executable package that includes everything needed to run an application, including code, runtime, system tools, libraries, and settings.

When using Docker without docker-compose, developers use the `docker run` command to create and run a container based on an image. This requires manually specifying all the settings for the container, like which port to use and which files to include. It can be time-consuming and prone to error.

Docker-compose is a tool that simplifies this process by allowing developers to define their entire application infrastructure in a single YAML file. This file includes all the container images, settings, and relationships between containers. Docker-compose takes care of creating, configuring, and managing all the containers in the YAML file, making it easy to launch a multi-container application with a single command. It also simplifies management and scaling of the application.

## The Benefit of Docker compared to VM’s?

1. Resource efficiency: Docker containers are much more lightweight than VMs, meaning they consume fewer resources and can be deployed more quickly.
2. Portability: Docker containers can run on any machine that has Docker installed, regardless of the underlying operating system or hardware, making it easier to move applications between environments.
3. Scalability: Docker's architecture allows for easy scaling of containerized applications by quickly spinning up additional containers as needed.
4. Isolation: Docker provides a high level of isolation between containers, so applications running within one container cannot interfere with applications running in another.
5. Modularity: Docker's modular design makes it easy to break an application down into smaller, more manageable components that can be updated and deployed independently.

## Explain the pertinence of the directory structure required for the project.

In the given directory structure, the root directory contains a Makefile and a subdirectory called "srcs". The "srcs" directory contains a docker-compose.yml file and a ".env" file, as well as subdirectories for different application components, including mariadb, nginx, tools, and wordpress. Each subdirectory contains a Dockerfile, a .dockerignore file, and other resources specific to that component.

The ".env" file contains environment variables that are used by the docker-compose.yml file and the Dockerfiles to configure the application. These variables include the domain name, MySQL setup parameters, and certificate paths.

Overall, this directory structure helps to keep the different components of the application organized and easily accessible, making it easier for developers to build, run, and manage the application.

## Ensure that NGINX can be accessed by port 443 only. Once done, open the page

To ensure that NGINX can be accessed by port 443 only, you can specify `listen 443 ssl` directive in the NGINX configuration file, which indicates that NGINX should listen on port 443 and use SSL for secure communication. In your configuration file, this directive is already included, so you are good to go.

To open the page, you can open a web browser and type in the URL `https://cegbulef.42.fr` or `https://www.cegbulef.42.fr`, depending on which `server_name` you want to access. This should take you to the NGINX website hosted on port 443.

## What is Nginx and its use?

Nginx is a free, open-source web server and reverse proxy used for serving static or dynamic content on the web. It can also be used as a load balancer, HTTP cache, and for other purposes. Nginx is highly scalable, efficient, and can handle a large number of concurrent connections.

In the project, Nginx was used as a web server for serving static files and as a reverse proxy for routing incoming requests to the appropriate backend services. Its main purposes were:

- Serving static files
- Redirecting HTTP requests to HTTPS
- Routing requests to appropriate backend services based on URL path
- Load balancing incoming traffic across multiple backend instances
- Enforcing SSL encryption for secure communication
- Implementing caching strategies for faster response times and reduced server load

Nginx played a critical role in ensuring the performance, security, and scalability of the web application.

## What is SSL & TSL?

A SSL/TLS certificate is a digital certificate that is used to verify the authenticity of a website and establish a secure, encrypted connection between a client (e.g., a web browser) and a server. SSL (Secure Sockets Layer) and its successor, TLS (Transport Layer Security), are cryptographic protocols that ensure data privacy, integrity, and authentication over the internet.

Nginx can use SSL/TLS to encrypt traffic between the server and the client. When a client requests a secure connection to an Nginx server, Nginx will respond by initiating the SSL/TLS handshake process. During the handshake, Nginx will exchange cryptographic keys with the client, verify the identity of the client (if required), and negotiate the parameters of the encrypted connection.

## My Choice of Alpine over Debian

| Alpine                                                         | Debian                                                                                         |
|----------------------------------------------------------------|------------------------------------------------------------------------------------------------|
| Smaller image size due to the use of a musl libc and BusyBox   | Larger image size due to the use of a glibc and more packages                                  |
| Faster startup time and lower resource usage                   | Slower startup time and higher resource usage                                                  |
| More secure due to its minimalistic design                     | Potentially less secure due to the larger number of packages and services running in the image |
| More suitable for running in resource-constrained environments | More suitable for running in environments with ample resources                                 |
| Less mature ecosystem with fewer pre-built packages            | More mature ecosystem with a larger number of pre-built packages                               |

## What is Docker-Network?

Docker network is a feature that enables Docker containers to communicate with each other and with other networks outside the Docker environment. Docker networks provide an isolated environment for containers to communicate with each other without the need for additional configuration or exposing ports on the host machine.

There are different types of Docker networks, such as bridge, host, overlay, and macvlan. Each network type has its own set of characteristics and use cases. For example, the bridge network is the default network for Docker, and it enables containers to communicate with each other on the same host machine. The host network mode, on the other hand, allows containers to use the host network stack, which can provide better performance but less isolation.

In summary, Docker networks enable containers to communicate with each other and with the outside world, while providing isolation and security to the containerized applications.

## Docker Volume

Docker volumes are a way to persist data generated or used by Docker containers. They provide a mechanism for storing and sharing data between containers, as well as persisting data across container restarts or removals.

## Adminer

Adminer provides a user-friendly and intuitive interface for managing databases, making it easy to interact with your database system without requiring extensive knowledge of command-line tools or complex configurations.

## Using Adminer

To access Adminer and manage your MySQL database, follow these steps:

Open a web browser and enter the URL: `http://localhost:8080`

On the Adminer login page, enter the following details:

- System: `MySQL`
- Server: `mariadb`
- Username: `wpuser`
- Password: `wppass`
- Database: `wordpress`

These credentials will allow you to connect to your MySQL database using Adminer and perform various database management tasks.

Please note that the provided credentials (username, password, server, and database) are placeholders. Make sure to replace them with the actual credentials for your specific setup if you changed them.

## Redis

Redis is a software tool that is used to store and retrieve data quickly. It is often used as a cache, which means it temporarily stores data in memory to improve the performance of applications. Caching is beneficial because it allows applications to fetch data faster, reducing the need to access slower data sources such as databases.

In the Inception project, Redis is installed and used to improve the performance of the application by caching frequently accessed data. When a user requests certain information, instead of fetching it from the main database every time, Redis stores a copy of the data in its memory. Subsequent requests for the same data can then be served directly from Redis, which is much faster than querying the database every time.

By incorporating Redis into the Inception project, it helps enhance the overall performance and responsiveness of the application, reduces the load on the main database, and enables efficient communication between different components.

## Working with Redis CLI

To interact with Redis using the Redis CLI, you can follow these commands:

# Log into the Redis CLI
`docker exec -it redis redis-cli`

# Verify connectivity with Redis
`PING`
# Output: PONG

# Set a key-value pair
`SET mykey "Hello, Redis!"`

# Retrieve the value of a key
`GET mykey`

Using the above commands, you can log into the Redis CLI, verify the connection, set a key-value pair, and retrieve the value associated with a specific key.

## VSFTPD | FILEZILLA

`vsftpd` (Very Secure FTP Daemon) is an FTP server software that allows you to set up an FTP (File Transfer Protocol) server on your machine. It provides a way for clients (users) to connect to the server and transfer files between the client and the server.

## Using FileZilla with vsftpd

To access FileZilla using vsftpd, you can follow these steps:

1. Ensure you have started the X server by running the command sudo startx.

2. Right-click on the desktop and navigate to "Applications" and select "Internet," then choose "FileZilla" from the list.

3. In the FileZilla interface, enter the following details:

Host: `127.0.0.1`
Username: `ftpuser`
Password: `ftppass`
Port: `21`

These credentials will allow you to establish a connection between FileZilla and the vsftpd server running on your local machine.
- Please note that the provided credentials (username and password) are placeholders, and you should replace them with the appropriate login details for your vsftpd server if you changed them.

## Portainer

Portainer is an open-source container management tool that provides a user-friendly web interface for managing Docker environments. It offers a graphical interface for managing containers, images, volumes, networks, and more. With Portainer, you can easily monitor and control your Docker resources without the need for complex command-line interactions.

In the Inception project, Portainer was used to simplify the management and monitoring of the Docker containers and services. It provided an intuitive interface for visualizing the containerized application's infrastructure, inspecting logs, managing container configurations, and monitoring resource utilization. Portainer made it easier for developers and administrators to interact with the Docker environment, simplifying tasks such as starting and stopping containers, scaling services, and troubleshooting issues.

With Portainer's user-friendly interface, team members could easily collaborate and manage the Docker-based application, even without deep knowledge of Docker commands. It enhanced the development workflow, improved productivity, and provided a centralized management platform for the containerized application.

## How to access Portainer

To access Portainer, open a web browser and enter the URL `https://localhost:9443` or `http://localhost:8000`, depending on the server's configuration. This will take you to the Portainer login page. If this is your first time accessing Portainer, you will need to set up an initial admin user and password. Follow the on-screen instructions to complete the setup process.

Once logged in, you will have access to the Portainer dashboard, where you can manage your Docker environment, containers, networks, volumes, and more.

## How Does Docker and Docker-Compose work?

Docker is a tool that lets developers package their applications and dependencies into small, portable containers that can run consistently across different environments. Docker-compose is a tool that makes it easy to manage multiple containers that make up an application, allowing developers to define their infrastructure and services as code in a simple YAML file. Together, Docker and docker-compose enable developers to build, ship, and run applications anywhere with ease.

## Difference between a Docker image used with docker-compose and without docker-compose?

A Docker image is a lightweight, standalone, and executable package that includes everything needed to run an application, including code, runtime, system tools, libraries, and settings.

When using Docker without docker-compose, developers use the `docker run` command to create and run a container based on an image. This requires manually specifying all the settings for the container, like which port to use and which files to include. It can be time-consuming and prone to error.

Docker-compose is a tool that simplifies this process by allowing developers to define their entire application infrastructure in a single YAML file. This file includes all the container images, settings, and relationships between containers. Docker-compose takes care of creating, configuring, and managing all the containers in the YAML file, making it easy to launch a multi-container application with a single command. It also simplifies management and scaling of the application.

## The Benefit of Docker compared to VM’s?

1. Resource efficiency: Docker containers are much more lightweight than VMs, meaning they consume fewer resources and can be deployed more quickly.
2. Portability: Docker containers can run on any machine that has Docker installed, regardless of the underlying operating system or hardware, making it easier to move applications between environments.
3. Scalability: Docker's architecture allows for easy scaling of containerized applications by quickly spinning up additional containers as needed.
4. Isolation: Docker provides a high level of isolation between containers, so applications running within one container cannot interfere with applications running in another.
5. Modularity: Docker's modular design makes it easy to break an application down into smaller, more manageable components that can be updated and deployed independently.

## Explain the pertinence of the directory structure required for the project.

In the given directory structure, the root directory contains a Makefile and a subdirectory called "srcs". The "srcs" directory contains a docker-compose.yml file and a ".env" file, as well as subdirectories for different application components, including mariadb, nginx, tools, and wordpress. Each subdirectory contains a Dockerfile, a .dockerignore file, and other resources specific to that component.

The ".env" file contains environment variables that are used by the docker-compose.yml file and the Dockerfiles to configure the application. These variables include the domain name, MySQL setup parameters, and certificate paths.

Overall, this directory structure helps to keep the different components of the application organized and easily accessible, making it easier for developers to build, run, and manage the application.

## Ensure that NGINX can be accessed by port 443 only. Once done, open the page

To ensure that NGINX can be accessed by port 443 only, you can specify `listen 443 ssl` directive in the NGINX configuration file, which indicates that NGINX should listen on port 443 and use SSL for secure communication. In your configuration file, this directive is already included, so you are good to go.

To open the page, you can open a web browser and type in the URL `https://cegbulef.42.fr` or `https://www.cegbulef.42.fr`, depending on which `server_name` you want to access. This should take you to the NGINX website hosted on port 443.

## What is Nginx and its use?

Nginx is a free, open-source web server and reverse proxy used for serving static or dynamic content on the web. It can also be used as a load balancer, HTTP cache, and for other purposes. Nginx is highly scalable, efficient, and can handle a large number of concurrent connections.

In the project, Nginx was used as a web server for serving static files and as a reverse proxy for routing incoming requests to the appropriate backend services. Its main purposes were:

- Serving static files
- Redirecting HTTP requests to HTTPS
- Routing requests to appropriate backend services based on URL path
- Load balancing incoming traffic across multiple backend instances
- Enforcing SSL encryption for secure communication
- Implementing caching strategies for faster response times and reduced server load

Nginx played a critical role in ensuring the performance, security, and scalability of the web application.

## What is SSL & TSL?

A SSL/TLS certificate is a digital certificate that is used to verify the authenticity of a website and establish a secure, encrypted connection between a client (e.g., a web browser) and a server. SSL (Secure Sockets Layer) and its successor, TLS (Transport Layer Security), are cryptographic protocols that ensure data privacy, integrity, and authentication over the internet.

Nginx can use SSL/TLS to encrypt traffic between the server and the client. When a client requests a secure connection to an Nginx server, Nginx will respond by initiating the SSL/TLS handshake process. During the handshake, Nginx will exchange cryptographic keys with the client, verify the identity of the client (if required), and negotiate the parameters of the encrypted connection.

## My Choice of Alpine over Debian

| Alpine                                                      | Debian                                                     |
|-------------------------------------------------------------|------------------------------------------------------------|
| Smaller image size due to the use of a musl libc and BusyBox | Larger image size due to the use of a glibc and more packages |
| Faster startup time and lower resource usage                 | Slower startup time and higher resource usage               |
| More secure due to its minimalistic design                   | Potentially less secure due to the larger number of packages and services running in the image |
| More suitable for running in resource-constrained environments | More suitable for running in environments with ample resources |
| Less mature ecosystem with fewer pre-built packages          | More mature ecosystem with a larger number of pre-built packages |

## What is Docker-Network?

Docker network is a feature that enables Docker containers to communicate with each other and with other networks outside the Docker environment. Docker networks provide an isolated environment for containers to communicate with each other without the need for additional configuration or exposing ports on the host machine.

There are different types of Docker networks, such as bridge, host, overlay, and macvlan. Each network type has its own set of characteristics and use cases. For example, the bridge network is the default network for Docker, and it enables containers to communicate with each other on the same host machine. The host network mode, on the other hand, allows containers to use the host network stack, which can provide better performance but less isolation.

In summary, Docker networks enable containers to communicate with each other and with the outside world, while providing isolation and security to the containerized applications.

## Docker Volume

Docker volumes are a way to persist data generated or used by Docker containers. They provide a mechanism for storing and sharing data between containers, as well as persisting data across container restarts or removals.

## Adminer

Adminer provides a user-friendly and intuitive interface for managing databases, making it easy to interact with your database system without requiring extensive knowledge of command-line tools or complex configurations.

## Redis

Redis is a software tool that is used to store and retrieve data quickly. It is often used as a cache, which means it temporarily stores data in memory to improve the performance of applications. Caching is beneficial because it allows applications to fetch data faster, reducing the need to access slower data sources such as databases.

In the Inception project, Redis is installed and used to improve the performance of the application by caching frequently accessed data. When a user requests certain information, instead of fetching it from the main database every time, Redis stores a copy of the data in its memory. Subsequent requests for the same data can then be served directly from Redis, which is much faster than querying the database every time.

By incorporating Redis into the Inception project, it helps enhance the overall performance and responsiveness of the application, reduces the load on the main database, and enables efficient communication between different components.

## VSFTPD | FILEZILLA

`vsftpd` (Very Secure FTP Daemon) is an FTP server software that allows you to set up an FTP (File Transfer Protocol) server on your machine. It provides a way for clients (users) to connect to the server and transfer files between the client and the server.

Feel free to format and upload these texts to your Git README.md file.
