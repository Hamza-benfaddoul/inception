# Use Alpine Linux as the base image
FROM alpine:3.18.3

# Install vsftpd and create necessary directories
RUN apk update
RUN apk add vsftpd

# Copy vsftpd configuration file
COPY ./conf/vsftpd.conf /etc/vsftpd/vsftpd.conf
COPY ./tools/setup.sh /

# Expose FTP port (default is 21)
EXPOSE 21
RUN chmod 755 /setup.sh

# Start vsftpd service
CMD ["/setup.sh"]

