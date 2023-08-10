FROM alpine:latest

# Update the package index and install Nginx
RUN apk update && apk add nginx


# Remove the default Nginx configuration
RUN rm -rf /etc/nginx/http.d/default.conf

RUN apk add openrc
RUN mkdir -p /run/openrc && touch /run/openrc/softlevel
# COPY ./conf /etc/nginx/conf.d
RUN rc-update add nginx default 
EXPOSE 443

# Start Nginx in the foreground and keep the container running
CMD ["nginx", "-g", "daemon off;"]
