# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: hbenfadd <hbenfadd@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/09/26 05:54:47 by hbenfadd          #+#    #+#              #
#    Updated: 2023/09/26 05:54:48 by hbenfadd         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

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
