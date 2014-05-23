# EasyGo

Custom bash scripts for easy installation & removal of Go and LiteIDE X22.

#### Features:
* tested in Ubuntu 14.04
* support 32-bit and 64-bit
* build from official sources
* bootstrap cross-compile builds
* system-wide installation and removal
* set & remove paths globally in /etc/profile
* create liteide.desktop for desktop app menu integration

#### Dependencies
	$ sudo apt-get install gccgo-go git mercurial libpcre3-dev
#### Download
	$ git clone https://github.com/lee8oi/easygo.git
### Install/Remove Go (source code: code.google.com/p/go)
#### Install
	$ bash easygo/go-install.sh
#### Remove
	$ bash easygo/go-remove.sh
### Install/Remove LiteIDE X22 (binary archive: sourceforge.net/projects/liteide/files/X22/)
#### Install
	$ bash easygo/liteide-install.sh
#### Remove
	$ bash easygo/liteide-remove.sh