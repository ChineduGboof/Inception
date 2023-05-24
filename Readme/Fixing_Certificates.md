## Fixing the SSL Certificates

Hey there! We've got a little problem with those sneaky SSL keys. Keeping them in the tools folder isn't safe and, let's be honest, they have an expiry date. Imagine someone else using your app and then having to meet you just to get new keys. Awkward, right? So, let's do something fun with the Nginx Dockerfile to automatically generate new SSL keys whenever you do a "make fclean" and "make all" command. Plus, it'll save the keys in a secret container folder, so you can confidently delete any keys lurking in your tools folder.

## NGINX DOCKERFILE

    FROM alpine:3.16

    # Update package repositories, upgrade installed packages, and install NGINX
    RUN apk update && apk upgrade && apk add --no-cache nginx

    # Copy Nginx configuration file
    COPY ./requirements/nginx/conf/nginx.conf /etc/nginx/http.d/nginx.conf

    # Update package repositories and install necessary utilities
    RUN apk update && apk add --no-cache wget curl openssl

    # Download mkcert binary and move it to the desired folder
    WORKDIR /etc/nginx/ssl
    RUN curl -s https://api.github.com/repos/FiloSottile/mkcert/releases/latest \
        | grep browser_download_url \
        | grep linux-amd64 \
        | cut -d '"' -f 4 \
        | wget -qi - \
        && mv mkcert-v*-linux-amd64 mkcert \
        && chmod a+x mkcert

    # Generate SSL certificates using mkcert
    RUN ./mkcert cegbulef.42.fr \
        && mv cegbulef.42.fr-key.pem cegbulef.42.fr.key \
        && mv cegbulef.42.fr.pem cegbulef.42.fr.crt \
        && rm mkcert

    # Change back to the previous working directory
    WORKDIR /

    # Set file permissions to readable for all
    RUN chmod 644 /etc/nginx/http.d/nginx.conf

    # Set ownership to the Nginx user and group
    RUN chown -R nginx:nginx /etc/nginx/http.d

    # Set file permissions for SSL keys
    RUN chmod 600 /etc/nginx/ssl/cegbulef.42.fr.crt
    RUN chmod 600 /etc/nginx/ssl/cegbulef.42.fr.key

    # Set ownership to the Nginx user and group
    RUN chown -R nginx:nginx /etc/nginx/http.d /etc/nginx/ssl

    # Expose port 443 to the outside world
    EXPOSE 443

    # Start NGINX in the foreground when the container starts
    CMD ["nginx", "-g", "daemon off;"]

**Note:** To simplify the SSL key installation process, we have added a command that handles it effortlessly. Here's how it works:

1. First, we move to the container's working directory where the SSL keys need to be installed using the command `WORKDIR /etc/nginx/ssl`.

2. We utilize the fantastic `mkcert` software to install our SSL keys. To fetch the latest release from its GitHub repository, we use the command `curl -s https://api.github.com/repos/FiloSottile/mkcert/releases/latest`.

3. The downloaded file is named something like `mkcert-v*-linux-amd64`. To make it easier to work with, we rename it to simply `mkcert` with the command `mv mkcert-v*-linux-amd64 mkcert`.

4. Next, we grant the necessary file permissions using `chmod a+x mkcert`.

5. Now, we can automatically run the software using `./mkcert cegbulef.42.fr` command, which generates two keys for us: `cegbulef.42.fr-key.pem` and `cegbulef.42.fr.pem`. Remember to replace `cegbulef` with your username.

6. To have the keys with the appropriate extensions, we rename them using `mv cegbulef.42.fr-key.pem cegbulef.42.fr.key` and `mv cegbulef.42.fr.pem cegbulef.42.fr.crt`.

7. We no longer need the `mkcert` installation software, so we automatically remove it with `rm mkcert` command to save space.

8. Finally, we can go back to our previous working directory, and that's all you need to do for Nginx!

Enjoy the simplicity and security of automatically generated SSL keys. Cheers!
