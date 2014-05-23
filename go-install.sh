#!/bin/bash
#
# EasyGo Install by Lee Forest (lee8oi@gmail.com)
#
# A simple script that performs a system-wide installation of Go(golang.org)
# from source and bootstraps for cross-compilation.
#
# Note: Need gccgo-go, git, and mercurial
#
# On Ubuntu 14.04 you could run:
# sudo apt-get install gccgo-go git mercurial
#

echo "Before you proceed you should make sure you install gccgo-go, git, and mercurial."
echo "This script also assumes you have permission to use sudo."
read -p "CTRL+C to cancel or press any key to continue... " -n1 -s

LOGPATH=$HOME/go-install-log.txt
echo "starting log file ($LOGPATH)"
echo `date` > $LOGPATH

GOPATH=
GOROOT=

mkdir ~/gobuild
cd ~/gobuild

echo "downloading Go sources"
hg clone https://code.google.com/p/go 1>> $LOGPATH 2>> $LOGPATH
#cp -r ~/go/src/go .
cd go/src/

echo "building sources"
./all.bash 1>> $LOGPATH 2>> $LOGPATH

echo "downloading cross-compile build scripts"
git clone git://github.com/davecheney/golang-crosscompile.git 1>> $LOGPATH 2>> $LOGPATH
cd ../..

echo "installing Go to /usr/local/go"
sudo mv ~/gobuild/go /usr/local
cd /usr/local/go/src/

echo "preparing cross-compile builds"
sudo su -c 'source golang-crosscompile/crosscompile.bash;go-crosscompile-build-all' 1>> $LOGPATH 2>> $LOGPATH

# Remove existing system-wide Go paths from /etc/profile
echo "removing any existing Go paths from /etc/profile"
sudo sed -i "/^export GOROOT=.*/d" /etc/profile
sudo sed -i "/^export GOPATH=.*/d" /etc/profile
sudo sed -i "/^export PATH=.*\/go\/bin.*/d" /etc/profile

# Add new system-wide Go paths in /etc/profile
echo "setting new Go paths in /etc/profile"
sudo su -c 'echo "export GOROOT=/usr/local/go" >> /etc/profile'
sudo su -c 'echo "export GOPATH=\$HOME/go" >> /etc/profile'
sudo su -c 'echo "export PATH=\$PATH:/usr/local/go/bin:\$GOPATH/bin" >> /etc/profile'

rmdir ~/gobuild

echo "Go has been installed and bootstrapped for cross-compiling!"
echo "Installation was logged to $LOGPATH, check logs if you have problems."
echo "NOTE: You must re-login to update your environment paths."

