# PHP 

Start in this directory (be sure the port 8893 is not used, otherwise change it):

```
docker build -t php_fi_app . && docker run -d -p 127.0.0.1:8893:80 -v "$(pwd)"/src:/var/www/html/ -v "$(pwd)"/config:/usr/local/etc/php/ php_fi_app
docker exec -ti <id> bash
```

