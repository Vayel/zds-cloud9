#!/bin/bash

cd ~/workspace/zds-site
npm run gulp build
python manage.py migrate
python manage.py runserver $IP:$PORT

echo "Serveur disponible à l'adresse http://workspace_name.${C9_USER}.c9.io:$PORT"
