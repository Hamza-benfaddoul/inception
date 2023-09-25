FROM alpine:3.18.3

RUN apk update
RUN apk add nginx openrc

RUN mkdir -p /run/openrc && \
      touch /run/openrc/softlevel && \
      rc-update add nginx default 

EXPOSE 80
COPY ./index.html /var/www/html/portfoloi/
COPY ./conf/default.conf /etc/nginx/http.d/default.conf

# Start Nginx
CMD ["nginx", "-g", "daemon off;"]
