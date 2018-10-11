build:
	docker build --rm  -t pci-keycloak:latest .
clean:
	# https://zaiste.net/removing_docker_containers/
	#docker ps -aq --no-trunc -f status=exited | xargs -r docker rm
	#docker images -q --filter dangling=true | xargs -r docker rmi
	docker stop keycloak  || true
	docker kill keycloak || true
	docker rm keycloak
shell:
	docker exec -i -t  keycloak  /bin/bash
run: 
	docker run -p 8080:8080 -d --name keycloak pci-keycloak
admin:
	docker exec keycloak keycloak/bin/add-user-keycloak.sh -u admin -p blablu
	docker stop keycloak
	docker start keycloak
restart:
	docker stop keycloak
	docker start keycloak
logs:
	docker logs -f  keycloak 
