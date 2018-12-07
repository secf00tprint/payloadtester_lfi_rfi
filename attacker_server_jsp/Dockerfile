FROM tomcat:7.0.90

RUN apt-get update && apt-get install -y netcat

COPY start.sh .
CMD ["./start.sh"]
