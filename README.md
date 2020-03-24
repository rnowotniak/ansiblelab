# ansiblelab
Personal Ansible playground (based on Docker, Docker-composer, Centos8)

Contact: Robert Nowotniak <rnowotniak@gmail.com>

Tested on ArchLinux as the Docker host.

## Quick start

Download the image from my
[Dockerhub](https://hub.docker.com/u/rnowotniak) account, and clone this repository from my
[github](https://github.com/rnowotniak/ansiblelab) repository:

    docker pull rnowotniak/ansiblelab
    git clone https://github.com/rnowotniak/ansiblelab

asdf

    cd ansiblelab
    docker-compose up

## How I configured this.

Ansible node.
All required:
    generate ssh keys
    Start sshd server
    copy private key to Ansible master

Ansible master.
    Configure inventories
    ssh -i /keys/mykey 172.17.0.3

## Some useful commands

* ansible all -m ping
* ansible all -m ping -i inv
* ansible all -m shell -a "uname -a" --ask-pass

ssh-keygen -q -N "" -f keys/mykey

docker run -v $PWD/keys:/keys:ro -it --name ansible_node2 -h ansible_node2 --rm anstmp

docker run -v $PWD/keys:/root/.ssh -it centos

* https://www.cyberciti.biz/python-tutorials/linux-tutorial-install-ansible-configuration-management-and-it-automation-tool/
* https://wiki.archlinux.org/index.php/Ansible
* https://www.cyberciti.biz/python-tutorials/linux-tutorial-install-ansible-configuration-management-and-it-automation-tool/

