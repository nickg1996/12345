#!/usr/bin/env bash

set -e

cd "${0%/*}/.."

echo "Running Rubocop"
bundle exec rubocop
