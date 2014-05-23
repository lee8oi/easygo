echo "removing existing Go paths from /etc/profile"
sudo sed -i "/^export GOROOT=.*/d" /etc/profile
sudo sed -i "/^export GOPATH=.*/d" /etc/profile
sudo sed -i "/^export PATH=.*\/go\/bin.*/d" /etc/profile

echo "removing go source directory"
sudo rm -rf /usr/local/go

echo "Golang has been removed from your system"
