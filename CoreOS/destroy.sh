#!/usr/bin/bash

HOST=$1

sudo virsh destroy $HOST
sudo virsh undefine $HOST --remove-all-storage
