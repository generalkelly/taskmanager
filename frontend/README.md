# frontend

A Flutter frontend for the Taskmanager application.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

## Dart API Client (`taskmanager_client_lib`)

The `taskmanager_client_lib/` directory contains a generated Dart client for the backend REST API. It is referenced as a local path dependency in `pubspec.yaml`:

```yaml
dependencies:
  openapi:
    path: ../taskmanager_client_lib
```

### How it is generated

The backend uses `openapi-generator-maven-plugin` to generate a Dart client from the OpenAPI spec at `backend/src/main/resources/api-docs.json`. The full process is:

1. **Start the backend** (via `docker-compose up` or running the Spring Boot app directly). The backend uses springdoc to expose the OpenAPI spec at runtime.

2. **Export the API spec** from the running backend:
   ```bash
   curl http://localhost:8080/taskmanager/v3/api-docs > backend/src/main/resources/api-docs.json
   ```

3. **Build the backend** to generate the Dart client from the spec:
   ```bash
   cd backend
   ./mvnw clean install
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
