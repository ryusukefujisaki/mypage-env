#!/bin/bash

set -eux

git clone git@github.com:ryusukefujisaki/mypage-frontend-app.git frontend-app
git clone git@github.com:ryusukefujisaki/nginx.git frontend-nginx
git clone git@github.com:ryusukefujisaki/mypage-backend-app.git backend-app
git clone -b mypage_backend git@github.com:ryusukefujisaki/nginx.git backend-nginx
git clone git@github.com:ryusukefujisaki/mysql.git mysql
