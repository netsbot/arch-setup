#!/bin/bash
cd /tmp
wget https://dl-cdn.alpinelinux.org/alpine/v3.13/releases/aarch64/alpine-virt-3.13.5-aarch64.iso
dd if=alpine-virt-3.13.5-aarch64.iso of=/dev/sda
sync
reboot
