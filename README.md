# Docker Caddy

This repository contains a Docker setup for running Caddy with additional plugins. Below is the detailed information on how to use this repository.

## Prerequisites

* Docker
* Docker Compose

## Getting started

1. Clone the repository.
2. Navigate to the repository directory.

## Building the Docker image

The Docker image is built using GitHub Actions. The workflow file is located at `.github/workflows/build-image.yml`. The image is built and pushed to the GitHub Container Registry.

https://github.com/anxuanzi/docker-caddy/pkgs/container/docker-caddy

Or Use Pre-Built Image

```bash
docker pull ghcr.io/anxuanzi/docker-caddy:latest
```

## Running the Docker container

To run the Docker container, use the provided `docker-compose.yml` file. The file is located at `docker-compose.yml`.

```sh
docker-compose up -d
```

This will start the Caddy server with the specified configuration.

## Dockerfile

The Dockerfile is located at `Dockerfile`. It builds a custom Caddy image with additional plugins.

## License

This project is licensed under the Apache License 2.0. See the `LICENSE` file for details.

## References

For more information on configuring Caddy with Docker, refer to the Caddy Docker Proxy documentation. https://github.com/lucaslorentz/caddy-docker-proxy
