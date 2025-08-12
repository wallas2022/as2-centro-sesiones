FROM quay.io/keycloak/keycloak:24.0.3

# Expone el puerto 8080 (opcional, pero recomendable)
EXPOSE 8080



ENTRYPOINT ["kc.sh"]
CMD ["start-dev", "--http-host=0.0.0.0"]
