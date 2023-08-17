FROM alpine:latest

# Update the package index and install Nginx and openrc
RUN apk update && apk add nginx &&  apk add openrc

COPY ./conf/default.conf /etc/nginx/http.d/default.conf

RUN mkdir -p /run/openrc && touch /run/openrc/softlevel && \
    rc-update add nginx default 
EXPOSE 443

# Start Nginx in the foreground and keep the container running
CMD ["nginx", "-g", "daemon off;"]
