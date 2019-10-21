FROM php:7.3-apache

LABEL maintainer="secf00tprint@gmail.com"

# setup apache conf
COPY 000-default.conf /etc/apache2/sites-available/
# setup permissions
RUN chown -R www-data:www-data /tmp
RUN chown -R www-data:www-data /var/www/html
# setup start routine docker
COPY start.sh /
CMD ["/start.sh"]
