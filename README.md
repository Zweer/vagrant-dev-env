# vagrant-dev-env

A development environment built on [Vagrant](https://www.vagrantup.com/). Get up and running in about 60 seconds.

## Setup

This environment will allow you to build Node apps with minimal setup. You only need to have a couple of things to get started:

- VirtualBox: https://www.virtualbox.org/
- Vagrant:    https://www.vagrantup.com/

You should be able to use your choice of virtual machines, but I have only tested this in VirtualBox. If you have any problems, be sure to [create an issue](https://github.com/Zweer/vagrant-dev-env/issues).

After you have those set up, you can get started by cloning this repo:

```bash
git clone https://github.com/Zweer/vagrant-dev-env.git dev-env
```

Now, you can move into the new directory and launch the VM:

```bash
cd dev-env
vagrant up
```

Note: Vagrant will download the necessary box automatically if it isn't already on the machine.

After a few minutes of downloading, upgrading, and configuring the box, you will have a fully functional dev environment. A couple of things to keep note of:

- The ```www``` directory is synced to ```/home/vagrant/www```
- Port ```1337``` in the VM is mapped to ```1337``` on localhost

## Included Packages

- [x] Node.js
- [x] MongoDB
- [x] Redis
- [ ] Ruby
- [ ] ...

## Included NPM Packages

- [PM2](https://github.com/Unitech/pm2): Process Manager
- [Yeoman](http://yeoman.io/): Project Scaffolding Tool

#### Customizing Your Installation

If you want to customize your included packages (see the above list), then you can easily do so by changing the ```postinstall.sh``` script. This script is run as the vagrant user, not root.

## Using Windows Hosts

Since Windows file path limits are set to 260 characters by default, Vagrant will mount the ```www``` shared folder as a UNC path. This enables "long paths" in Windows, and should solve the common problem with npm installs failing under a Windows host.

If you'd like more information about how I built this solution into the Vagrant environment, you can view the source of the Vagrantfile or view [this commit](https://github.com/Zweer/vagrant-dev-env/commit/bdf15f2f301e2b1660b839875e34f172ea8be227) where [drmyersii](https://github.com/drmyersii) first implemented it.

If you don't want to enable symlinks in your shared directories (this is enabled by default), you can use ```npm install --no-bin-links``` instead of the standard install method.

## License

[MIT](https://github.com/Zweer/vagrant-dev-env/blob/master/LICENSE)
