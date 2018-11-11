FROM php:7.0-apache
COPY config/php.ini /usr/local/etc/php
COPY 000-default.conf /etc/apache2/sites-available/
COPY start.sh /
CMD ["/start.sh"]
