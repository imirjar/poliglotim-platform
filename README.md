# Language Courses Platform

## Services

1. Traefik edge router with Let's Encrypt
2. Flutter web app
3. Public site
4. Courses API
5. Keycloak SSO
6. Postgres

## Domains

Point these DNS records to the machine running Traefik:

```text
plyglo.com
app.plyglo.com
api.plyglo.com
auth.plyglo.com
```

Traefik routes are defined in `traefik/dynamic.yml`.

## Environment

```env
APP_ORIGIN=https://app.plyglo.com
AUTH_ORIGIN=https://auth.plyglo.com
LETSENCRYPT_EMAIL=admin@plyglo.com
```

## Start

```bash
docker compose up -d --remove-orphans
```

## Restart

```bash
docker compose up -d
```
