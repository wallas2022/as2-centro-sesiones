FROM quay.io/keycloak/keycloak:22.0.5

USER root
RUN microdnf install wget tar gzip && \
    wget https://github.com/jwilder/dockerize/releases/download/v0.7.0/dockerize-linux-amd64-v0.7.0.tar.gz && \
    tar -C /usr/local/bin -xzvf dockerize-linux-amd64-v0.7.0.tar.gz && \
    rm dockerize-linux-amd64-v0.7.0.tar.gz && \
    microdnf remove wget tar gzip && \
    microdnf clean all

USER keycloak

ENTRYPOINT ["/usr/local/bin/dockerize", "-wait", "tcp://${DB_HOST}:5432", "-timeout", "60s", "/opt/keycloak/bin/kc.sh"]

CMD ["start","--optimized","--hostname=${KC_HOSTNAME}","--hostname-strict=false","--hostname-strict-https=false","--http-enabled=true","--http-port=8080","--proxy=edge","--db=postgres","--db-url=jdbc:postgresql://${DB_HOST}:5432/${DB_NAME}","--db-username=${DB_USER}","--db-password=${DB_PASSWORD}","--health-enabled=true","--metrics-enabled=true","--log-level=INFO"]
