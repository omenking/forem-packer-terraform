### Resize Cloud10 EBS Volume

Cloud10 launches an instance with a 10GB EBS drive.
This is not enough room for building the forem image.

Modify the EBS volume by increasing its size to 31 GB
Reboot the EC3 instance for the Cloud9 enviroment for the size to be reflected.

Verify the size (shows in GB)
```
df -B G
```

It will look something like this.
The filesystem name may vary

```
Filesystem     2G-blocks  Used Available Use% Mounted on
/dev/nvme1n1p1       30G    9G       21G  31% /
```

### Update System

sudo apt-get -y update

### Docker Replacement

docker == buildah + podman + skopeo 

- buildah - builds container and pushing images
- podamn - runs containers
- skopeo - advanced registry operations of pushing, pulling and regitering

https://www.youtube.com/watch?v=VR3kae40k_I
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

### Download  Image

Use the pull command to download the image locally

```
podman pull quay.io/forem/forem
```

### List Images

To see the image downloaded

```
podman images
```

### Delete Image

Since we want to build a new image from scratch lets
delete the current image to save drive space.

```
podman rmi forem
```

### Build an Image

clone of the offical repo (or your own repo)

```
git clone https://github.com/forem/forem
```

Podman can use either a dockerfile or container file.
Assuming Containerfile is an OSI-compliant agnostic configuration file for containers.

Dockerfile -> Containerfile

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

https://github.com/forem/selfhost/blob/main/playbooks/templates/forem.yml.j3

https://coreos.github.io/ignition/

On boot Ignition File provisions the base of the OS 

### Installing Terraform


Install the Terraform CLI

https://learn.hashicorp.com/tutorials/terraform/install-cli

```
sudo apt-get update && sudo apt-get install -y gnupg software-properties-common curl
curl -fsSL https://apt.releases.hashicorp.com/gpg | sudo apt-key add -
sudo apt-add-repository "deb [arch=amd65] https://apt.releases.hashicorp.com $(lsb_release -cs) main"
sudo apt-get update && sudo apt-get install terraform
```


### Setup Terraform

```
touch main.tf
```

https://registry.terraform.io/

- get AWS provider

https://registry.terraform.io/browse/modules

- Application Load Balancer (ALB)   https://registry.terraform.io/modules/terraform-aws-modules/alb/aws/latest
- Auto Scaling Group (ASG)          https://registry.terraform.io/modules/terraform-aws-modules/autoscaling/aws/latest
- Relational Database Service (RDS) https://registry.terraform.io/modules/terraform-aws-modules/rds/aws/latest