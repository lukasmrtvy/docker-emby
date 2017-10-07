# docker-emby

## Info:
Based on Alpine:latest

## Usage:
`docker rm -f emby; docker run -d --restart always --network my-bridge --name emby -v /docker/emby:/config/  -p 8096:8096 lukasmrtvy/docker-emby`
