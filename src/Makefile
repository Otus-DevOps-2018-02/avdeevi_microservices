USER_NAME     := garytrek

all: build pull  restart prometheus

run:
	@echo ">> running all containers"
	docker-compose up -d

kill:
	@echo ">> stop all kontainers"
	docker-compose kill

restart: kill run

build: prometheus mongodb_exporter ui post comment cloudprober


prometheus:
	@echo ">>>>>>>>>>>> build prometheus image"
	cd ../monitoring/prometheus  && docker build -t $(USER_NAME)/prometheus . ; cd -

mongodb_exporter:
	@echo ">>>>>>>>>>>> build mongodb exporter image"
	cd ../monitoring/mongodb_exporter  && docker build -t $(USER_NAME)/mongodb_exporter . ; cd -


cloudprober:
	@echo ">>>>>>>>>>>>> build cloudprober image"
	cd ../monitoring/cloudprober  && docker build -t $(USER_NAME)/cloudprober . ; cd -

ui:
	@echo ">>>>>>>>>>>>>> build ui image"
	cd ./ui  && bash docker_build.sh ; cd -

post:
	@echo ">>>>>>>>>>>>>> build post image"
	cd ./post-py  && bash docker_build.sh ; cd -

comment:
	@echo ">>>>>>>>>>>>>> build comment image"
	cd ./comment  && bash docker_build.sh ; cd -


push:
	@echo "Push all containers"
	docker push $(USER_NAME)/ui
	docker push $(USER_NAME)/post
	docker push $(USER_NAME)/comment
	docker push $(USER_NAME)/cloudprober
	docker push $(USER_NAME)/prometheus
	docker push $(USER_NAME)/mongodb_exporter


.PHONY: all run kill restart docker prometheus push comments post ui cloudprober mongodb_exporter

