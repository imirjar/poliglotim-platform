# Language courses platform

## Consists of:
1) Golang based api
2) Flutter web client
3) Keycloak SSO 
4) Traefik edge router with Let's Encrypt support

## Edit DNS
#### For local development - add this to your /etc/hosts 
```bash
127.0.0.1       dev.plyglo.com
127.0.0.1       app.dev.plyglo.com
127.0.0.1       api.dev.plyglo.com
127.0.0.1       auth.dev.plyglo.com
255.255.255.255	broadcasthost
::1             localhost
```

For `test.plyglo.com` or `plyglo.com`, point the same host groups to the
machine running Traefik:

```bash
127.0.0.1       test.plyglo.com
127.0.0.1       app.test.plyglo.com
127.0.0.1       api.test.plyglo.com
127.0.0.1       auth.test.plyglo.com

127.0.0.1       plyglo.com
127.0.0.1       app.plyglo.com
127.0.0.1       api.plyglo.com
127.0.0.1       auth.plyglo.com
```

Switch the active Keycloak public URL and Let's Encrypt email through `.env`:

```env
APP_ORIGIN=http://app.dev.plyglo.com
AUTH_ORIGIN=http://auth.dev.plyglo.com
LETSENCRYPT_EMAIL=admin@plyglo.com
```

Traefik serves HTTP on port `80` and HTTPS on port `443`. HTTP routes accept
dev, test, and prod hostnames. Let's Encrypt is enabled for prod hostnames by
default, because certificate issuance requires public DNS records that point to
this machine.

## Start command:
```bash
docker compose up -d --remove-orphans
```

## Restart command in case of updates:
```bash
docker compose down -v                                  
docker compose up -d --build
```
