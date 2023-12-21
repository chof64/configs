# local-compose-traefik-portainer

> This is a docker compose file for running Traefik and Portainer, specifically for local development and homelab environments.

## Usage

```bash
curl https://raw.githubusercontent.com/chof64/configs/main/local-compose-traefik-portainer/docker-compose.yaml -o docker-compose.yaml && \
curl https://raw.githubusercontent.com/chof64/configs/main/local-compose-traefik-portainer/example.env -o example.env
```

### Setup

1. Create `traefik-public` network used by Traefik to proxy requests to containers.

```bash
sudo docker network create traefik-public
```

2. Copy the example `.env` file and add edit environment variables.

```bash
cp example.env .env \
nano .env
```

### Note

- Traefik will automatically generate a self-signed certificate for any https requests.

## Ports

- `80/tcp` -> `80/tcp` (for Traefik)
- `443/tcp` -> `443/tcp` (for Traefik)
