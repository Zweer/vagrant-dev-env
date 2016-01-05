#!/bin/bash

printf "Running Vagrant Provisioning..."

printf "Updating Box..."
# make sure the box is fully up to date
apt-get update
# comment out the line below to disallow the system to upgrade
apt-get upgrade -y && apt-get dist-upgrade -y

printf "Preparing to install MongoDB..."
# import the public key used by apt
apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 7F0CEB10
# create a list file for MongoDB
echo "deb http://repo.mongodb.org/apt/ubuntu "$(lsb_release -sc)"/mongodb-org/3.0 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-3.0.list

printf "Preparing to install nodejs..."
curl -sL https://deb.nodesource.com/setup_5.x | sudo -E bash -

printf "Preparing to install ruby 2.1..."
apt-add-repository ppa:brightbox/ruby-ng -y

printf "Reloading the apt-get configuration..."
# reload the local package database
apt-get update

printf "Installing a few necessary packages..."
# install required packages
apt-get install -y git nodejs mongodb-org redis-server build-essential ruby2.1 ruby2.1-dev zlib1g-dev
# removing useless packages
apt-get autoremove

printf "Backing up config files..."
# backup mongodb-org config file
cp /etc/mongod.conf /etc/mongod.conf.backup
# backup redis-server config file
cp /etc/redis/redis.conf /etc/redis/redis.conf.backup

