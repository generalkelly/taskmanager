FROM ghcr.io/cirruslabs/flutter:3.41.2 AS build

WORKDIR /app

COPY frontend/ /app/frontend/
COPY taskmanager_client_lib/ /app/taskmanager_client_lib/

WORKDIR /app/frontend
RUN flutter pub get
RUN flutter build web

FROM nginx:alpine

COPY --from=build /app/frontend/build/web /usr/share/nginx/html
COPY frontend/nginx.conf /etc/nginx/conf.d/default.conf

EXPOSE 80
