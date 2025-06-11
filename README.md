# Docker Caddy

This repository contains a Docker setup for running Caddy with additional plugins. Below is the detailed information on how to use this repository.

## Prerequisites

* Docker
* Docker Compose

## Getting started

1. Clone the repository.
2. Navigate to the repository directory.

## Docker Images

The Docker images are built and published using GitHub Actions. There are two separate workflows:

1. **Check Build Workflow** (`.github/workflows/check-build.yml`): Verifies that the Docker image builds successfully without publishing it.
2. **Build and Publish Workflow** (`.github/workflows/build-image.yml`): Builds and publishes the Docker image when a new release is created.

### CI/CD Process

- **Push to main branch**: Triggers the Check Build workflow, which builds the image for testing purposes but does not publish it.
- **Release publication**: Triggers the Build and Publish workflow, which builds and publishes the image with the release tag and updates the `latest` tag.

### Using Pre-Built Images

Images are available in the GitHub Container Registry:

https://github.com/anxuanzi/docker-caddy/pkgs/container/docker-caddy

You can pull the latest stable release:

```bash
docker pull ghcr.io/anxuanzi/docker-caddy:latest
```

Or a specific version:

```bash
docker pull ghcr.io/anxuanzi/docker-caddy:v1.0.0  # Replace with the actual version
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
