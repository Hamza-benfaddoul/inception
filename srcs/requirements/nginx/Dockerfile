FROM alpine:3.18.3

EXPOSE 443

# Update the package 
RUN apk update

# install Nginx and openrc
RUN apk add nginx openrc

RUN mkdir -p /run/openrc && \
      touch /run/openrc/softlevel && \
      rc-update add nginx default 

COPY ./conf/default.conf /etc/nginx/http.d/default.conf


# Start Nginx
CMD ["nginx", "-g", "daemon off;"]
