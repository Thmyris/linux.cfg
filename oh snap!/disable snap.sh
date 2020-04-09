#!/bin/sh
sudo /sbin/iptables -A OUTPUT -d api.snapcraft.io -j DROP
