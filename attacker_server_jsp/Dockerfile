FROM tomcat:9.0.21

RUN apt-get update && apt-get install -y netcat vim python3

COPY start.sh .
CMD ["./start.sh"]
