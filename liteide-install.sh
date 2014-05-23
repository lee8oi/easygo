# Download and extract binary to /usr/local/
wget http://hellhawks.net/liteide/liteidex22.linux-64.tar.bz2
sudo tar -xjf liteidex22.linux-64.tar.bz2

echo "Fixing GOROOT in .env files"
for file in liteide/share/liteide/liteenv/*.env
do
        sed -i 's/^GOROOT=.*/GOROOT=\/usr\/local\/go/' $file
done

echo "Moving files to /usr/local"
sudo mv liteide /usr/local

# Create desktop file.
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
echo "Desktop file created."

# Update PATH in  ~/.profile to include LiteIDE bin directory
lpath=/usr/local/liteide/bin
sudo sed -i "/^export PATH=.*liteide.*/d" /etc/profile # Remove existing entry
sudo su -c 'echo "export PATH=\$PATH:/usr/local/liteide/bin" >> /etc/profile'
echo "Done! Re-login to update PATH to include LiteIDE"
