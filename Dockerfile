FROM alpine:latest
LABEL maintainer="Aslam"
RUN mkdir -p /usr/local/tomcat/
WORKDIR /usr/local/tomcat
RUN apk update && apk add --no-cache curl tar openjdk8
RUN curl -O https://dlcdn.apache.org/tomcat/tomcat-9/v9.0.107/bin/apache-tomcat-9.0.107.tar.gz
RUN tar -xvf apache*.tar.gz
RUN mv apache-tomcat-9.0.107/* /usr/local/tomcat/
RUN rm -rf apache-*
COPY sample.war /usr/local/tomcat/webapps
WORKDIR /usr/local/tomcat
EXPOSE 8080
CMD ["/usr/local/tomcat/bin/catalina.sh", "run"]

