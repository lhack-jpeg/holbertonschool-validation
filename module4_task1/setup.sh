#!/bin/bash
curl -L https://github.com/gohugoio/hugo/releases/download/v0.109.0/hugo_extended_0.109.0_linux-amd64.deb -o hugo.deb
sudo apt install ./hugo.deb
sudo apt-get install yamllint
npm install -g markdownlint-cli
rm hugo.deb