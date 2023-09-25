# the Alpine Linux base image
FROM alpine:latest

# Update package repositories and install Postfix
RUN apk update && apk add postfix
RUN adduser -D hamza

# Copy your Postfix configuration file
COPY conf/main.cf /etc/postfix/main.cf

# Start Postfix in the foreground
CMD ["postfix", "start-fg"]
