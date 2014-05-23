#!/bin/bash
#
# EasyGo liteide-install by Lee Forest (lee8oi@gmail.com)
#
# A simple script that performs a system-wide installation of LiteIDE
# and fixes env files for cross-compilation.

echo "This script assumes you have permission to use sudo."
read -p "CTRL+C to cancel or press any key to continue... " -n1 -s

LOGPATH=$HOME/go-install-log.txt
echo "starting log file ($LOGPATH)"
echo `date` > $LOGPATH

echo "downloading binary archive"
wget http://sourceforge.net/projects/liteide/files/X22/liteidex22.linux-64.tar.bz2
sudo tar -xjf liteidex22.linux-64.tar.bz2

echo "fixing .env files"
for file in liteide/share/liteide/liteenv/*.env
do
        sed -i 's/^GOROOT=.*/GOROOT=\/usr\/local\/go/' $file
done

echo "installing to /usr/local/"
sudo mv liteide /usr/local

echo "creating & installing liteide.desktop"
echo "[Desktop Entry]" >> liteide.desktop
echo "Version=22" >> liteide.desktop
echo "Name=LiteIDE" >> liteide.desktop
echo "GenericName=LiteIDE" >> liteide.desktop
echo "Comment=Development Environment for Go (golang.org)" >> liteide.desktop
echo "Type=Application" >> liteide.desktop
echo "Categories=Development" >> liteide.desktop
echo "Terminal=false" >> liteide.desktop
echo "Icon=/usr/local/liteide/share/liteide/welcome/images/liteide-logo128.png" >> liteide.desktop
echo "Exec=/usr/local/liteide/bin/liteide" >> liteide.desktop
sudo mv liteide.desktop /usr/share/applications/

# Update PATH in /etc/profile to include LiteIDE bin directory
sudo sed -i "/^export PATH=.*liteide.*/d" /etc/profile # Remove existing entry
sudo su -c 'echo "export PATH=\$PATH:/usr/local/liteide/bin" >> /etc/profile'

echo "LiteIDE has been installed system-wide and configured for cross-compiling."
echo "Installation was logged to $LOGPATH, check logs if you have problems."
echo "NOTE: You must re-login to update your environment paths."
