FROM php:7.3-apache
COPY start.sh /
RUN apt-get update && apt-get install -y netcat
CMD ["/start.sh"]
