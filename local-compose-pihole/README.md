# local-compose-pihole

> This is a docker compose file for running Pi-hole on a local network or homelab environment.
>
> Please do not expose pi-hole to the internet.

## Usage

```bash
curl https://raw.githubusercontent.com/chof64/configs/main/local-compose-pihole/docker-compose.yaml -o docker-compose.yaml
```

### Note

- Please change the web ui password before deployment.

## Ports

- 53/tcp -> 53/tcp (for DNS)
- 53/udp -> 53/udp (for DNS)
- 80/tcp -> 8080/tcp (for Web UI)

## Troubleshooting

### Port 53 is already in use.

Pi-hole requires port 53 to be available. Please make sure that no other service is using port 53.

You can use the following to check if any service is using port 53.

```bash
sudo lsof -i -P -n | grep LISTEN
```

One of the common services that uses port 53 is systemd-resolved. You can disable it by running the following command.

```bash
sudo systemctl stop systemd-resolved.service
sudo systemctl disable systemd-resolved.service
sudo systemctl mask systemd-resolved.service
```

_For other services, you can either disable them or change the port they're using._

You can also kill the process using port 53.

```bash
sudo kill -9 $(sudo lsof -t -i:53)
```

### Pi-hole Web UI returns 443 forbidden.

This error occurs when you access the wrong route. Please make sure you are accessing the correct route.

The Pi-hole Web UI is accessible at `http://<ip>:8080/admin/`.

```

```
