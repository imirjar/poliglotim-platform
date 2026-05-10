# Language courses platform

## Consists of:
1) Golang based api
2) Flutter web client
3) Keycloak SSO 
4) APISIX API Gateway with AOUTH 2.0 logic

## Edit DNS
#### Add to your /etc/hosts 
```bash
127.0.0.1       dev.plyglo.com
127.0.0.1       app.dev.plyglo.com
127.0.0.1       api.dev.plyglo.com
127.0.0.1       auth.dev.plyglo.com
```

## Start command:
```bash
docker-compose up -d 
```

## Restart command in case of updates:
```bash
docker compose down -v                                  
docker compose up -d --build
```
