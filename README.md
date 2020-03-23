# ansiblelab
Ansible playground (Docker, Docker-composer, Centos)

How I configured this.

Ansible node.
All required:
    generate ssh keys
    Start sshd server
    copy private key to Ansible master

Ansible master.
    Configure inventories
    ssh -i /keys/mykey 172.17.0.3

* ansible all -m ping
* ansible all -m ping -i inv
* ansible all -m shell -a "uname -a" --ask-pass

ssh-keygen -q -N "" -f keys/mykey

docker run -v $PWD/keys:/keys:ro -it --name ansible_node2 -h ansible_node2 --rm anstmp

docker run -v $PWD/keys:/root/.ssh -it centos

* https://www.cyberciti.biz/python-tutorials/linux-tutorial-install-ansible-configuration-management-and-it-automation-tool/