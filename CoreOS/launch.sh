#!/usr/bin/env bash

IGNITION_CONFIG="/var/lib/libvirt/images/server-01.ign"
IMAGE="/var/lib/libvirt/images/fedora-coreos-44.20260523.3.1-qemu.x86_64.qcow2"
VM_NAME="server-01"
VCPUS="2"
RAM_MB="2048"
STREAM="stable"
DISK_GB="20"
# For x86 / aarch64,
IGNITION_DEVICE_ARG=(--qemu-commandline="-fw_cfg name=opt/com.coreos/config,file=${IGNITION_CONFIG}")
	
# For s390x / ppc64le,
#IGNITION_DEVICE_ARG=(--disk path="${IGNITION_CONFIG}",format=raw,readonly=on,serial=ignition,startup_policy=optional)

# Setup the correct SELinux label to allow access to the config
#chcon --verbose --type svirt_home_t ${IGNITION_CONFIG}

virt-install --connect="qemu:///system" --name="${VM_NAME}" --vcpus="${VCPUS}" --memory="${RAM_MB}" \
        --os-variant="fedora-coreos-$STREAM" --import --graphics=none \
        --disk="size=${DISK_GB},backing_store=${IMAGE}" \
        --network bridge=br0 "${IGNITION_DEVICE_ARG[@]}"
