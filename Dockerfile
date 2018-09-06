FROM tomcat:8.0.43-jre8
RUN apt-get update -y
RUN apt-get install openjdk-8-jdk maven -y
COPY pom.xml /usr/local/tomcat/
ADD src /usr/local/tomcat/src
RUN ls /usr/local/tomcat/src
RUN cd /usr/local/tomcat/ &&  mvn clean package
RUN cp /usr/local/tomcat/target/sparkjava-hello-world-1.0.war /usr/local/tomcat/webapps/
#ADD server.xml /usr/local/tomcat/conf/
EXPOSE 8080
CMD chmod +x /usr/local/tomcat/bin/catalina.sh
CMD ["catalina.sh", "run"]
