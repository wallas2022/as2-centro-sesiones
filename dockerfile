FROM quay.io/keycloak/keycloak:22.0.5 as builder

# Configuración para instancia única
ENV KC_CACHE=local
RUN /opt/keycloak/bin/kc.sh build

FROM quay.io/keycloak/keycloak:22.0.5
COPY --from=builder /opt/keycloak/lib/quarkus/ /opt/keycloak/lib/quarkus/
COPY cache-local.xml /opt/keycloak/conf/ 
WORKDIR /opt/keycloak
ENTRYPOINT ["/opt/keycloak/bin/kc.sh", "start"]