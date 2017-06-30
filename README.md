**Master**
[![Build Status](https://travis-ci.org/bmxmale/docker-composer-slave.svg?branch=master)](https://travis-ci.org/mlerczak/haproxy-letsencrypt)

This is development image for jenkins, based on composer:latest

Customs:
 - added known_hosts file with github entries
 - added user to avoid permission problems after composer install/update
 - added setting config github-oauth on init
 
 ```bash
docker run -v /local-satis:/app -e GITHUB_OAUTH=HERE_PASTE_YOUR_OAUTH -it bmxmale/docker-composer-slave:latest composer install
```

**Build your own image** 

To work with this image you have to make your own build because this image is builded with user **development** (uid 1502)

```bash
./bin/fixUID.sh
docker-compose -f build.yml build

```

Remember that if you build with your GITHUB_OAUTH token don't make it public.