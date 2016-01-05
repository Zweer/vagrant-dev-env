#!/bin/bash
# NOTE: This script is meant to be run as the vagrant user

printf "Running Post-Install as vagrant user..."

# install common nodejs tools
sudo npm install -g pm2
sudo npm install -g yo

# install common gem
gem install bundler
