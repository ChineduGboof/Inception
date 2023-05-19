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
