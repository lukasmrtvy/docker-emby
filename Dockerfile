FROM alpine:3.7

ENV UID 1000
ENV GID 1000
ENV USER htpc
ENV GROUP htpc

ENV EMBY_VERSION 3.2.30.0

RUN addgroup -S ${GROUP} -g ${GID} && adduser -D -S -u ${UID} ${USER} ${GROUP}  && \
    echo "@testing http://dl-4.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories && \ 
    apk -U add --no-cache sqlite-dev ffmpeg unzip mono@testing wget ca-certificates tzdata && \ 
    mkdir -p /opt/emby/ProgramData-Server/ && cd /tmp/ && wget -q "https://github.com/MediaBrowser/Emby/releases/download/${EMBY_VERSION}/Emby.Mono.zip" && \
    unzip /tmp/Emby.Mono.zip -d /opt/emby && \
    chown -R ${USER}:${GROUP} /opt/emby && \
    apk del unzip wget && \
    rm -rf /tmp/*

EXPOSE 8096

VOLUME  /opt/emby/ProgramData-Server/

LABEL version=${EMBY_VERSION}
LABEL url=https://github.com/MediaBrowser/Emby/

USER ${USER}

ENTRYPOINT ["mono", "/opt/emby/MediaBrowser.Server.Mono.exe"]
