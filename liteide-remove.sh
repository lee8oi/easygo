#!/bin/bash
#
# EasyGo liteide-remove by Lee Forest (lee8oi@gmail.com)
#
# A simple script that performs a system-wide removal of an existing liteide
# installation performed by EasyGo liteide-install.

echo "WARNING you are about to perform a system-wide removal of LiteIDE!"
read -p "CTRL+C to cancel or press any key to continue... " -n1 -s

echo "removing installed files"
sudo rm -rf /usr/local/liteide /usr/share/applications/liteide.desktop
sudo sed -i "/^export PATH=.*liteide.*/d" /etc/profile

echo "LiteIDE has been removed from your system."
