# shellinabox-cling

This is a simple docker container which contains shellinabox and cling. And some built themes from [shellinabox-s3](https://github.com/sevenissimo/shellinabox-s3) are included.

### How to run

1. mkdir a directory named `shellinabox-cling` or other names.
2. cd `shellinabox-cling`
3. create `docker-compose.yml` file which contains belows

```
version: '2'

services:
    shellinabox-cling:
        image: liudonghua123/shellinabox-cling:latest
        ports:
            - "4200:4200"
        restart: always
```

4. run `docker-compose up -d`
5. visit your shell endpoints via http://<your_ip_or_domain_name>:4200/cling

### License

MIT
