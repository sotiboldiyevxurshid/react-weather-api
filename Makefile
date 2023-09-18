
IMAGE_NAME := crm_dev

delete-image:
	@if docker inspect $(IMAGE_NAME) >/dev/null 2>&1; then \
        docker stop $(IMAGE_NAME) && docker rm $(IMAGE_NAME); \
	fi


docker-build: 
	docker build --tag crm-dev:tag . 
docker-run:
	docker run -p 8090:3000 --name=crm_dev -d docker.io/library/crm-dev:tag  

docker-start:
	make docker-build && make docker-run  


docker-remove:
	docker stop crm_dev
docker-delete:
	docker rm crm_dev   	
docker-stop:
	make docker-remove && make docker-delete 