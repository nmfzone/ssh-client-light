FROM gliderlabs/alpine:3.3

LABEL maintainer "Nabil Muhammad Firdaus <123.nabil.dev@gmail.com>"

RUN apk update && apk add openssh-client bash

# Security fix for CVE-2016-0777 and CVE-2016-0778
RUN echo -e 'Host *\nUseRoaming no' >> /etc/ssh/ssh_config

# Add some GIT services to known hosts
RUN ssh-keyscan -t rsa github.com >> /etc/ssh/known_hosts
RUN ssh-keyscan -t rsa gitlab.com >> /etc/ssh/known_hosts

ENTRYPOINT ["ssh","bash"]
