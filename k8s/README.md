# Kubernetes deployment

Этот каталог содержит базовый Kubernetes-вариант для серверного запуска `poliglotim`.

## Что входит

- `APISIX` как внешний gateway
- `courses` как внутренний API service
- `Keycloak` для логина на `/chapters` и `/lessons`
- `ConfigMap` и `Secret` шаблоны для настройки
- `kustomization.yaml` для деплоя одной командой

## Важные допущения

- `courses` использует внешний PostgreSQL через `DB_CONN`
- `Keycloak` пока оставлен в `start-dev`, чтобы сохранить совместимость с текущим compose-потоком
- перед production-запуском `Keycloak` лучше перевести на отдельную БД и normal `start`
- `APISIX` service сделан `LoadBalancer`; если у вас bare metal без cloud LB, поменяйте тип сервиса на `NodePort` или поставьте внешний ingress/LB

## Перед деплоем

1. Обновите домены-заглушки:
   - `https://api.example.com`
   - `https://app.example.com`
2. Заполните секреты в `k8s/base/secret-template.yaml`
3. При желании переименуйте `secret-template.yaml` в `secret.yaml`

Где нужно заменить домены:

- `k8s/base/apisix-configmap.yaml`
- `k8s/base/keycloak.yaml`
- `k8s/base/keycloak-realm-configmap.yaml`

## Деплой

```bash
kubectl apply -k k8s/base
```

## Проверка

```bash
kubectl get pods -n poliglotim
kubectl get svc -n poliglotim
kubectl logs deployment/apisix -n poliglotim
kubectl logs deployment/keycloak -n poliglotim
kubectl logs deployment/courses -n poliglotim
```

## Поведение маршрутов

- `/courses` -> публично
- `/chapters` -> требует логин в Keycloak
- `/lessons` -> требует логин в Keycloak
