#!/bin/bash
mkdir /media/setup
cp -a /media/sda/* /media/setup
mkdir /lib/setup
cp -a /.modloop/* /lib/setup
/etc/init.d/modloop stop
umount /dev/sda
mv /media/setup/* /media/sda/
mv /lib/setup/* /.modloop/
setup-apkrepos
vi /etc/apk/repositories, enable community
apk update
apk add dosfstools e2fsprogs libarchive-tools pacman arch-install-scripts
parted /dev/sda mklabel gpt mkpart primary fat32 1MiB 513MiB mkpart primary ext4 514mb 100%
mkfs.vfat /dev/sda1
mkfs.ext4 /dev/sda2
mount /dev/sda2 /mnt
mkdir -p /mnt/boot/efi
mount /dev/sda1 /mnt/boot/efi
cd /mnt
wget http://os.archlinuxarm.org/os/ArchLinuxARM-aarch64-latest.tar.gz
bsdtar -xpf /mnt/ArchLinuxARM-aarch64-latest.tar.gz -C /mnt
genfstab -U /mnt >> /mnt/etc/fstab
arch-chroot /mnt/
