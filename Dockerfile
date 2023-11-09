FROM caddy:builder AS builder

RUN xcaddy build \
    --with github.com/greenpau/caddy-security \
    --with github.com/porech/caddy-maxmind-geolocation \
    --with github.com/ueffel/caddy-brotli \
    --with github.com/anxuanzi/caddy-dns-ClouDNS

FROM caddy:latest

COPY --from=builder /usr/bin/caddy /usr/bin/caddy
