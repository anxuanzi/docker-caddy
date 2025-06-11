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

### Docker Image Features

- Based on the official Caddy image with specific version tagging for stability
- Includes multiple Caddy plugins for enhanced functionality
- Runs as a non-root user for improved security
- Includes a health check for better container orchestration
- Properly exposes ports and defines volumes

### Docker GID Configuration

The Docker image is configured to run as a non-root user (caddy) while still being able to access the Docker socket. By default, it creates a docker group with GID 999, which is a common GID for the Docker group on many systems.

If your host system uses a different GID for the Docker group, you have two options:

1. **Recommended**: Modify the docker-compose.yml to use the correct GID:
   ```yaml
   services:
     server:
       # ... other configuration ...
       group_add:
         - ${DOCKER_GID:-999}  # Use host's Docker GID or fallback to 999
   ```

   And set the DOCKER_GID environment variable:
   ```bash
   export DOCKER_GID=$(getent group docker | cut -d: -f3)
   ```

2. **Alternative**: Rebuild the image with the correct GID:
   ```bash
   docker build --build-arg DOCKER_GID=$(getent group docker | cut -d: -f3) -t your-image-name .
   ```

## License

This project is licensed under the Apache License 2.0. See the `LICENSE` file for details.

## References

For more information on configuring Caddy with Docker, refer to the Caddy Docker Proxy documentation. https://github.com/lucaslorentz/caddy-docker-proxy
