
#GO           := go
#FIRST_GOPATH := $(firstword $(subst :, ,$(shell $(GO) env GOPATH)))
#PROMU        := $(FIRST_GOPATH)/bin/promu -v

PREFIX              ?= $(shell pwd)
DOCKER_IMAGE_NAME   ?= mongodb-exporter

# Race detector is only supported on amd64.

all: start format build test

run:
	@echo ">> running all containers"
	docker-compose up -d

kill:
	@echo ">> stop all kontainers"
	docker-compose kill

restart: kill run



docker:
	@echo ">> building docker image"
	@docker build -t "$(DOCKER_IMAGE_NAME):$(DOCKER_IMAGE_TAG)" .



.PHONY: all run kill restart docker

