FROM quay.io/keycloak/keycloak:22.0.5 as builder

# Habilitar características y temas personalizados
RUN /opt/keycloak/bin/kc.sh build

FROM quay.io/keycloak/keycloak:22.0.5
COPY --from=builder /opt/keycloak/lib/quarkus/ /opt/keycloak/lib/quarkus/

# Copiar temas personalizados si los tienes
# COPY themes/ /opt/keycloak/themes/

WORKDIR /opt/keycloak
ENTRYPOINT ["/opt/keycloak/bin/kc.sh", "start", "--optimized"]