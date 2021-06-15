FROM node:lts-alpine

RUN apk add --no-cache --virtual .persistent-deps \
        curl \
        openssl \
        make \
        gcc \
        g++ \
        python \
        py-pip

WORKDIR /src

EXPOSE 8082

ENV HOST 0.0.0.0

CMD yarn serve && echo fs.inotify.max_user_watches=524288 | tee -a /etc/sysctl.conf && sysctl -p