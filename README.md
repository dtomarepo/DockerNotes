# This project is a notebook for docker related commands
It shows simple example on how to create developer environment inside docker using devcontainer.
This setup uses docker-compose to setup database and web UI for it
Devcontainer provides docker for app development with netowkr acces to the database
It as a basic setup for micro service decelopment. 
Database volume is persistent. 

Based on https://www.youtube.com/watch?v=3c-iBn73dDE https://www.youtube.com/watch?v=0H2miBK_gAk https://www.youtube.com/watch?v=SnSH8Ht3MIc but extended with devcontainer.json 

# Lunching
`docker-compose up` which will run Postgres and web client
then code . and reopen project in container. 

Now our project should be opened in the docker container, with preinstalled environment, and also with postgres in network. 
use `psql -h docker-db-1 -p 5432 -d default -U admin` pass admin
to ensure that connection is estabilished. 
Also use browser for localhost:80 for web client and check db connection.

# Building docker
build docker from the dockerfile. 
You can also use devcontainer, inside VSCode reopen project in container so it will also build. 
`docker build -t fastapi-image .` 

Where /code is workdir
`docker run -d --name fastapi-container -p 80:80 -v $(pwd):/code fastapi-image`

`docker start ID`
`docker stop ID`
`docker rm ID`
`docker rim <image name>`
`docker exec -it <mycontainer> bash`
`docker images`
`docker network ls`

# dockerignore
**/password.txt

# debugging
check last chapter of this vid, it worked well:
https://www.youtube.com/watch?v=0H2miBK_gAk

# docker-compose
if file is named docker-compose.yaml then `docker-compose up` will run it
otherwise use `docker-compose -f file.yaml up`

removes containers and network
`docker-compose down`

Keep in mind that docker-compose creates by default internal network, so all services are connected and can easily communicate. 

provided docker-compose.yaml file starts postgres db and web interface for it
check localhost:8080 admin/admin DB:default 

# volume (persistent data)
1. Host Volumes
Explicite mapping of host dir into docker dir
docker run: `-v /home/mount/data:/var/lib/mysql/data `

2. Anonymous Volumes 
Just by referencing container: `-v /var/lib/mysql/data`
Data is automatically created under:
/var/lib/docker/volumes/random-hash/_data

3. Named Volumes
`-v name:/var/lib/mysql/data`
You can reference volume by name (on the host filesystem)
/var/lib/docker/volumes/random-hash/_data
You don't have to know the path, just name
Should be used in production!

4. Docker-compose 
works the same, take a look
services: 
    MyService:
        volumes:    // here list where this volume should be mounted
          - db-data:/var/lib/mysql/data 
volumes:
    db-data         // here list all used volumes

Keep in mind that volume may be used in more than one container, if services need to share the data!