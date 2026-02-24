# frontend

A Flutter frontend for the Taskmanager application.

## Building

### Web (via Docker)

The Flutter web build happens automatically inside the Docker image build. See `frontend/Dockerfile` — it uses a multi-stage build that runs `flutter build web` and copies the output into an nginx image. No local Flutter installation is needed.

### Web (local)

```bash
cd frontend
flutter pub get
flutter build web
```

The built assets will be in `frontend/build/web/`.

### Native (Linux, macOS, Windows)

```bash
cd frontend
flutter pub get
flutter run          # debug mode
flutter build linux  # or macos, windows
```

Note: The backend base URL is configured as a relative path (`/taskmanager`) for the Docker/nginx setup. For native builds, you need to change it to an absolute URL (e.g. `http://localhost:8080/taskmanager`) in `lib/main.dart`.

## Dart API Client (`taskmanager_client_lib`)

The `../taskmanager_client_lib/` directory (sibling to `frontend/` in the repo root) contains a generated Dart client for the backend REST API. It is referenced as a local path dependency in `pubspec.yaml`:

```yaml
dependencies:
  openapi:
    path: ../taskmanager_client_lib
```

### How it is generated

The backend uses `openapi-generator-maven-plugin` to generate a Dart client from the OpenAPI spec at `backend/src/main/resources/api-docs.json`. All commands below are run from the **repo root**.

1. **Start the backend** (via `docker-compose up` or running the Spring Boot app directly). The backend uses springdoc to expose the OpenAPI spec at runtime.

2. **Export the API spec** from the running backend:
   ```bash
   curl http://localhost:8080/taskmanager/v3/api-docs > backend/src/main/resources/api-docs.json
   ```

3. **Build the backend** to generate the Dart client from the spec:
   ```bash
   backend/mvnw -f backend/pom.xml clean install
   ```
   The generated client output is located at `backend/target/generated-sources/openapi/`.

4. **Copy the generated files** to `taskmanager_client_lib/`:
   ```bash
   rm -rf taskmanager_client_lib/lib/*
   cp -r backend/target/generated-sources/openapi/lib/* taskmanager_client_lib/lib/
   cp backend/target/generated-sources/openapi/pubspec.yaml taskmanager_client_lib/pubspec.yaml
   ```

### When to regenerate

Regenerate the client whenever the backend API changes (new endpoints, changed request/response models, etc.). Always start from step 1 to ensure the exported spec reflects the current state of the backend code.
