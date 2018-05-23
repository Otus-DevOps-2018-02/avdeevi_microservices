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

# Домашнее задание номер 16
 - Проведены эксперименты с сетью в докер в различной конфигурации.  Исследованы типы сетей: none, host, bridge.
 - При использовании сети типа host для запуска контейнера nginx при старте первого контейнера он биндится на 80-ый порт локального интерфейса, при попытке запуска дополнительных копий контейнера они падают т.к уже не могут занят нужный (80) порт.
 - Проведен эксперимент со стартом контейреров в одной общей bridge-сети. 
 - Проведен эксперимент со стартом контейреров в двух bridge-сетях. Базу мы расположили в back-сети, ui - в front-сети,  а сервисы post и comment смотрят в обе эти сети.
 - Стартованы сервисы с помощью простого docker-compose файла. 
 - Переработан файл  docker-compose для размещения контейнеров в двух сетях. Добавлены требуемы алиасы. 
 - Файл docker-compose  параметризирован с помощью переменых окружения. Мы вынесли в переменные, имя пользователя, версии всех контейреров, путь к данным монго, внешний порт приложения. Все переменные окружения вынесены в файл .env, также создан файл .env.example
 - В файл .env добавлена переменная COMPOSE_PROJECT_NAME для кастомизации базового имени проекта (префикса в именах контейнеров).
 - Создан файл  docker-compose.override.yml который позволяет примонтировать в контейнер внешние папки с исходными кодами проекта для возможности правки кода без пересборкиимиджей, а так же для кастомизации флагов запуска приложения puma.  Проведен эксперимент по запуску проекта в таком виде.

# Домашнее задание номер 17
 - Создана виртуальная машина в GCP, на ней утановлен docker-ce, docker-compose. На сервере развернут gitlab-ci в варианте omnubus.
 - Произведена первичная настройка  gitlab-ci через веб-интерфейс: созданы группа, проект.
 - Создан  .gitlab-ci.yml  файл и проект запушен в репозиторий  gitlab-ci
 - Установлен и зарегистрирован runner
 - Добавлен шаг тестирования приложения reddit в pipeline.
 - Cделан ansible-плейбук для автоматического развертывания и регистрации Runner-a на серверах и проверена его работа.
```
ansible-playbook -i hosts gitlab-runner.yml
```
 - Настроена интеграция pipeline со slack-чатом.


# Домашнее задание номер 19
 - Запущен prometheus внутри докер контейнера.
 - Первоначальное знакомомство с prometheus - targets, metrics.
 - Образ  prometheus кастомизирован  добавлением собственного конфигурационного файла.
 - Пересобраны образы микросервисов с использованием скриптов  docker_build.sh
 - Переработан файл docker-compose.yml, добавлен старт prometheus, убрана сборка образов.
 - Проведены эксперименты с хелс-чеками, и зависимостями между сервисами и их мониторингу.
 - Добавлен  node_exporter  в конфигурацию.
 - Собранные образы запушены в докер хаб: https://hub.docker.com/u/garytrek/
 - Собран образ  mongodb_exporter  на основе проекта экспортера компании Percona https://github.com/percona/mongodb_exporter
 - Cобран образ  cloudprober с конфигом для мониторинга сервисов  ui,post,comment (делаем http  запросы на эти сервисы).
 - Cоздан Makefile для удобной сборки всех образов, пуша, старта и стопа сервисов. 

