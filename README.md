# avdeevi_microservices
avdeevi microservices repository

# Домашнее задание номер 14
 - Установлен  docker-machine на локальном компьютере
 - В GCP создан новый проект
 - В GCP, в новом проекте развернут docker host c помощью  docker-machine
 - Создан  Dockerfile и на его основе собран образ содержащий приложение и базу.
 - Собранный образ запущен на docker host в  GCE.
 - Зарегистрирован аккаунт в  Docker Hub и настроено испльзование этого аккаунта в локальном окружении.
 - Созданный ранее образ загружен в Docker Hub
 - Образ из Docker Hub развернут на локальном docker engine.
 - Подготовлена конфигурация terraform для поднятия нескольких инстансов в GCP
 - Для  ansible настоен динамический inventory.
 - Подготовлены ansible роли для установки  docker-engine  на хосты в  GCP и для деплоя на них контейнера из Docker Hub.
 - Подготовлен шаблон пакера который делает образ с установленным  Docker.

# Домашнее задание номер 15
 - Добавлены в исходные коды приложения в папку src
 - Созданы докер-файлы для сборки имиджей  сервисов  post,ui и comment
 - Собраны и запущены образы на docker host  в GCE.
 - Проверена работа приложения.
 - Контейнеры и остановлены и запущены с новыми сетевыми алиасами, новые переменные окружения переданы в в контейнеры через параметры запуска.  Проверена работосбособность. 
```
docker run -d --network=reddit --network-alias=post_db2 --network-alias=comment_db2 mongo:latest
docker run -d --network=reddit --network-alias=post2 -e "POST_DATABASE_HOST=post_db2" garytrek/post:1.0
docker run -d --network=reddit --network-alias=comment2 -e "COMMENT_DATABASE_HOST=comment_db2"  garytrek/comment:1.0
docker run -d --network=reddit -p 9292:9292 -e "POST_SERVICE_HOST=post2" -e "COMMENT_SERVICE_HOST=comment2"  garytrek/ui:1.0

```
- Собран образ  ui  на основе ubuntu:16:04, размер образа уменьшился с 776MB до 437MB
- Cобран образ ui на основе alpine:latest, размер образа - 209MB
- Подключен  docker volume к контейнеру  mongo. Проверена работа приложения и сохранение постов после перезапуска всех контейнеров. 



