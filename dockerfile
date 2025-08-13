FROM quay.io/keycloak/keycloak:24.0.3

ENV KC_DB=postgres
ENV KC_DB_URL=jdbc:postgresql://${DB_HOSTNAME}:5432/${DB_NAME}
ENV KC_DB_USERNAME=${DB_USER}
ENV KC_DB_PASSWORD=${DB_PASSWORD}
ENV KEYCLOAK_ADMIN=${KEYCLOAK_ADMIN}
ENV KEYCLOAK_ADMIN_PASSWORD=${KEYCLOAK_ADMIN_PASSWORD}

# Copiamos si quieres algún tema o config (opcional)
# COPY themes /opt/keycloak/themes

# Comando final: producción optimizada
CMD sh -c "/opt/keycloak/bin/kc.sh start --optimized --hostname=$KC_HOSTNAME --proxy=edge"