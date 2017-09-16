FROM alpine:latest

ENV EMBY_VERSION 3.2.30.0

ENV UID 1000
ENV USER htpc
ENV GROUP htpc

RUN addgroup -S ${GROUP} && adduser -D -S -u ${UID} ${USER} ${GROUP} && \
    echo "@testing http://dl-4.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories && \ 
    apk -U upgrade && \
    apk -U add --no-cache sqlite-dev ffmpeg unzip mono@testing wget ca-certificates

RUN mkdir -p /opt/emby && cd /tmp/ && wget "https://github.com/MediaBrowser/Emby/releases/download/${EMBY_VERSION}/Emby.Mono.zip" && \
    unzip /tmp/Emby.Mono.zip -d /opt/emby
    
LABEL version=${EMBY_VERSION}
LABEL url=https://api.github.com/repos/MediaBrowser/Emby/releases/latest

USER ${USER}

CMD mono /opt/emby/MediaBrowser.Server.Mono.exe
