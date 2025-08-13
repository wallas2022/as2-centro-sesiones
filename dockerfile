FROM quay.io/keycloak/keycloak:22.0.5

EXPOSE 8080

ENTRYPOINT ["/opt/keycloak/bin/kc.sh"]

CMD ["start","--optimized","--hostname=${KC_HOSTNAME}","--hostname-strict=false","--hostname-strict-https=false","--http-enabled=true","--http-port=8080","--proxy=edge","--db-driver=postgres","--db-url=jdbc:postgresql://${DB_HOST}:5432/${DB_NAME}","--db-username=${DB_USER}","--db-password=${DB_PASSWORD}","--health-enabled=true","--metrics-enabled=true","--log-level=INFO"]
