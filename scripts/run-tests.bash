#!/usr/bin/env bash

set -e

cd "${0%/*}/.."

echo "Running rspec"
sudo docker-compose bundle exec app rspec
