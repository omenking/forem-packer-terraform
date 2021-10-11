### Update System

sudo apt-get -y update

### Installing Podman

https://docs.podman.io/

Podman is an OCI-compliant container runtime that works without a daemon
Podman is a drop-in replacement for Docker, sharing very nearly-indentical CLI commands

. /etc/os-release
echo "deb https://download.opensuse.org/repositories/devel:/kubic:/libcontainers:/stable/xUbuntu_${VERSION_ID}/ /" | sudo tee /etc/apt/sources.list.d/devel:kubic:libcontainers:stable.list
curl -L "https://download.opensuse.org/repositories/devel:/kubic:/libcontainers:/stable/xUbuntu_${VERSION_ID}/Release.key" | sudo apt-key add -
sudo apt-get update
sudo apt-get -y upgrade
sudo apt-get -y install podman

### Search Forem on Podman

We can search podman for published `forem` images.

```
podman search forem
```

The offical forem will be hosted on at `quay.io    quay.io/forem/forem `

> https://quay.io/ is a container repostiry by RedHat.

### Download 

Use the pull command to download the image locally

```
podman pull quay.io/forem/forem
```

### Forem 

Fedora CoreOS -> Butane -> Ignition File -> 
- Podman
- FCOS_Python
- ForemImg
- ForemCtl
- Application Configtion eg /opt/forem/envs/rails.env
- SystemD Services


#### Butane File

https://github.com/forem/selfhost/blob/main/playbooks/butane.yml

https://github.com/coreos/butane

Butane translates human readable Butane Configs into machine readable Ignition Configs

#### Ignition File

https://github.com/forem/selfhost/blob/main/playbooks/templates/forem.yml.j2

https://coreos.github.io/ignition/

On boot Ignition File provisions the base of the OS 
