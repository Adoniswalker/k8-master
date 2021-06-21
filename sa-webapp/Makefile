build:
	@npm install --production
	@npm run build
	@docker build -f sa-frontend/Dockerfile -t adonsiwalker/sa-frontend:minikube .
	@docker save adonsiwalker/sa-frontend:minikube  > package/images/sa-frontend:minikube.tar