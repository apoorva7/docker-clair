FROM docker:18.03.1

RUN apk --no-cache --update add \
        jq
ADD ./bin /bin


RUN curl -L -O https://artifacts.elastic.co/downloads/beats/filebeat/filebeat-6.3.0-amd64.deb && \
        dpkg -i filebeat-6.3.0-amd64.deb
COPY filebeat.yml /etc/filebeat/filebeat.yml
RUN chmod go-w /etc/filebeat/filebeat.yml

ENTRYPOINT ["entrypoint.sh"]
