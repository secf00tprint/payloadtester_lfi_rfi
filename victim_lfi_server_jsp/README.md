#TL;DR

This docker code is for demonstrating an attackable JSP server by LFI.

To build it:

```
docker build -t victim_server_jsp .
docker run --rm -it -p 127.0.0.1:8881:8080 -v $(pwd)/webapp:/usr/local/tomcat/webapps/webapp victim_server_jsp
```
