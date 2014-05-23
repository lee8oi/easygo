sudo rm -rf /usr/local/liteide /usr/share/applications/liteide.desktop
sudo sed -i "/^export PATH=.*liteide.*/d" /etc/profile
echo "Removed LiteIDE"
