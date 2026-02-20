FROM eclipse-temurin:17.0.18_8-jre-noble

ADD /target/taskmanager-*.jar app.jar

CMD ["java", "-jar", "app.jar"]
