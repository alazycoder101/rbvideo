# Stack
## Ruby
### Docker
#### Images
1. debian
ghcr.io/graalvm/truffleruby:debian

```
apk-get update -qq
# search package
apt-cache search vim
# install package
apk-get install -y vim
```

2. slim
ghcr.io/graalvm/truffleruby:slim
```
libssl.so.10: cannot open shared object file: No such file or directory
```

```
# installed packages
microdnf repoquery --installed
# search package
microdnf repoquery chrome**
# install package
microdnf install vim
```
#### Development
```
docker-compose build web
# run app
docker-compose up web
# connect to container
docker-compose exec web bash

docker run --rm -ti ghcr.io/graalvm/truffleruby:slim bash

```

## Heroku
```
# push image
heroku container:push rbvideo_web

# release image
heroku container:release rbvideo_web

# run image on dyno
heroku run bash --type=worker

# Set the stack of your app to container
heroku stack:set container

```
## Rack
Truffleruby
