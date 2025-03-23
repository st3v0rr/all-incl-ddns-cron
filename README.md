# all-inkl-ddns-cron

A Docker container for automatically updating your dynamic IP address with all-inkl web-hosting DynDNS.

[![Build and Push Docker Image](https://github.com/st3v0rr/all-inkl-ddns-cron/actions/workflows/docker-build-push.yml/badge.svg)](https://github.com/st3v0rr/all-inkl-ddns-cron/actions/workflows/docker-build-push.yml)
[![Docker Pulls](https://img.shields.io/docker/pulls/st3v0rr/all-inkl-ddns-cron.svg)](https://hub.docker.com/r/st3v0rr/all-inkl-ddns-cron)

## Description

This project provides a simple solution for automatically updating your dynamic IP address with all-inkl web-hosting. The container runs an update script every 15 minutes that determines your current public IP address and sends it to the Kasserver DynDNS service.

Features:
- Automatic IP updates every 15 minutes
- Simple configuration via environment variables
- Compact Alpine-based Docker image
- Logging of update operations

## Prerequisites

- Docker installation on your system
- DynDNS account with all-inkl-hosting (Kasserver)
- Access credentials for DynDNS (username and password)

## Installation and Usage

### Using Docker CLI

```bash
docker run -d \
  --name ddns-updater \
  --restart unless-stopped \
  -e CURL_USERNAME=your_username \
  -e CURL_PASSWORD=your_password \
  st3v0rr/all-inkl-ddns-cron:latest
```

### Using Docker Compose

Create a `docker-compose.yml` file with the following content:

```yaml
version: '3'
services:
  ddns-updater:
    image: st3v0rr/all-inkl-ddns-cron:latest
    container_name: ddns-updater
    restart: unless-stopped
    environment:
      - CURL_USERNAME=your_username
      - CURL_PASSWORD=your_password
```

Start the container:

```bash
docker-compose up -d
```

## Environment Variables

| Variable | Description | Required |
|----------|-------------|----------|
| `CURL_USERNAME` | Your username for DynDNS at Kasserver | Yes |
| `CURL_PASSWORD` | Your password for DynDNS at Kasserver | Yes |

## Viewing Logs

To view the container logs and check the progress of IP updates:

```bash
docker logs ddns-updater
```

## Building

If you want to build the image yourself:

```bash
git clone https://github.com/st3v0rr/all-inkl-ddns-cron.git
cd all-inkl-ddns-cron
docker build -t all-inkl-ddns-cron .
```

## License

See [LICENSE](LICENSE) file

## Contributing

Pull requests are welcome. For major changes, please open an issue first to discuss what you would like to change.
