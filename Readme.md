## Inception

Project Inception (42 Abudhabi).

This set of guides is intended for the phased implementation of the inception project.

## Must Read
> Follow the guide below and conclude the installation of all needed for the inception project
> from the start (Mandatory) to the bonus.
> After that, follow the additional steps to adjust certain issues made in the guide that 
> are not part of the subjects requirements and could potentially affect your grades in the project.
> * Remember to remove the .env file when submitting to your git repository

## Mandatory

Briefly about the stages of the project:

- [X] Installing OS in virtualbox - [guide 00](https://github-com.translate.goog/codesshaman/inception/blob/main/00_INSTALL_SYSTEM.md?_x_tr_sl=auto&_x_tr_tl=en&_x_tr_hl=en&_x_tr_pto=wapp "Installing OS in virtualbox")
- [X] Installing software inside OS - [guide 01](https://github-com.translate.goog/codesshaman/inception/blob/main/01_INSTALL_SOFT.md?_x_tr_sl=auto&_x_tr_tl=en&_x_tr_hl=en&_x_tr_pto=wapp "Installing software inside OS")
- [X] Port forwarding to host - [guide 02](https://github-com.translate.goog/codesshaman/inception/blob/main/02_PORTS_FORWARDING.md?_x_tr_sl=auto&_x_tr_tl=en&_x_tr_hl=en&_x_tr_pto=wapp "Port forwarding to host")
- [X] Saving snapshots to the cloud - [guide 03](https://github-com.translate.goog/codesshaman/inception/blob/main/03_CLOUD_STORAGE.md?_x_tr_sl=auto&_x_tr_tl=en&_x_tr_hl=en&_x_tr_pto=wapp "Saving snapshots to the cloud")
- [X] Inception - [guide 04](https://github-com.translate.goog/codesshaman/inception/blob/main/04_FIRST_SETTINGS.md?_x_tr_sl=auto&_x_tr_tl=en&_x_tr_hl=en&_x_tr_pto=wapp "Inception")
- [X] Certificate installation - [guide 05](https://github-com.translate.goog/codesshaman/inception/blob/main/05_INSTALL_CERTIFICATE.md?_x_tr_sl=auto&_x_tr_tl=en&_x_tr_hl=en&_x_tr_pto=wapp "Certificate installation")
- [X] Creating a Makefile - [guide 06](https://github-com.translate.goog/codesshaman/inception/blob/main/06_MAKEFILE_CREATION.md?_x_tr_sl=auto&_x_tr_tl=en&_x_tr_hl=en&_x_tr_pto=wapp "Creating a Makefile")
- [X] Deploying nginx - [guide 07](https://github-com.translate.goog/codesshaman/inception/blob/main/07_DOCKER_NGINX.md?_x_tr_sl=auto&_x_tr_tl=en&_x_tr_hl=en&_x_tr_pto=wapp "Deploying nginx")
- [X] Deploying mariadb - [guide 08](https://github-com.translate.goog/codesshaman/inception/blob/main/08_DOCKER_MARIADB.md?_x_tr_sl=auto&_x_tr_tl=en&_x_tr_hl=en&_x_tr_pto=wapp "Deploying mariadb")
- [X] Deploying wordpress - [guide 09](https://github-com.translate.goog/codesshaman/inception/blob/main/09_DOCKER_WORDPRESS.md?_x_tr_sl=auto&_x_tr_tl=en&_x_tr_hl=en&_x_tr_pto=wapp "Deploying wordpress")

***BONUS PART***

- [X] Installing Redis - [guide 10](https://github-com.translate.goog/codesshaman/inception/blob/main/10_WORDPRESS_REDIS.md?_x_tr_sl=auto&_x_tr_tl=en&_x_tr_hl=en&_x_tr_pto=wapp "Installing Redis")
- [X] Installing vsftpd - [guide 11](https://github-com.translate.goog/codesshaman/inception/blob/main/11_VSFTPD_SERVER.md?_x_tr_sl=auto&_x_tr_tl=en&_x_tr_hl=en&_x_tr_pto=wapp "Installing vsftpd")
- [X] Installing Adminer - [guide 12](https://github-com.translate.goog/codesshaman/inception/blob/main/12_INSTALL_ADMINER.md?_x_tr_sl=auto&_x_tr_tl=en&_x_tr_hl=en&_x_tr_pto=wapp "Installing Adminler")
- [X] Installing portainer - guide [guide 13](https://github-com.translate.goog/codesshaman/inception/blob/main/13_PORTAINER_INSTALL.md?_x_tr_sl=auto&_x_tr_tl=en&_x_tr_hl=en&_x_tr_pto=wapp "Installing portainer")

## Corrections

- [X] Automated SSL Certificate Installation - guide [guide 14](https://github.com/ChineduGboof/Inception/blob/main/Readme/Fixing_Certificates.md "Automated SSL Certificate Installation")
- [X] Dockerfile for Portainer and Adjusting the Docker-Compose File  - guide [guide 15](https://github.com/ChineduGboof/Inception/blob/main/Readme/Fixing_Portainer.md "Creating A Dockerfile for Portainer and Adjusting the Docker-Compose File")
- [X] Automatically Setting Up Wordpress  - guide [guide 16](https://github.com/ChineduGboof/Inception/blob/main/Readme/Wordpress_Setup_Script.md "Automatically Setting Up Wordpress")
- [X] Minor Changes in the Makefile  - guide [guide 17](https://github.com/ChineduGboof/Inception/blob/main/Readme/Fixing_Makefile.md "Minor Changes in the Makefile")

## The Grand Finale: Execution

You've done it! The moment has arrived to unveil your masterpiece. Follow these final steps to bring it all to life:

In your command line, enter the command <pre><code>make fclean</code></pre> Watch as it gracefully clears all running containers, making way for the beautiful transformation that awaits.

Now, brace yourself and unleash the ultimate command: <pre><code>make all</code></pre> Like a conductor leading a symphony, this command orchestrates the rebuilding of it all. Sit back and witness the containers coming to life, one by one.

Curiosity piqued? Satiate it by running the command <pre><code>docker ps</code></pre> Behold the beauty of your containers standing tall, ready to fulfill their purpose in this grand performance.

And there you have it! With a few keystrokes, you've breathed life into your creation Take a moment to appreciate your accomplishment and revel in the power of your commands.

Now, go forth and conquer the world with your magnificent creation!

## Evaluation Answers

- [X] Answers to Evaluation Questions - guide [guide 14](https://github.com/ChineduGboof/Inception/blob/main/Readme/Evaluation_Answers.md "Answers to Evaluation Questions")
- 
## Further Learning
For those who would love to learn more, the following files would be helpful

### Docker
- [Docker: Overview](https://docs.docker.com/get-started/overview/)
- [Gamified Docker Commands Learning](https://kodekloud.com/topic/labs-basic-docker-commands-beta/)
- [Docker: Containerize an Application](https://docs.docker.com/get-started/02_our_app/)
- [Docker: Packaging your Software](https://docs.docker.com/build/building/packaging/#dockerfile)
- [Docker: Create a Base Image](https://docs.docker.com/build/building/base-images/)
- [Best Practices for Writing Dockerfiles](https://docs.docker.com/develop/develop-images/dockerfile_best-practices/)
- [Dockerfile Reference](https://docs.docker.com/engine/reference/builder/)
- [How to create your first Docker application](https://www.freecodecamp.org/news/a-beginners-guide-to-docker-how-to-create-your-first-docker-application-cc03de9b639f)
- [A Beginner’s Guide to Building Docker Images](https://stackify.com/docker-build-a-beginners-guide-to-building-docker-images/)
- [Dockerfile Best Practices](https://www.harness.io/blog/best-practices-for-docker)
- [Docker ARG, ENV and .env - a Complete Guide](https://vsupalov.com/docker-arg-env-variable-guide/#arg-and-env-availability)

### Docker Compose
- [Compose File Specification](https://docs.docker.com/compose/compose-file/)
- [Docker Compose Tutorial: Advanced Docker Made Simple](https://www.educative.io/blog/docker-compose-tutorial)
- [How to pass ENV arguments in my Dockerfile when using docker-compose](https://stackoverflow.com/questions/66443125/how-to-pass-env-arguments-in-my-dockerfile-when-using-docker-compose)
- [How to set a path on host for a named volume in docker-compose.yml](https://stackoverflow.com/questions/36387032/how-to-set-a-path-on-host-for-a-named-volume-in-docker-compose-yml)

### NGINX
- [NGINX Official Image](https://hub.docker.com/_/nginx)
- [NGINX Documentation](http://nginx.org/en/docs/)
- [How To Create Custom NGINX Docker Image](https://towardsaws.com/how-to-create-custom-nginx-docker-image-94c6bd4be29)
- [Setting up a self-signed SSL certificate for Nginx Docker](https://www.devopsforit.com/posts/setting-up-a-self-signed-ssl-certificate-for-nginx-docker)
- [Dockerise your PHP application with Nginx and PHP7-FPM](http://geekyplatypus.com/dockerise-your-php-application-with-nginx-and-php7-fpm/)
- [How to Configure PHP-FPM with NGINX](https://www.digitalocean.com/community/tutorials/php-fpm-nginx)
- [How to setup PHP on Nginx with fastCGI (PHP-FPM) example](https://www.theserverside.com/blog/Coffee-Talk-Java-News-Stories-and-Opinions/Nginx-PHP-FPM-config-example)

### WordPress
- [WordPress Official Image](https://hub.docker.com/_/wordpress)
- [Get Started With WordPress](https://wordpress.org/documentation/article/get-started-with-wordpress/)
- [How to Install WordPress](https://wordpress.org/documentation/article/how-to-install-wordpress/)
- [WP CLI Commands](https://developer.wordpress.org/cli/commands/)
- [WP Config Create](https://developer.wordpress.org/cli/commands/config/create/)
- [WP User Create](https://developer.wordpress.org/cli/commands/user/create/)
- [Wordpress Themes](https://wordpress.org/themes/)
- [WP Theme Install](https://developer.wordpress.org/cli/commands/theme/install/)
- [Install and Configure WordPress](https://ubuntu.com/tutorials/install-and-configure-wordpress#1-overview)
- [How to install WordPress on Ubuntu 18.04](https://www.digitalocean.com/community/tutorials/install-wordpress-on-ubuntu)

### MariaDB
- [MariaDB Official Image](https://hub.docker.com/_/mariadb)
- [MariaDB Primer](https://mariadb.com/kb/en/a-mariadb-primer/)
- [How To Create a New User and Grant Permissions in MySQL](https://linuxhostsupport.com/blog/how-to-create-a-new-user-and-grant-permissions-in-mysql/)
- [MySQL Health Check](https://stackoverflow.com/questions/42567475/docker-compose-check-if-mysql-connection-is-ready)

### Redis
- [Redis Documentation](https://redis.io/docs/)
- [How To Setup Redis Caching For WordPress In A Few Simple Steps](https://www.youtube.com/watch?v=JrrSYypaXk4)

### FTP Server
- [vsftpd Rocky Linux Documentation](https://docs.rockylinux.org/guides/file_sharing/secure_ftp_server_vsftpd/)
- [How To Set Up vsftpd for a User's Directory on Ubuntu 20.04](https://www.digitalocean.com/community/tutorials/how-to-set-up-vsftpd-for-a-user-s-directory-on-ubuntu-20-04)

### Static Website
- [Install and Configure Apache](https://ubuntu.com/tutorials/install-and-configure-apache#1-overview)

### Adminer
- [Download Adminer with wget](https://unix.stackexchange.com/questions/420668/how-to-download-adminer-with-wget)


### Extra
- [WordPress Deployment with NGINX, PHP-FPM and MariaDB using Docker Compose](https://medium.com/swlh/wordpress-deployment-with-nginx-php-fpm-and-mariadb-using-docker-compose-55f59e5c1a)
- [Top 20 Docker Security Best Practices: Ultimate Guide](https://blog.aquasec.com/docker-security-best-practices)
- [Docker Security Best Practices: A Complete Guide](https://anchore.com/blog/docker-security-best-practices-a-complete-guide/)
