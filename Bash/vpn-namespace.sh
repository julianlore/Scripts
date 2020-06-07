#!/usr/bin/env bash

# Inspired from https://gist.github.com/jamesmcm/f8d6e9f290f7b128e1b500430789d651

NAMESPACE="vpn_ns"
nsexec () {
	sudo ip netns exec $NAMESPACE $1
}

if [ $# -lt 1 ]
then
	echo "Not enough arguments"
	echo "Example usage: vpn-namespace.sh arg"
else
	case ${1^^} in
		"CREATE")
			sudo ip netns add $NAMESPACE
			# Add loopback
			nsexec "ip addr add 127.0.0.1/8 dev lo"
			nsexec "ip link set lo up"
			# Add veth pair to give internet access to namespace
			sudo ip link add nsdest0 type veth peer name nssource0
			sudo ip link set nsdest0 up
			sudo ip link set nssource0 netns $NAMESPACE up
			# Assign local IP addr and route traffic
			sudo ip addr add 10.200.200.1/24 dev nsdest0
			nsexec "ip addr add 10.200.200.2/24 dev nssource0"
			nsexec "ip route add default via 10.200.200.1 dev nssource0"
			# w+ for wifi, e+ for ethernet
			sudo iptables -t nat -A POSTROUTING -s 10.200.200.0/24 -o w+ -j MASQUERADE
			# ipv4 forwarding
			sudo sysctl -q net.ipv4.ip_forward=1
			# Google DNS
			sudo mkdir -p /etc/netns/$NAMESPACE
			sudo sh -c "echo 'nameserver 8.8.8.8' > /etc/netns/$NAMESPACE/resolv.conf"
			sudo sh -c "echo 'nameserver 8.8.8.8' > /etc/resolv.conf"
			;;
		"DELETE")
			sudo sysctl -q net.ipv4.ip_forward=0
			sudo iptables -t nat -D POSTROUTING -s 10.200.200.0/24 -o w+ -j MASQUERADE
			sudo ip link delete nsdest0
			sudo ip netns delete $NAMESPACE
			sudo rm -rf /etc/netns/$NAMESPACE
			;;
		"SHELL")
			sudo ip netns exec $NAMESPACE sudo -iu `whoami`
			;;
		*)
			sudo ip netns exec $NAMESPACE sudo -iu `whoami` $@
			;;
	esac
fi
