<h1 align=center>
  42 Cursus
 </h1>
<h2 align=center>
  inception
</h2>
<h2 align=center>

  ![inception](https://github.com/beatrizdile/beatrizdile-utils/blob/master/inceptionm.png)
</h2>

Docker docker docker

## Description

docker...

## Commands

There are plenty of very useful commands that can be very handy knowing:

### Basic commands
`docker images` - Get all the currently downloaded images you have.

`docker pull <image-name>:<tag>` - Download an image from Docker Hub.

`docker rmi <image-id or name>` - Remove an image.

### Containers
`docker build -t <image-name>:<tag> .` - Build a custom image from a Dockerfile. Docker will look for the Dockerfile in the current directory and use it to build the image.

`docker run <image-name>` - Start a new container from an image.

`docker ps` - Get infomation about all currently running containers, and just add a `-a` to retrieve info about all containers, including stopped ones.

`docker stop <container-id or name>` - Gracefully stop a running container.

`docker start <container-id or name>` - Restart a stopped container.

`docker rm <container-id or name>` - Delete a container.

### Logs and Debugging
`docker logs <container-id or name>` - See logs from a container.

`docker exec -it <container-id or name> /bin/bash` - Start an interactive shell in a container. If bash doesn't work, use `/bin/sh`.

### Networking
`docker network ls` - List Docker networks.

`docker network create <network-name>` - Create a new network.

`docker network connect <network-name> <container-id>` - Connect a Container to a network.

### Volumes
`docker volume ls` - List volumes.

`docker volume create <volume-name>` - Create a volume.

`docker volume rm <volume-name>` - Remove a volume.

### Docker Compose
`docker-compose up` - Start services defined in `docker-compose.yml`. To specify a .yml file, just add `-f <file-name>` to it.

`docker-compose up -d` - Start services in Detached Mode.

`docker-compose down` - Stop services.

`docker-compose restart` - Restart services.

`docker-compose logs` - View logs.


## Dockefile

Here's an example of what a Dockerfile would look like and an explanation over the each command:
```
# Use base image
FROM node:16

# Set working directory
WORKDIR /app

# Copy package files and install dependencies
COPY package.json .
RUN npm install

# Copy the rest of the application files
COPY . .

# Expose application port
EXPOSE 3000

# Set environment variable
ENV NODE_ENV=production

# Default command to run the application
CMD ["npm", "start"]
```

`FROM` - Specifies the base image for your Docker image, every Dockerfile must start with a FROM command.

`RUN` - Executes commands during the image build process.

`WORKDIR` - Sets the working directory inside the container.

`COPY` - Copies files and directories from the build context into the container.

`ADD` - Similar to COPY but also supports fetching files from URLs and unpacking archives.

`CMD` - Specifies the default command to run when the container starts.

`EXPOSE` - Declares a port that the container will listen on.

`ENV` - Sets environment variables in the container.

`ARG` - Defines build-time variables that can be passed with `--build-arg`.

`VOLUME` - Creates a mount point for data volumes to persist data.

`USER` - Specifies the user to run commands inside the container.
