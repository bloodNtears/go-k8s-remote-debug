# 🐛 Удалённая отладка Go-приложений в Kubernetes с помощью Delve

Этот репозиторий содержит пример простого Go-сервиса и конфигурации для удалённой отладки в Kubernetes с использованием отладчика Delve.

## 📦 Что внутри
- Простой HTTP-сервер на Go
- Dockerfile с поддержкой Delve
- Helm-чарт для деплоя в кластер

## 🚀 Быстрый старт

Требуется установленный Minikube и Helm

1.	Запускаем кластер:
```shell
minikube start
```

2. Используем локальный Docker внутри Minikube:
```shell
eval $(minikube docker-env)
```

3. Собираем образ с Delve:
```shell
docker build -t simple-server:local .
```
docker build -t simple-server:local .

4.	Деплоим приложение в кластер через Helm:
```shell
cd chart
helm upgrade --install simple-server ./simple-server
```

5.	Получаем URL приложения в minikube:
```shell
minikube service simple-server --url
```

6.	Отправляем запрос:
```shell
curl http://<address>:<port>?name=Alice

```

## 🧠 Отладка в IDE

После запуска приложения и проброса порта (kubectl port-forward pod/simple-server-xxxxx 40000:40000), можно подключаться из GoLand или VS Code как Go Remote, порт 40000.
Подробнее об этом будет в статье