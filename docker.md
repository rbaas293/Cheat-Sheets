# Docker Cheatsheet
The first thing to do is decide weather you want docker desktop or not. 

## Docker Desktop

Docker desktop is perfect for users on windows or mac who want a GUI and cli to work with. The desktop apps backend is actually run in a dedicated virtual machine, which allows a single installation file to handle the entire istallation of docker desktop and docker engine. Linux differs from this approch as there is a repository and multiple packages to install.

## Docker Engine (docker-ce)

Docker Engine is the normal interface legacy docker users will be familliar with. This is the suite of command line programs users interface with. Docker Engine is maintained and packaged by docker and will be the most up to date version.

## docker.io package (ubuntu/debian)

This is provided by the Linux distribution. They are compiling the upstream docker engine themselves, and adding some distribution specific code, mainly to the startup scripts. This name was picked because docker was already taken by an unrelated project. 


## Which to install?
Docker Desktop/engine if you want a GUI. 

`docker.io` if you want an easy to install debian/ubuntu apt package. (Usefull for air-gapped systems)

### Explaination of diffrences:

docker-ce is provided by docker.com, docker.io is provided by Debian.

More importantly, however, although both packages provide properly released versions of Docker, they have a very different internal structure:

* `docker.io` does it the Debian (or Ubuntu) way: Each external dependency is a separate package that can and will be updated independently.
* `docker-ce` does it the Golang way: All dependencies are pulled into the source tree before the build and the whole thing forms one single package afterwards. So you always update docker with all its dependencies at once.

The problem with the latter approach is that it goes against much of what Debian/Ubuntu are trying to do.

Some remarks:

Many web pages call docker.io "outdated". That is because it was unmaintained for about a year. As of August 2019, this is no longer the case.
I learned all this today here and will now switch from using docker-ce to using docker.io -- and presumably never go back again.
There is a reason why the Debian/Ubuntu packaging system is so complicated. A good reason.

**Credit:** https://stackoverflow.com/questions/45023363/what-is-docker-io-in-relation-to-docker-ce-and-docker-ee-now-called-mirantis-k


## Docker Desktop Installation

## Docker Engine Installation

## `docker.io` Installation

```bash
sudo apt install docker.io
```



## Docker Command Line Examples

Pull an image from a docker registry:

```bash
# Usage
#docker pull [OPTIONS] NAME[:TAG|@DIGEST]

# via default (docker dub)
docker pull roboxes/rhel8:latest
# via <myregistry.local> local network on port 5000
docker pull myregistry.local:5000/roboxes/rhel8:latest
```

See images that have been pulled or imported:

```bash
docker images fedora
```

Start a container and attach to its console shell (run in _forground_)

**NOTE**: docker run -i -t --name test roboxes/rhel8

```bash
#-a=[]           : Attach to `STDIN`, `STDOUT` and/or `STDERR`
#-t              : Allocate a pseudo-tty
#--sig-proxy=true: Proxy all received signals to the process (non-TTY mode only)
#-i              : Keep STDIN open even if not attached

docker run -i -t --name test roboxes/rhel8
```

Start a container and detach it (run in the _background_):

```bash
#-d Detached mode: Run container in the background, print new container id
# <command> is the shell command to to run in container. If it is not present,
## the conainer will exit imediatlly

docker run -d -p 8000:8000 --name test roboxes/rhel8 <command> 
```

Running proccess with mounted volumes in the host system. (shared volumes)

__For Refrence:__

> -v, --volume=[host-src:]container-dest[:<options>]: Bind mount a volume.
> The comma-delimited `options` are [rw|ro], [z|Z],
> [[r]shared|[r]slave|[r]private], and [nocopy].
> The 'host-src' is an absolute path or a name value.

```bash
# Where -v $(pwd)/build:/data specifies host mount is ./build and container mount is at /data
docker run -it -d \
    --name build \
    -e VIRTUAL_HOST=build.domain.lo \
    -v $(pwd)/build:/data \
    roboxes/rhel8 \
    bash   
```


Create and start container with command `bash`. Allocate a terminal and keep STDIN open, 
but detach so we dont end up in a shell. 
```bash
# Where -v $(pwd)/build:/data specifies host mount is ./build and container mount is at /data
docker run -it -d \
    --name build \
    -e VIRTUAL_HOST=build.domain.lo \
    -v $(pwd)/build:/data \
    roboxes/rhel8 \ 
    bash

```

If we want to attach to a shell of the container we run one of the follwoing

```bash
docker attach build
# Or
docker exec -it build bash
```

If the container exits for any reason, it can be started again to the original run setting:

```bash
docker start build
```

If the container needs to be stopped or removed, run the following:

```bash
# Stop the container
docker stop build
# remove the container
docker remove build
```






