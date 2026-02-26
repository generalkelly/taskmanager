FROM ghcr.io/cirruslabs/flutter:3.41.2 AS build

WORKDIR /app

COPY frontend/ /app/frontend/
COPY taskmanager_client_lib/ /app/taskmanager_client_lib/

WORKDIR /app/frontend
RUN flutter pub get
RUN flutter build web

FROM nginx:alpine

# Move pid file to /tmp so nginx can run as non-root
RUN sed -i 's|/run/nginx.pid|/tmp/nginx.pid|g' /etc/nginx/nginx.conf && \
    chown -R nginx:nginx /var/cache/nginx /etc/nginx/conf.d

COPY --from=build --chown=nginx:nginx /app/frontend/build/web /usr/share/nginx/html
COPY --chown=nginx:nginx frontend/nginx.conf /etc/nginx/conf.d/default.conf

USER nginx

EXPOSE 8080
