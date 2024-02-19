#!/bin/bash
MESSAGE=$1
git init
git add -A .
git commit -m "Auto push: $MESSAGE"
git push origin master
