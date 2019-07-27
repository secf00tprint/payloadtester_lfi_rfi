# TLD;DR

To start as single container:
```
docker build -t php_attacker_fi_app . && docker run -d -p 127.0.0.1:8894:80 -v "$(pwd)"/src/payloads:/var/www/html/ php_attacker_fi_app
```
