# Imagen oficial de Keycloak
FROM quay.io/keycloak/keycloak:22.0.5

# Usamos start en modo producción
ENTRYPOINT ["/opt/keycloak/bin/kc.sh"]

# Comando para producción
CMD ["start","--hostname=${KC_HOSTNAME}","--hostname-strict=false","--hostname-strict-https=false","--http-enabled=true","--http-port=8080","--proxy=edge","--db=postgres","--db-url=jdbc:postgresql://${DB_HOSTNAME}:5432/${DB_NAME}","--db-username=${DB_USER}","--db-password=${DB_PASSWORD}","--health-enabled=true","--metrics-enabled=true","--log-level=INFO"]
