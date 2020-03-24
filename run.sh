#!/bin/bash

if [ "$#" -lt 1 -o \( "$1" != master -a "$1" != node \) ]; then
	echo "Usage syntax: $0 master|node"
	exit 1
fi

PUBLIC_KEY=/keys/authorized_keys
PRIVATE_KEY=/keys/mykey

[ ! -e "~/.ssh" ] && mkdir ~/.ssh

if [ "$1" = master ]; then
    cp "$PRIVATE_KEY" ~/.ssh/id_dsa
    if [ -t 0 ]; then
            # interactive shell from Docker
        	bash -l
    else
            echo "Please attach in interactive session to work with the master container."
            echo "This process will sleep now to keep the master container running."
            sleep infinity
    fi
elif [ "$1" = node ]; then
    if [ ! -r "$PUBLIC_KEY" ]; then
        echo "$PUBLIC_KEY is missing"
        echo "sshd would not be able to accept connections. Exiting."
        exit 1
    fi
    cp "$PUBLIC_KEY" ~/.ssh/
    chown 0:0 ~/.ssh/authorized_keys
    chmod 600 ~/.ssh/authorized_keys
    rm -f /run/nologin

    shift
    /usr/sbin/sshd -D -e "$@"
fi
