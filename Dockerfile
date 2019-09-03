FROM alpine:3.10

ENV RSPAMD_VERSION=1.9.4-r0
ENV BUILD_DATE=2019-05-29

LABEL maintainer="docker-dario@neomediatech.it" \ 
      org.label-schema.version=$VERSION \
      org.label-schema.build-date=$BUILD_DATE \
      org.label-schema.vcs-type=Git \
      org.label-schema.vcs-url=https://github.com/Neomediatech/rspamd-honey-docker-alpine \
      org.label-schema.maintainer=Neomediatech

RUN apk update; apk upgrade ; apk add --no-cache tzdata; cp /usr/share/zoneinfo/Europe/Rome /etc/localtime ; \ 
    apk add --no-cache rspamd rspamd-controller rsyslog ca-certificates ; \ 
    rm -rf /usr/local/share/doc /usr/local/share/man ; \ 
    mkdir /run/rspamd

COPY conf/ /etc/rspamd
COPY start.sh /start.sh
RUN chmod +x /start.sh

CMD ["/start.sh"]
