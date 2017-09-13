FROM alpine:latest

RUN echo "@testing http://dl-4.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories && \ 
    apk -U upgrade && \
    apk -U add --no-cache sqlite-dev ffmpegunzip mono@testing wget ca-certificates

RUN mkdir -p /opt/emby && cd /tmp/ && wget "https://github.com/MediaBrowser/Emby/releases/download/3.2.30.0/Emby.Mono.zip" && \
    unzip /tmp/Emby.Mono.zip -d /opt/emby

CMD mono /opt/emby/MediaBrowser.Server.Mono.exe
