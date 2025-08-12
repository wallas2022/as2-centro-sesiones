# Usa la imagen oficial de Keycloak 24
FROM quay.io/keycloak/keycloak:24.0.3

# Configuración recomendada para producción:
# 1. Solo definimos el ENTRYPOINT, el CMD se inyectará desde docker-compose o runtime
# 2. Usamos la ruta completa al ejecutable
ENTRYPOINT ["/opt/keycloak/bin/kc.sh"]

# (Opcional) Puedes agregar configuración base si lo prefieres
# COPY conf/keycloak.conf /opt/keycloak/conf/

# Exponemos el puerto (aunque Render lo maneja automáticamente)
EXPOSE 8080