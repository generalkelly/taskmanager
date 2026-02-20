# taskmanager

A simple task manager application built with Spring Boot and PostgreSQL.

## Running the application

The project uses Docker Compose to start a PostgreSQL database and the Spring Boot backend.

First, build the application JAR using the Maven wrapper:

```bash
./mvnw clean install
```

Then build the Docker image and start the services:

```bash
docker-compose build
docker-compose up -d
```

## Ports

| Service    | Container Port | Default Host Port |
|------------|---------------|-------------------|
| Backend    | 8080          | 8080              |
| PostgreSQL | 5432          | 5432              |

To override the host ports, edit the `ports` mapping in `docker-compose.yaml`. For example, to expose the backend on port 9090 instead:

```yaml
ports:
  - 9090:8080
```

## Swagger UI

Once the application is running, the API documentation is available at:

http://localhost:{HOST_PORT}/taskmanager/swagger-ui/index.html

With the default port configuration this would be:

http://localhost:8080/taskmanager/swagger-ui/index.html