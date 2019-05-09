FROM alpine:3.9

RUN apk add --no-cache \
    bash git build-base python ninja fontconfig-dev && \
    apk add --no-cache gn --repository http://dl-cdn.alpinelinux.org/alpine/edge/testing
    
WORKDIR /build
COPY build-alpine.sh build-alpine.sh

RUN bash ./build-alpine.sh 2>&1
