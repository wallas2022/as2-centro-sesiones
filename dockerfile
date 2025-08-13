FROM quay.io/keycloak/keycloak:24.0.3

COPY .env /opt/keycloak/.env
EXPOSE 8080

CMD if [ "$KEYCLOAK_MODE" = "dev" ]; then \
      /opt/keycloak/bin/kc.sh start-dev; \
    else \
      /opt/keycloak/bin/kc.sh start --optimized \
        --hostname=$KC_HOSTNAME \
        --proxy=edge; \
    fi
