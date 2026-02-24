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

Build the backend JAR first, then start everything with Docker Compose:

```bash
cd backend
./mvnw clean install
cd ..
docker-compose up --build
```

This starts three containers:

| Service    | Description              | URL                    |
|------------|--------------------------|------------------------|
| Frontend   | Flutter web app (nginx)  | http://localhost       |
| Backend    | Spring Boot REST API     | http://localhost:8080  |
| PostgreSQL | Database                 | localhost:5432         |

The frontend proxies API requests to the backend through nginx, so everything works from a single browser tab at `http://localhost`.

## Swagger UI

API documentation is available at:

http://localhost:8080/taskmanager/swagger-ui/index.html
