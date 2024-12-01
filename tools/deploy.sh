#!/bin/bash
set -e # Exit on any error

echo "Starting deployment..."

# Build the site
bundle exec jekyll build

# Deploy the `_site` directory to the `gh-pages` branch
ghp-import -n -p -f _site

echo "Deployment complete!"
