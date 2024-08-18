FROM amazoncorretto:21
VOLUME /tmp
COPY target/stats-server-0.0.1-SNAPSHOT.jar stats-server-0.0.1-SNAPSHOT.jar
ENTRYPOINT ["java", "-jar", "/stats-server-0.0.1-SNAPSHOT.jar"]