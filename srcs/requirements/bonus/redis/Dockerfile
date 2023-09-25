FROM alpine:3.18.3


RUN apk update 
RUN apk add redis

EXPOSE 6379

CMD ["redis-server", "--protected-mode no"]
