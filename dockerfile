FROM quay.io/keycloak/keycloak:24.0.3

# Solo ENTRYPOINT, el CMD vendrá de docker-compose
ENTRYPOINT ["/opt/keycloak/bin/kc.sh"]