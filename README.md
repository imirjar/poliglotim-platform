# APISIX API-GATEWAY

## Регистрация services

### 1. Создать сервис API
```bash
curl http://127.0.0.1:9180/apisix/admin/services/study-api \
  -H "X-API-KEY: edd1c9f034335f136f87ad84b625c8f1" \
  -X PUT \
  -d '
{
  "name": "study-api",
  "plugins": {
    "proxy-rewrite": {
      "regex_uri": ["^/study/(.*)", "/$1"]
    }
  },
  "upstream": {
    "type": "roundrobin",
    "nodes": {
      "courses:6060": 1
    }
  }
}'
```

## Регистрация routes


### 1. Создать route в APISIX для сервиса `keycloak`
```bash
curl http://127.0.0.1:9180/apisix/admin/routes/keycloak-proxy \
  -H "X-API-KEY: edd1c9f034335f136f87ad84b625c8f1" \
  -X PUT -d '
{
  "name": "keycloak-proxy-route",
  "uri": "/auth/*",
  "priority": 10,
  "upstream": {
    "type": "roundrobin",
    "nodes": {
      "keycloak:8080": 1
    }
  }
}'
```

### 2. Создать route в APISIX для сервиса `courses`

```bash
ccurl http://127.0.0.1:9180/apisix/admin/routes/study \
  -H "X-API-KEY: edd1c9f034335f136f87ad84b625c8f1" \
  -X PUT \
  -d '
{
  "name": "study",
  "uri": "/study/*",
  "service_id": "study-api",
  "plugins": {
    "openid-connect": {
      "client_id": "apisix-client",
      "client_secret": "your-client-secret-from-keycloak",
      "discovery": "http://keycloak:8080/realms/your-realm/.well-known/openid-configuration",
      "bearer_only": true,
      "scope": "openid profile",
      "redirect_uri": "http://127.0.0.1:9080/study/callback"
    },
    "limit-count": {
      "count": 100,
      "time_window": 60
    }
  }
}'
```