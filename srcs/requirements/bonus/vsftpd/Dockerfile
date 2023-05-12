# Use Alpine 3.16 as the base image
FROM alpine:3.16

# Define two build-time arguments for the FTP user and password
ARG FTP_USR \
    FTP_PWD

# Install vsftpd, which is an FTP server for Unix-like systems
RUN apk update && apk upgrade && \
    apk add --no-cache vsftpd

# Add a new user for FTP access, set their home directory, and set their password
RUN adduser -h /var/www -s /bin/false -D ${FTP_USR} && \
    echo "${FTP_USR}:${FTP_PWD}" | /usr/sbin/chpasswd && \
    adduser ${FTP_USR} root

# Edit the vsftpd configuration file to allow local users to be chrooted, allow local users to login, 
# enable write access, and set a custom umask
RUN sed -i "s|#chroot_local_user=YES|chroot_local_user=YES|g"  /etc/vsftpd/vsftpd.conf && \
    sed -i "s|#local_enable=YES|local_enable=YES|g"  /etc/vsftpd/vsftpd.conf && \
    sed -i "s|#write_enable=YES|write_enable=YES|g"  /etc/vsftpd/vsftpd.conf && \
    sed -i "s|#local_umask=022|local_umask=007|g"  /etc/vsftpd/vsftpd.conf

# Add some additional settings to the vsftpd configuration file
RUN echo "allow_writeable_chroot=YES" >> /etc/vsftpd/vsftpd.conf &&\
    echo 'seccomp_sandbox=NO' >> /etc/vsftpd/vsftpd.conf && \
    echo 'pasv_enable=YES' >> /etc/vsftpd/vsftpd.conf

# Set the working directory for the container to /var/www
WORKDIR /var/www

# Expose port 21 to allow FTP connections
EXPOSE 21

# Run vsftpd with the edited configuration file as the default command when the container starts
CMD [ "/usr/sbin/vsftpd", "/etc/vsftpd/vsftpd.conf" ]
