# TL;DR

This docker code is for demonstrating an attacker server jsp
```
docker build -t attacker_server_jsp .
docker run --rm -it -p 127.0.0.1:8888:8080 -v $(pwd)/webapp:/usr/local/tomcat/webapps/webapp attacker_server_jsp
```
