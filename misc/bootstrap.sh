#!/usr/bin/env bash

echo ":: Add scratchbox.list"
echo "deb http://scratchbox.org/debian/ hathor main" \
	     > /etc/apt/sources.list.d/scratchbox.list

echo ":: apt-get"
sudo apt-get -y --force-yes update
sudo apt-get install -y --force-yes \
		xserver-xephyr vim patch curl \
		scratchbox-core \
		scratchbox-devkit-apt-https \
		scratchbox-devkit-autotools-legacy \
		scratchbox-devkit-debian-squeeze \
		scratchbox-devkit-doctools \
		scratchbox-devkit-git \
		scratchbox-devkit-perl \
		scratchbox-devkit-python-legacy \
		scratchbox-devkit-qemu \
		scratchbox-devkit-svn \
		scratchbox-libs \
		scratchbox-toolchain-cs2007q3-glibc2.5-arm7 \
		scratchbox-toolchain-cs2007q3-glibc2.5-i486 \
		scratchbox-toolchain-host-gcc

echo ":: sysctl"
echo "vm.mmap_min_addr = 0" >> /etc/sysctl.conf
sudo sysctl -p

echo ":: get and change maemo-sdk-install"
(
	cd /tmp
	curl http://repository.maemo.org/stable/5.0/maemo-sdk-install_5.0.sh -o ./maemo-sdk-install_5.0.sh
	patch -p 1 < /vagrant/patches/0001-change-from-etch-to-squeeze.patch
	patch -p 1 < /vagrant/patches/0002-no-user-interaction.patch
	chmod a+x maemo-sdk-install_5.0.sh
)

echo ":: sbox-adduser"
/scratchbox/sbin/sbox_adduser vagrant yes

echo ":: start maemo-sdk-install"
sudo -u vagrant -i /tmp/maemo-sdk-install_5.0.sh -d -y -m maemo-sdk-dev
