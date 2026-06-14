#!/usr/bin/bash

sudo virsh destroy fcos-test-01
sudo virsh undefine fcos-test-01 --remove-all-storage
