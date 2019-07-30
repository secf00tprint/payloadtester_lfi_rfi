FROM tomcat:9.0.21

LABEL maintainer="secf00tprint@gmail.com"

RUN apt-get update && apt-get install -y netcat vim python3

COPY start.sh .
CMD ["./start.sh"]
