#!/bin/bash

# allow anything on localhost
sudo iptables -A INPUT -i lo -j ACCEPT
sudo iptables -A OUTPUT -o lo -j ACCEPT

# allow already established
sudo iptables -A INPUT -m state --state RELATED,ESTABLISHED -j ACCEPT
sudo iptables -A OUTPUT -m state --state RELATED,ESTABLISHED -j ACCEPT

# allow ssh to and from laptop
sudo iptables -A INPUT -i wlan0 -p tcp -m tcp --sport 22 -j ACCEPT
sudo iptables -A INPUT -i wlan0 -p tcp -m tcp --dport 22 -j ACCEPT
sudo iptables -A OUTPUT -o wlan0 -p tcp -m tcp --sport 22 -j ACCEPT
sudo iptables -A OUTPUT -o wlan0 -p tcp -m tcp --dport 22 -j ACCEPT

# allow outgoing http, https and dnscrypt requests
sudo iptables -A OUTPUT -o wlan0 -p tcp -m tcp --dport 80 -j ACCEPT
sudo iptables -A OUTPUT -o wlan0 -p tcp -m tcp --dport 443 -j ACCEPT
sudo iptables -A OUTPUT -o wlan0 -p udp -m udp --dport 443 -j ACCEPT

# allow outgoing ntp requests
sudo iptables -A OUTPUT -o wlan0 -p udp -m udp --dport 123 -j ACCEPT

# # allow outgoing bittorrent requests (i'm a bit hazy on this... hopefully it works)
# sudo iptables -A OUTPUT -o wlan0 -p tcp -m tcp --dport 6881:6999 -j ACCEPT
# sudo iptables -A OUTPUT -o wlan0 -p udp -m udp --dport 6881:6999 -j ACCEPT

# allow outgoing connection to mosh remote
sudo iptables -A OUTPUT -o wlan0 -p udp -m udp --dport 60000:61000 -j ACCEPT

# "default reject" instead of "default drop" to make troubleshooting easier
sudo iptables -A INPUT -j REJECT
sudo iptables -A OUTPUT -j REJECT

# my laptop has no business forwarding packets
sudo iptables -A FORWARD -j REJECT

# I don't use ipv6 and it's buggy and exploitable
sudo ip6tables -A FORWARD -j REJECT
sudo ip6tables -A INPUT -j REJECT
sudo ip6tables -A OUTPUT -j REJECT



echo 1 | sudo tee /proc/sys/net/ipv4/icmp_echo_ignore_broadcasts
for iter in /proc/sys/net/ipv4/conf/*/accept_source_route; do echo 0 | sudo tee $iter; done
for iter in /proc/sys/net/ipv4/conf/*/accept_redirects; do echo 0 | sudo tee $iter; done
for iter in /proc/sys/net/ipv4/conf/*/rp_filter; do echo 1 | sudo tee $iter; done
echo 1 | sudo tee /proc/sys/net/ipv4/tcp_syncookies


# save firewall rules
