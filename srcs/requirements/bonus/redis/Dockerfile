# Use Alpine Linux version 3.16 as base image
FROM alpine:3.16

# Update and upgrade Alpine packages and install Redis
RUN apk update && apk upgrade && \
    apk add --no-cache redis && \
    # Configure Redis
    sed -i "s|bind 127.0.0.1|#bind 127.0.0.1|g"  /etc/redis.conf && \
    sed -i "s|# maxmemory <bytes>|maxmemory 20mb|g"  /etc/redis.conf && \
    echo "maxmemory-policy allkeys-lru" >> /etc/redis.conf

# Expose Redis default port
EXPOSE 6379

# Set the default command to start Redis using the updated configuration file
CMD [ "redis-server" , "/etc/redis.conf" ]
