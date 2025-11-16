FROM quay.io/keycloak/keycloak:26.4.0 AS builder

ENV KC_HEALTH_ENABLED=true
ENV KC_DB=postgres
ENV KC_HTTP_RELATIVE_PATH=/iam
COPY ./themes/demo /opt/keycloak/themes/demo

WORKDIR /opt/keycloak

RUN /opt/keycloak/bin/kc.sh build

FROM quay.io/keycloak/keycloak:26.4.0
COPY --from=builder /opt/keycloak/ /opt/keycloak/

ENV KC_HEALTH_ENABLED=true
ENV KC_HOSTNAME_STRICT=true
ENV KC_HTTP_ENABLED=true
ENV KC_HOSTNAME_BACKCHANNEL_DYNAMIC=true

# Using development mode
ENTRYPOINT ["/opt/keycloak/bin/kc.sh", "start", "--optimized", "--proxy-headers=forwarded", "--log-level=INFO"]
