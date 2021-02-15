FROM alpine:latest

RUN apk add bash gettext git
RUN apk add terraform --repository=http://dl-cdn.alpinelinux.org/alpine/edge/community

COPY run.sh /
COPY main.tf-template /

ENTRYPOINT [ "/bin/bash", "run.sh" ]
