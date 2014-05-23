#!/bin/bash
#
# EasyGo go-remove by Lee Forest (lee8oi@gmail.com)
#
# A simple script that performs a system-wide removal of an existing Go
# installation performed by EasyGo go-install.

echo "WARNING you are about to perform a system-wide removal of Go!"
read -p "CTRL+C to cancel or press any key to continue... " -n1 -s

echo "removing existing Go paths from /etc/profile"
sudo sed -i "/^export GOROOT=.*/d" /etc/profile
sudo sed -i "/^export GOPATH=.*/d" /etc/profile
sudo sed -i "/^export PATH=.*\/go\/bin.*/d" /etc/profile

echo "removing go source directory"
sudo rm -rf /usr/local/go

echo "Golang has been removed from your system."
