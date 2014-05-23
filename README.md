# EasyGo

Custom bash scripts for installing & removing Go (golang.org) and LiteIDE. 

Features:

* build Go from sources
* system-wide installation and removal
* set or remove paths globally in /etc/profile
* bootstrap cross-compile builds
* tested in Ubuntu 14.04

### Install tools
	$ sudo apt-get install gccgo-go git mercurial

### Download Scripts
	$ git clone https://github.com/lee8oi/easygo.git

## Add/Remove Go (golang.org)

### Install
	$ bash easygo/go-install.sh

### Remove
	$ bash easygo/go-remove.sh

## Add/Remove LiteIDE (github.com/visualfc/liteide)

### Install
	$ bash easygo/liteide-install.sh

### Remove
	$ bash easygo/liteide-remove.sh
