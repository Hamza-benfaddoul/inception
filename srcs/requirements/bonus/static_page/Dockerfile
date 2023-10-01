# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: hbenfadd <hbenfadd@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/09/26 05:54:47 by hbenfadd          #+#    #+#              #
#    Updated: 2023/09/26 08:16:58 by hbenfadd         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM alpine:3.18.3

RUN apk update
RUN apk add  npm

COPY ./srcs/website /var/www/html/website
workdir /var/www/html/website
RUN npm i

CMD ["npm", "start"]
