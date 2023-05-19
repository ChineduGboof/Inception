# Use Alpine Linux version 3.16 as base image
FROM alpine:3.16

# Update and upgrade Alpine packages and install Redis
RUN apk update && apk upgrade && \
    apk add --no-cache redis && \
    sed -i "s|# maxmemory <bytes>|maxmemory 128mb|g" /etc/redis.conf && \
    sed -i "s|protected-mode yes|protected-mode no|g" /etc/redis.conf && \
    echo "maxmemory-policy allkeys-lfu" >> /etc/redis.conf

# Expose Redis default port
EXPOSE 6379

# Set the default command to start Redis using the updated configuration file
CMD ["redis-server"]
