# docker-openresty

[![Build Status](https://travis-ci.org/hectcastro/docker-openresty.svg?branch=feature%2Fhmc%2Ftravis)](https://travis-ci.org/hectcastro/docker-openresty)
[![ImageLayers](https://imagelayers.io/badge/hectcastro/openresty:latest.svg)](https://imagelayers.io/?images=hectcastro/openresty:latest)

This project contains the source files for a container image that builds on top of the [official OpenResty container image](https://github.com/openresty/docker-openresty), but makes it function a bit more like the [official Nginx container image](https://github.com/nginxinc/docker-nginx) by:

- Creating an `nginx` user and group
- Providing a default Nginx configuration
- Providing a default Nginx virtual host configuration

## Table of Contents

* [Usage](#usage)
  * [Static Content](#hosting-static-content)
  * [Exposing Ports](#exposing-ports)
  * [Custom Nginx Configuration](#custom-nginx-configuration)
  * [Custom Nginx Virtual Host Configuration](#custom-nginx-virtual-host-configuration)

## Usage

### Serving Static Content

A directory named `/some/content` contains static content to be served via Nginx:

```console
$ docker run --rm -v /some/content:/usr/local/openresty/nginx/html:ro
```

Alternatively, a `Dockerfile` can be used to generate a new image that includes the static content:

```dockerfile
FROM user/openresty
COPY static-html-directory /usr/local/openresty/nginx/html/
```

### Exposing Ports

Configuring Nginx to serve traffic via port `8080` on the Docker host:

```console
$ docker run --rm -p 8080:80 some-content-nginx
```

### Custom Nginx Configuration

Supplying a custom Nginx configuration file:

```console
$ docker run --rm -v /some/nginx.conf:/usr/local/openresty/nginx/conf/nginx.conf:ro
```

### Custom Nginx Virtual Host Configuration

Supplying a custom Nginx virtual host configuration file:

```console
$ docker run --rm -v /some/custom.conf:/usr/local/openresty/nginx/conf/conf.d/default.conf:ro
```
