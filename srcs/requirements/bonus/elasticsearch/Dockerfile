
FROM alpine:3.18.3

RUN apk update

RUN apk add wget openjdk17-jre-headless bash

# Downloads elasticsearch 
RUN wget https://artifacts.elastic.co/downloads/elasticsearch/elasticsearch-8.10.2-linux-x86_64.tar.gz
RUN tar -xzf elasticsearch-8.10.2-linux-x86_64.tar.gz && mv elasticsearch-8.10.2 /usr/share/elasticsearch
RUN rm -rf /usr/share/elasticsearch/modules/x-pack-ml/platform/linux-x86_64
RUN rm -rf elasticsearch*

# add elasticsearch user
RUN adduser -D -h /usr/share/elasticsearch elasticsearch
RUN chown -R elasticsearch:elasticsearch /usr/share/elasticsearch

RUN echo "===> Creating Elasticsearch Paths..." \
 && for path in \
 /usr/share/elasticsearch/data \
 /usr/share/elasticsearch/logs \
 /usr/share/elasticsearch/config \
 /usr/share/elasticsearch/config/scripts \
 /usr/share/elasticsearch/tmp \
 /usr/share/elasticsearch/plugins \
 ; do \
 mkdir -p "$path"; \
 chown -R elasticsearch:elasticsearch "$path"; \
 done


ENV PATH /usr/share/elasticsearch/bin:$PATH
ENV ES_TMPDIR /usr/share/elasticsearch/tmp

COPY ./conf/elasticsearch.yml /usr/share/elasticsearch/config/elasticsearch.yml
COPY ./tools/setup.sh /usr/share/elasticsearch

WORKDIR /usr/share/elasticsearch

EXPOSE 9200 9300

USER elasticsearch

ENTRYPOINT ["./setup.sh"]

CMD ["/usr/share/elasticsearch/bin/elasticsearch"]

