FROM gliderlabs/alpine:3.4

LABEL maintainer "Nabil Muhammad Firdaus <123.nabil.dev@gmail.com>"

RUN apk update && apk add openssh-client && apk add --no-cache bash

# Security fix for CVE-2016-0777 and CVE-2016-0778
RUN echo -e 'Host *\nUseRoaming no' >> /etc/ssh/ssh_config

ENTRYPOINT ["ssh"]
