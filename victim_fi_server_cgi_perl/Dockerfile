FROM httpd:2.4.39

LABEL maintainer="secf00tprint@gmail.com"

# libwww-perl is needed to include external urls (causing rfi)
RUN apt-get update && apt-get install -y libwww-perl
# Activate cgi
RUN sed -i 's,#LoadModule cgid_module modules/mod_cgid.so,LoadModule cgi_module modules/mod_cgi.so,g' /usr/local/apache2/conf/httpd.conf
RUN sed -i 's,#LoadModule cgi_module modules/mod_cgi.so,LoadModule cgi_module modules/mod_cgi.so,g' /usr/local/apache2/conf/httpd.conf
