#  vagrant-n900-sdk

Build your own Nokia N900 SDK Virtual Machine.

The bootstrap-script is based on code of [this][mwd]-page.

[mwd]: http://wiki.maemo.org/Documentation/Maemo_5_Final_SDK_Installation
       "Maemo 5 Final SDK Installation"

## Depencies

* [virtual box][vbo] or [vmware][vmw]
* [vagrant][vag]

[vbo]: https://www.virtualbox.org "VirtualBox"
[vmw]: http://www.vmware.com      "VMware"
[vag]: http://www.vagrantup.com   "Vagrant Up"

## usage

If you have a vagrant enabled environment, you have only to do a <code>vagrant
up --provision</code> in the directory of the repository.

The installation needs some time. After that you can connect to your vm with
<code>vagrant ssh</code>.


