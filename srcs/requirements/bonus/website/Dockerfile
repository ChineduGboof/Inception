# Use Alpine Linux 3.16 as the base image
FROM alpine:3.16

# Update and upgrade packages and then install Nginx without caching any of the files
RUN	apk update && apk upgrade && apk add --no-cache nginx

# Create a default Nginx configuration file with root directory set to /var/www and a location block to try to serve requested URLs as files or fallback to /index.html
RUN echo "server {" > /etc/nginx/http.d/default.conf && \
    echo "root    /var/www;" >> /etc/nginx/http.d/default.conf && \
    echo "location / {" >> /etc/nginx/http.d/default.conf && \
    echo "    try_files \$uri /index.html;" >> /etc/nginx/http.d/default.conf && \
    echo "}}" >> /etc/nginx/http.d/default.conf

# Copy website configuration files to /var/www
COPY requirements/bonus/website/conf/* /var/www/

# Expose port 80
EXPOSE 80

# Start Nginx with daemon off to run in the foreground
CMD ["nginx", "-g", "daemon off;"]
