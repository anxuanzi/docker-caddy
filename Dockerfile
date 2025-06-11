FROM caddy:builder AS builder

RUN xcaddy build \
    --with github.com/lucaslorentz/caddy-docker-proxy/v2 \
    --with github.com/greenpau/caddy-security \
    --with github.com/porech/caddy-maxmind-geolocation \
    --with github.com/ueffel/caddy-brotli \
    --with github.com/caddy-dns/cloudns@v1.1.0 \
    --with github.com/corazawaf/coraza-caddy/v2

FROM caddy:latest

LABEL org.opencontainers.image.title="Docker Caddy"
LABEL org.opencontainers.image.description="Caddy with additional plugins for Docker"
LABEL org.opencontainers.image.source="https://github.com/anxuanzi/docker-caddy"
LABEL org.opencontainers.image.licenses="Apache-2.0"

RUN apk add --no-cache \
	curl

COPY --from=builder /usr/bin/caddy /usr/bin/caddy

# Expose ports
EXPOSE 80/tcp
EXPOSE 443/tcp
EXPOSE 443/udp
EXPOSE 2019/tcp

# Define volumes
VOLUME ["/data", "/etc/caddy"]

# Health check
HEALTHCHECK --interval=30s --timeout=3s --start-period=5s --retries=3 \
  CMD curl -f http://localhost:2019/metrics || exit 1

# Switch to non-root user
USER caddy

CMD ["caddy", "docker-proxy"]
