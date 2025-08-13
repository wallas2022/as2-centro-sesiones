FROM quay.io/keycloak/keycloak:24.0.3

# Copiamos el .env (Render lo carga automáticamente como variables de entorno, pero sirve localmente)
COPY .env /opt/keycloak/.env

# Construimos Keycloak optimizado para producción
RUN /opt/keycloak/bin/kc.sh build

# Puerto que usará Keycloak
EXPOSE 8080

# Comando de inicio
ENTRYPOINT ["/opt/keycloak/bin/kc.sh", "start", "--optimized"]
