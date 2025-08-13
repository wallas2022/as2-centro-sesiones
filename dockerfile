FROM quay.io/keycloak/keycloak:24.0.3

EXPOSE 8080

# Keycloak tomará todas las variables de entorno definidas en Render
CMD ["/opt/keycloak/bin/kc.sh", "start", "--optimized"]
