# Use Alpine Linux 3.16 as the base image
FROM alpine:3.16

# Update package repositories, upgrade installed packages, and install NGINX
RUN apk update && apk upgrade && apk add --no-cache nginx

# Expose port 443 to the outside world
EXPOSE 443

# Start NGINX in the foreground when the container starts
CMD ["nginx", "-g", "daemon off;"]

