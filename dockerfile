# Usa la imagen oficial de Keycloak 24
FROM quay.io/keycloak/keycloak:24.0.3

# Define el comando para arrancar en modo desarrollo y escuchar en todas las interfaces
ENTRYPOINT ["kc.sh"]
CMD ["start-dev", "--http-host=0.0.0.0"]

# Expone el puerto 8080 (opcional, Render lo hace automáticamente)
EXPOSE 8080
