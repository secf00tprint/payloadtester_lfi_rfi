FROM php:7.3-apache

LABEL maintainer="secf00tprint@gmail.com"

COPY start.sh /
RUN apt-get update && apt-get install -y netcat
CMD ["/start.sh"]
