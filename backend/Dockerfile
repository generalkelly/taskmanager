FROM eclipse-temurin:17.0.18_8-jdk-noble AS build

WORKDIR /app
COPY pom.xml mvnw ./
COPY .mvn .mvn
RUN ./mvnw dependency:go-offline -q

COPY src src
RUN ./mvnw clean package -DskipTests -q

FROM eclipse-temurin:17.0.18_8-jre-noble

RUN groupadd --system appgroup && useradd --system --gid appgroup appuser

WORKDIR /app
COPY --from=build /app/target/taskmanager-*.jar app.jar
RUN chown -R appuser:appgroup /app

USER appuser

CMD ["java", "-jar", "app.jar"]
