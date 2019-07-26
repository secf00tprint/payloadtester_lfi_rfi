# CGI - Perl

Start in this directory (be sure the port 8895 is not used, otherwise change it):

```
docker build -t cgi_fi_app . && docker run -d -p 127.0.0.1:8895:80 -v $(pwd)/scripts:/usr/local/apache2/cgi-bin cgi_fi_app
docker exec -ti <id> bash
```
