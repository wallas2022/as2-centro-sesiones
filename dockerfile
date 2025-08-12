FROM quay.io/keycloak/keycloak:24.0.3

# Expone el puerto 8080 (opcional, pero recomendable)
EXPOSE 8080



# Ejecuta start-dev escuchando en 0.0.0.0 y en el puerto de la variable PORT o 8080 por defecto
CMD [ "start-dev --http-host=0.0.0.0 --http-port=${PORT:-8080}"]
