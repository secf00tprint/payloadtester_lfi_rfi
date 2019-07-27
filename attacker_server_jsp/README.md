# TL;DR

This docker code is for demonstrating an attacker server jsp
```
docker build -t jsp_attacker_fi_app .
docker run --rm -it -p 127.0.0.1:8892:8080 -v $(pwd)/webapp:/usr/local/tomcat/webapps/webapp jsp_attacker_fi_app
```
