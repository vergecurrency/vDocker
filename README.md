# Verge Core Docker Repo

Verge core image hosted over here: [Verge Core Repo](https://hub.docker.com/r/marpme/verge-core)

**Why tho?**

-   no compiling
-   always up-to-date
-   no stress with dependency management
-   no nasty compiling errors
-   no weird port overlaps with tor
-   clean seperation between OS and Verge Core

## Requirements:

Wanna just start a server for your personal or public usage, then just go ahead and **install** `docker` and `docker-compose`.

[Docker-guides](https://docs.docker.com/)

## Usage:

Afterwards clone this repo and use docker compose to start a verge core server:

```sh
docker-compose up
```

-   P2P Port: `21102`
-   RPC Port: `20102`
-   RPC IP bound to: `127.0.0.1`
