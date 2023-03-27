#!/bin/bash
set -e

flutter build web --web-renderer  html --base-href='/sorting_view/'

cd ./build/web

git init 
git add -A
git commit -m 'deploy'

git push -f git@github.com:nelsonlpco/sorting_view.git main:gh-pages  