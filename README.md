# EasyGo

Custom bash scripts for installing & removing Go (golang.org) and LiteIDE. 

#### Features:

* tested in Ubuntu 14.04
* build Go from sources
* system-wide installation and removal
* set or remove paths globally in /etc/profile
* bootstrap cross-compile builds
* check architecture and grab 32 or 64-bit LiteIDE accordingly

#### Install tools
	$ sudo apt-get install gccgo-go git mercurial
#### Download Scripts
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