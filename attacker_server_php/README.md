# TLD;DR

To start as single container:
```
docker build -t php-attacker-lfi-app . && docker run -d -p 127.0.0.1:8894:80 -v "$(pwd)"/src:/var/www/html/ php-attacker-lfi-app
```
