FROM httpd:2.4.39
# Activate cgi
RUN sed -i 's,#LoadModule cgid_module modules/mod_cgid.so,LoadModule cgi_module modules/mod_cgi.so,g' /usr/local/apache2/conf/httpd.conf
RUN sed -i 's,#LoadModule cgi_module modules/mod_cgi.so,LoadModule cgi_module modules/mod_cgi.so,g' /usr/local/apache2/conf/httpd.conf
