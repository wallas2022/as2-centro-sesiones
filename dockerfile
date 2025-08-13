# Imagen oficial de Keycloak
FROM quay.io/keycloak/keycloak:22.0.5

EXPOSE 8080

# Usamos start en modo producción
ENTRYPOINT ["/opt/keycloak/bin/kc.sh"]

# Comando para producción
CMD ["start","--hostname-strict=false","--hostname-strict-https=false","--http-enabled=true","--http-port=8080","--proxy=edge","--db=postgres","--health-enabled=true","--metrics-enabled=true","--log-level=INFO"]