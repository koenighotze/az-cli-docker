# Wordcloud as a Docker image

[![CircleCI](https://circleci.com/gh/koenighotze/az-cli-docker/tree/master.svg?style=svg)](https://circleci.com/gh/koenighotze/az-cli-docker/tree/master)

The current version at Microsoft Azure ACR is 2.0.80. Just `docker pull koenighotze/azure-cli:2.0.80` to get started.

## Building

Building from scratch is easy as:

```bash
$ docker build -t koenighotze/azure-cli .
...
Successfully tagged koenighotze/azure-cli:latest
```

## Running

Start it without any organization.

```bash
$ docker run -ti --rm=true koenighotze/azure-cli:2.0.80
...
root@016f657e141a in /home/az (☁ /)
$
```

Start it with a default organization and project.

```bash
$ docker run \
        -ti \
        --rm=true \
        -e DEFAULT_ORGANISATION=https://dev.azure.com/<ORGA> \
        -e DEFAULT_PROJECT=<PROJECT> \
        koenighotze/azure-cli:2.0.80
...
root@016f657e141a in /home/az (☁ <ORGA>/<PROJECT>)
$
```


