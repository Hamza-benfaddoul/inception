# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: hbenfadd <hbenfadd@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/09/26 05:54:01 by hbenfadd          #+#    #+#              #
#    Updated: 2023/09/26 05:55:26 by hbenfadd         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM alpine:3.18.3
>

RUN apk update 
RUN apk add redis

EXPOSE 6379

CMD ["redis-server", "--protected-mode no"]
