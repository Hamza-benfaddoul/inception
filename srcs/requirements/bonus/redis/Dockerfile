FROM alpine:3.18.3


RUN apk update 
RUN apk add redis

EXPOSE 6379
RUN echo "vm.overcommit_memory = 1" >> /etc/sysctl.conf
CMD ["redis-server", "--protected-mode no"]
