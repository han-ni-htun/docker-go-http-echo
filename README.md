# Dockerized Go HTTP Echo Server

A Docker containerization project using a precompiled Go HTTP Echo Server. The project demonstrates Docker image creation, Linux runtime compatibility, container networking, and HTTP endpoint verification.

## Overview

The container runs an HTTP Echo Server based on HashiCorp's [http-echo](https://github.com/hashicorp/http-echo) project.

The image uses Debian Bookworm Slim to provide the glibc runtime required by the included Linux AMD64 executable.

## Technology Stack

- Docker
- Go (precompiled application)
- Debian Bookworm Slim
- HTTP
- Linux AMD64


## Prerequisites

- Docker Desktop or Docker Engine
- Support for running Linux AMD64 containers

On ARM64 systems, AMD64 emulation may be required.

## Build the Docker Image

```bash
docker build --platform linux/amd64 -t docker-go-http-echo:1.0 .
```

Verify the image architecture:

```bash
docker image inspect docker-go-http-echo:1.0 --format '{{.Os}}/{{.Architecture}}'
```

Expected output:

```text
linux/amd64
```

## Run the Container

```bash
docker run -d --rm --platform linux/amd64 --name go-http-echo -p 8080:5678 docker-go-http-echo:1.0 -text=Hello-Docker
```

The HTTP Echo Server listens on port `5678` inside the container, which is published on host port `8080`.

## Verify the HTTP Response

```bash
curl http://localhost:8080
```

Expected response:

```text
Hello-Docker
```

Inspect the running container:

```bash
docker ps
```

View application logs:

```bash
docker logs go-http-echo
```

Stop the container:

```bash
docker stop go-http-echo
```

The `--rm` option automatically removes the container after it stops. The Docker image remains available locally.

## Runtime Compatibility

The included HTTP Echo executable is dynamically linked and requires the glibc dynamic loader.

An Alpine-based image was initially tested but failed during container startup because its default runtime environment did not provide the required loader.

Switching to a Debian-based image resolved the compatibility issue.

The resulting container was successfully tested with an HTTP GET request returning status `200 OK`.

## Upstream Project and License

This project containerizes the precompiled HTTP Echo Server from [HashiCorp's http-echo](https://github.com/hashicorp/http-echo).

- **Upstream source:** https://github.com/hashicorp/http-echo
- **Source revision:** `767bbd9c3d1905acb04891d5c5e208de17b34a71`
- **Go compiler:** `1.26.1`
- **Target platform:** `linux/amd64`
- **License:** Mozilla Public License 2.0 (MPL-2.0)

The corresponding upstream source can be accessed at [the recorded Git revision](https://github.com/hashicorp/http-echo/tree/767bbd9c3d1905acb04891d5c5e208de17b34a71).

This repository focuses on packaging, runtime compatibility, and container networking rather than developing the upstream Go application.