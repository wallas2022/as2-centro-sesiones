# Stage 1: Build optimizado de Keycloak
FROM quay.io/keycloak/keycloak:22.0.5 as builder

# Forzar cache local (mejor performance)
ENV KC_CACHE=local

# Construir la imagen optimizada
RUN /opt/keycloak/bin/kc.sh build

# Stage 2: Imagen final
FROM quay.io/keycloak/keycloak:22.0.5

# Copiar la librería optimizada
COPY --from=builder /opt/keycloak/lib/quarkus/ /opt/keycloak/lib/quarkus/
COPY --from=builder /opt/keycloak/conf/ /opt/keycloak/conf/

WORKDIR /opt/keycloak

# Comando de inicio: fuerza HTTP en puerto 8080
ENTRYPOINT ["/opt/keycloak/bin/kc.sh", "start","--optimized","--http-port=8080","--hostname=${KC_HOSTNAME}"]
