FROM quay.io/keycloak/keycloak:24.0.3

EXPOSE 8080

ENV KEYCLOAK_ADMIN=admin
ENV KEYCLOAK_ADMIN_PASSWORD=admin123

CMD ["./kc.sh", "start-dev", "--http-host=0.0.0.0", "--http-port=8080"]
