#!/bin/bash
# NOTE: This script is meant to be run as the vagrant user

printf "Running Post-Install as vagrant user..."

# install common nodejs tools
npm install -g pm2
npm install -g yo
