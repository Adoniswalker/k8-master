.PHONY: all  generate

all: generate



generate:
	@echo "Creating docker files"
	@cd sa-frontend && make

	@docker build -f sa-logic/Dockerfile -t adonsiwalker/sa-logic:minikube .
	@docker build -f sa-webapp/Dockerfile -t adonsiwalker/sa-webapp:minikube .

	@echo "Saving images"
	@mkdir -p package
	@mkdir -p package/images

	@docker save adonsiwalker/sa-logic:minikub > package/images/sa-logic:minikube.tar
	@docker save adonsiwalker/sa-webapp:minikube > package/images/sa-webapp:minikube.tar
	@helm package main-chart -d package

clean:
	@echo "Cleaning up..., removing package folder"
	rm -rf package