#!/bin/bash
MESSAGE=$1

# To remove unrendered. When editing with RStudio, use the HTML file.
rm _posts/*.Rmd
git init
git add -A .
git commit -m "Auto push: $MESSAGE"
git push origin master
