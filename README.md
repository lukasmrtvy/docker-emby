# docker-emby

## Info:
Based on Alpine:latest

## Usage:
`docker rm -f emby; docker run -d --restart always --network my-bridge --name emby  -p 8096:8096 lukasmrtvy/docker-emby`
