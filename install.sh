#!/bin/sh

read -p "Attention, ce script installe les dépendances dans tout le système. Il n'est donc pas conseillé de l'utiliser sur votre propre machine. Continuer ? [O/n]" yn
if [ "$yn" == "n" -o "$yn" == "N" ]
then
  exit
fi

# Cloud9

sudo locale-gen fr_FR.UTF-8

# Back-end

sudo apt-get -y install git python-dev python-setuptools libxml2-dev python-lxml libxslt-dev libz-dev python-sqlparse libjpeg8 libjpeg8-dev libfreetype6 libfreetype6-dev libffi-dev python-pip python-tox

# Front-end

sudo apt-get -y install nodejs npm nodejs-legacy
sudo npm install -g npm

# Repo

cd ~/workspace
git clone "$1"
cd ~/workspace/zds-site
git remote add upstream https://github.com/zestedesavoir/zds-site

# Libs back

sudo cat requirements.txt | grep -v "#" | grep -v "lxml" | xargs pip install --upgrade
sudo pip install --upgrade -r requirements-dev.txt
sudo CFLAGS="-O0" pip install --upgrade lxml==3.4.4

# Libs front
cp package.json package.back.json
cat package.back.json | grep -v "gulp-imagemin" > package.json
npm install
rm package.json
mv package.back.json package.json
sudo reboot
