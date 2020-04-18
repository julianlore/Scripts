#!/usr/bin/env bash
# Mainly from https://gist.github.com/Necklaces/18b68e80bf929ef99312b2d90d0cded2
sudo ufw enable
# Deny all
sudo ufw default deny outgoing
sudo ufw default deny incoming
# Allow all traffic on tun0 (openvpn interface)
sudo ufw allow out on tun0 from any to any
sudo ufw allow in on tun0 from any to any
# Allow the port that OpenVPN uses, varies depending on your config
sudo ufw allow out 1194/udp
sudo ufw allow in 1194/udp
# Allow DNS
sudo ufw allow out 53
sudo ufw allow in 53
