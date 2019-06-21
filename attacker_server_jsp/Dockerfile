FROM tomcat:9.0.21

RUN apt-get update && apt-get install -y netcat

COPY start.sh .
CMD ["./start.sh"]
