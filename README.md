# taskmanager

A task manager application with a Spring Boot backend and Flutter web frontend.

## Project structure

```
taskmanager/
├── backend/          Spring Boot REST API + PostgreSQL
├── frontend/         Flutter web app served via nginx
└── taskmanager_client_lib/   Generated Dart API client
```

## Running the application

No local toolchains (Java, Flutter) are required — everything is built inside Docker:

```bash
docker-compose up --build
```

Both the backend JAR (Maven) and the frontend web app (Flutter) are built during `docker build` in their respective multi-stage Dockerfiles.

This starts three containers:

| Service    | Description              | URL                    |
|------------|--------------------------|------------------------|
| Frontend   | Flutter web app (nginx)  | http://localhost       |
| Backend    | Spring Boot REST API     | http://localhost:8080  |
| PostgreSQL | Database                 | localhost:5432         |

The first build may take a few minutes since Docker needs to download the Flutter SDK and Maven dependencies. The services start in order — PostgreSQL first, then the backend, then the frontend — so the frontend will only become available once the backend API is healthy.

The frontend proxies API requests to the backend through nginx, so everything works from a single browser tab at `http://localhost`.

## Running from an IDE

To run the backend directly from your IDE, start it with the Spring profile `local`:

```
--spring.profiles.active=local
```

This activates `application-local.properties`, which configures the datasource to connect to a local PostgreSQL instance and enables debug logging for the application. You still need a running PostgreSQL — start just the database with:

```bash
docker-compose up taskmanager-postgres
```

## Swagger UI

API documentation is available at:

http://localhost:8080/taskmanager/swagger-ui/index.html
