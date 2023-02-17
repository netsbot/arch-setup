#!/bin/bash
pacman-key --init
pacman-key --populate archlinuxarm
# [EFI boot]
pacman -Syu grub efibootmgr git nvim
grub-install --efi-directory=/boot/efi --bootloader-id=GRUB
# [grub config]
grub-mkconfig -o /boot/grub/grub.cfg
# [workaround: grub of alarm doesn't detect linux]
echo "linux (hd0,gpt1)/boot/Image.gz root=/dev/sda1" >> /boot/grub/grub.cfg
echo "initrd (hd0,gpt1)/boot/initramfs-linux.img"    >> /boot/grub/grub.cfg
echo boot                                            >> /boot/grub/grub.cfg
sed -i '/PasswordAuthentication/c\PasswordAuthentication no' /etc/ssh/sshd_config
echo "alarm ALL=(ALL:ALL) NOPASSWD: ALL" | sudo tee "/etc/sudoers.d/dont-prompt-alarm-for-sudo-password"
