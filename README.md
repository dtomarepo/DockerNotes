# This project is a notebook for docker related commands
It shows simple example on how to create developer environment inside docker using devcontainer. 

Based on https://www.youtube.com/watch?v=0H2miBK_gAk and https://www.youtube.com/watch?v=SnSH8Ht3MIc but extended with devcontainer.json

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

# dockerignore
**/password.txt

# debugging
check last chapter of this vid, it worked well:
https://www.youtube.com/watch?v=0H2miBK_gAk