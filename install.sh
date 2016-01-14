#!/bin/sh

# Cloud9

sudo locale-gen fr_FR.UTF-8

# Back-end

yes | sudo apt-get install git python-dev python-setuptools libxml2-dev python-lxml libxslt-dev libz-dev python-sqlparse libjpeg8 libjpeg8-dev libfreetype6 libfreetype6-dev libffi-dev python-pip python-tox

# Front-end

yes | sudo apt-get install nodejs npm nodejs-legacy
sudo npm install -g npm

# Repo

cd ~/workspace
git clone "$1"
cd zds-site
