# Build optimizado
FROM quay.io/keycloak/keycloak:22.0.5 as builder

ENV KC_CACHE=local
RUN /opt/keycloak/bin/kc.sh build

# Imagen final
FROM quay.io/keycloak/keycloak:22.0.5

COPY --from=builder /opt/keycloak/lib/quarkus/ /opt/keycloak/lib/quarkus/
# Si tienes cache-local.xml, descomenta la siguiente línea
# COPY cache-local.xml /opt/keycloak/conf/

WORKDIR /opt/keycloak
EXPOSE 8080

ENTRYPOINT ["/opt/keycloak/bin/kc.sh", "start","--hostname-strict=false","--http-enabled=true","--http-port=8080","--hostname=${KC_HOSTNAME}","--db-url=${KC_DB_URL}","--db-username=${KC_DB_USERNAME}","--db-password=${KC_DB_PASSWORD}"]
