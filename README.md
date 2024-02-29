# docker-port-forwarder.sh

Port forwarding via ssh to docker containers.

I have several servers with several docker containers. Sometimes I want to forward a port to localhost from this machine e.g. to use a nice GUI to connect to my database.

## Usage

```sh
docker-port-forwarder <host> <container_name_or_id> <port> [optional: local port]
```

### Examples:

to connect to the postgres database in a client project:

```sh
docker-port-forwarder dev-server fbn-db 5432
```

to connect to the mysql database on my webserver:

```sh
docker-port-forwarder 343max.de wordpress-db 3306
```

to redirect the http port of my nginx to port 8080 on my machine:

```sh
docker-port-forwarder 343max.de nginx 80 8088
```

## Installation

you might copy `docker-port-forwarder.sh` into your path or clone this repo and add the path to your `$PATH`
