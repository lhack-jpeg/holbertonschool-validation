#!/bin/bash
curl -L https://github.com/gohugoio/hugo/releases/download/v0.91.2/hugo_0.91.2_Linux-64bit.deb -o hugo.deb
sudo apt install ./hugo.deb
rm hugo.deb