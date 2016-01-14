#!/bin/sh

# Cloud9

sudo locale-gen fr_FR.UTF-8

# Back-end

echo "Y" | sudo apt-get install git python-dev python-setuptools libxml2-dev python-lxml libxslt-dev libz-dev python-sqlparse libjpeg8 libjpeg8-dev libfreetype6 libfreetype6-dev libffi-dev python-pip python-tox

# Front-end

echo "Y" | sudo apt-get install nodejs npm nodejs-legacy
sudo npm install -g npm

# Repo

cd ~/workspace
git clone "$1"
cd ~/workspace/zds-site
git remote add upstream https://github.com/zestedesavoir/zds-site

# Libs back

cat requirements.txt | grep -v "#" | grep -v "lxml" | xargs pip install --upgrade
pip install --upgrade -r requirements-dev.txt
CFLAGS="-O0" pip install --upgrade lxml==3.4.4

# Libs front
